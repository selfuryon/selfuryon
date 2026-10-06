# resume

My CV as a single Markdown file, published as a web page and a PDF.

- `resume.md` — the content. Front matter holds the header (name, headline,
  contacts); the body uses a few pandoc extensions, described at the top of
  the file.
- `template.html` — the pandoc HTML template.
- `style.css` — one stylesheet for both outputs: screen rules for the site,
  `@page` / `@media print` for the PDF.

`resume.md` → pandoc → `_site/index.html` → WeasyPrint → `_site/sergei-iakovlev-cv.pdf`.

Two variants are built from the same file by `variant.lua`:

| Variant | Page | PDF |
| --- | --- | --- |
| `sre` — Principal SRE, Ethereum focus | `/` | `sergei-iakovlev-cv.pdf` |
| `platform` — Head of Platform focus | `/platform/` (unlinked, `noindex`) | `platform/sergei-iakovlev-cv-platform.pdf` |

Content is shared unless wrapped in `::: {.only-sre}` / `::: {.only-platform}`
(or `[...]{.only-…}` inline); `variants.<name>` in the front matter overrides
fields such as `headline`. Adjacent bullet lists are merged after filtering, so
a list can be split into shared and variant-only parts.

The page links to the PDF. The font (Geist, regular and semibold) is taken from
nixpkgs, converted to woff2 into `_site/fonts/` and loaded through `@font-face`
by both the browser and WeasyPrint. No font CDN is involved, and the PDF builds
the same locally and in CI.

Section headings carry no letter-spacing on purpose: tracked capitals extract
as "S U M M A R Y" when applicant-tracking systems parse the PDF. Check with
`pdftotext -layout _site/sergei-iakovlev-cv.pdf -` after design changes.

## Usage

```sh
direnv allow     # or: devenv shell
build            # one-off build of both variants into _site/
dev              # rebuild on save, serve on http://localhost:8000
```

HTML comments in `resume.md` are stripped from the output (`--strip-comments`).
Use them for TODOs and notes that should not be published.

## Publishing

`.github/workflows/pages.yml` builds with devenv and deploys `_site/` to
GitHub Pages on every push to `main`. To enable it, go to Settings → Pages →
Source and select **GitHub Actions**.

Name the repository `<user>.github.io` to serve it at the root, or anything
else to serve it at `<user>.github.io/<repo>/`. All paths are relative, so
both work. For a custom domain, add it under Settings → Pages and a `CNAME`
DNS record pointing to `<user>.github.io`.
