local kind_icons = {
  Text = "",
  Method = "",
  Function = "",
  Constructor = "",
  Field = "ﰠ",
  Variable = "",
  Class = "",
  Interface = "",
  Module = "",
  Property = "",
  Unit = "",
  Value = "",
  Enum = "",
  Keyword = "",
  Snippet = "",
  Color = "",
  File = "",
  Reference = "",
  Folder = "",
  EnumMember = "",
  Constant = "",
  Struct = "פּ",
  Event = "",
  Operator = "",
  TypeParameter = "",
}

local source_mapping = {
	buffer = "[Buf]",
	nvim_lsp = "[LSP]",
	nvim_lua = "[Lua]",
	luasnip = "[LS]",
	cmp_tabnine = "[TN]",
	path = "[Path]",
}

local cmp = require "cmp"
local luasnip = require "luasnip"

return {
  experimental = {
    ghost_text = true,
  },
  view = {
    entries = { name = "custom", selection_order = "near_cursor" },
  },
  window = {
    documentation = {
      border = { "┌", "─", "┐", "│", "┘", "─", "└", "│" },
    },
  },
  formatting = {
    fields = { "abbr", "kind", "menu" },
    format = function(entry, vim_item)
      -- Kind icons
      vim_item.kind = string.format("%s", kind_icons[vim_item.kind])
      -- Source
      local menu = source_mapping[entry.source.name]
      -- local menu = entry.source.name
			if entry.source.name == 'cmp_tabnine' then
				if entry.completion_item.data ~= nil and entry.completion_item.data.detail ~= nil then
					menu = entry.completion_item.data.detail .. ' ' .. menu
				end
				vim_item.kind = ''
			end
			vim_item.menu = menu
      return vim_item
    end,
  },
  sources = {
    { name = "cmp_tabnine" },
  },
  mapping = {
    ["<C-j>"] = cmp.config.disable,
    ["<C-k>"] = cmp.config.disable,
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expandable() then
        luasnip.expand()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, {
      "i",
      "s",
    }),
  },
}
