{ pkgs, ... }:
let
  # Font files shipped with the site. The web page and WeasyPrint both load
  # them through @font-face in style.css, so the PDF and the page use the same
  # fonts, and the page does not depend on a third-party font CDN.
  fonts = [
    "Geist-Regular"
    "Geist-SemiBold"
  ];
in
{
  env.GEIST_FONTS = "${pkgs.geist-font}/share/fonts/truetype";

  packages =
    builtins.attrValues {
      inherit (pkgs)
        pandoc
        woff2
        miniserve
        watchexec
        pinact
        zizmor
        ;
    }
    ++ [ pkgs.python3Packages.weasyprint ];

  # resume.md -> _site/index.html (pandoc) -> _site/<name>.pdf (WeasyPrint).
  # `_site/` is exactly what GitHub Pages publishes.
  scripts.build.exec = ''
    set -euo pipefail
    cd "$DEVENV_ROOT"
    mkdir -p _site/fonts
    for font in ${toString fonts}; do
      if [ ! -f "_site/fonts/$font.woff2" ]; then
        install -m 644 "$GEIST_FONTS/$font.ttf" "_site/fonts/$font.ttf"
        woff2_compress "_site/fonts/$font.ttf" >/dev/null
        rm "_site/fonts/$font.ttf"
      fi
    done
    cp style.css _site/

    # variant  output dir         path back to the site root
    while read -r variant dir root; do
      mkdir -p "$dir"
      pdf="sergei-iakovlev-cv''${variant:+-$variant}.pdf"
      [ "$variant" = sre ] && pdf="sergei-iakovlev-cv.pdf"
      pandoc resume.md \
        --from markdown \
        --to html5 \
        --standalone \
        --strip-comments \
        --lua-filter variant.lua \
        --template template.html \
        --metadata variant="$variant" \
        --metadata root="$root" \
        --metadata pdf="$pdf" \
        --metadata updated="$(date +'%B %Y')" \
        --output "$dir/index.html"
      weasyprint "$dir/index.html" "$dir/$pdf"
      echo "built $dir/index.html and $dir/$pdf"
    done <<'VARIANTS'
    sre      _site          ./
    platform _site/platform ../
    VARIANTS
  '';

  # Rebuild on every save and serve the result on http://localhost:8000.
  scripts.dev.exec = ''
    set -euo pipefail
    cd "$DEVENV_ROOT"
    build
    miniserve --index index.html --port 8000 _site &
    trap 'kill $!' EXIT
    watchexec --exts md,css,html,lua --ignore '_site/**' -- build
  '';

  git-hooks.hooks = {
    nixfmt.enable = true;
    prettier.enable = true;
    # Markdown (pandoc spans/divs) and the pandoc template are left alone:
    # prettier does not know their syntax and would mangle them.
    prettier.types_or = [
      "css"
      "yaml"
    ];
    prettier.excludes = [ "devenv.lock" ];
  };
}
