-- Builds one variant of the resume from resume.md.
--
--   pandoc ... --metadata variant=platform --lua-filter variant.lua
--
-- 1. Fields under `variants.<name>` in the front matter override the
--    top-level ones (headline, description, ...).
-- 2. Blocks and spans marked {.only-<name>} are kept, unwrapped, in that
--    variant and dropped from every other one.
-- 3. Bullet lists that end up next to each other are merged, so a list can
--    be split into shared and variant-only parts in the source.

local variant

local function only_target(classes)
  for _, class in ipairs(classes) do
    local name = class:match("^only%-(.+)$")
    if name then
      return name
    end
  end
end

local function pick(el)
  local target = only_target(el.classes)
  if not target then
    return nil
  end
  if target == variant then
    return el.content
  end
  return {}
end

local function merge_lists(blocks)
  local out = pandoc.Blocks({})
  for _, block in ipairs(blocks) do
    local last = out[#out]
    if block.t == "BulletList" and last and last.t == "BulletList" then
      last.content:extend(block.content)
    else
      out:insert(block)
    end
  end
  return out
end

return {
  {
    Meta = function(meta)
      variant = pandoc.utils.stringify(meta.variant or "")
      if variant == "" then
        error("variant.lua: set --metadata variant=<name>")
      end
      local overrides = meta.variants and meta.variants[variant]
      if overrides then
        for key, value in pairs(overrides) do
          meta[key] = value
        end
      end
      meta.variants = nil
      return meta
    end,
  },
  { Div = pick, Span = pick },
  { Blocks = merge_lists },
}
