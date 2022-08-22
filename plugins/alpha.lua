local utils = require "core.utils"
local plugins_count = vim.fn.len(vim.fn.globpath(vim.fn.stdpath "data" .. "/site/pack/packer/start", "*", 0, 1))
  + vim.fn.len(vim.fn.globpath(vim.fn.stdpath "data" .. "/site/pack/packer/opt", "*", 0, 1))
local plugins_loaded = vim.fn.len(vim.fn.globpath(vim.fn.stdpath "data" .. "/site/pack/packer/start", "*", 0, 1))
local startify = require "alpha.themes.startify"
return {
  layout = {
    { type = "padding", val = vim.fn.max { 2, vim.fn.floor(vim.fn.winheight(0) * 0.2) } },
    {
      type = "text",
      val = utils.user_plugin_opts("header", {
        " ▄████▄   ▒█████   ▄████▄   ▒█████  ",
        "▒██▀ ▀█  ▒██▒  ██▒▒██▀ ▀█  ▒██▒  ██▒",
        "▒▓█    ▄ ▒██░  ██▒▒▓█    ▄ ▒██░  ██▒",
        "▒▓▓▄ ▄██▒▒██   ██░▒▓▓▄ ▄██▒▒██   ██░",
        "▒ ▓███▀ ░░ ████▓▒░▒ ▓███▀ ░░ ████▓▒░",
        "░ ░▒ ▒  ░░ ▒░▒░▒░ ░ ░▒ ▒  ░░ ▒░▒░▒░ ",
        "  ░  ▒     ░ ▒ ▒░   ░  ▒     ░ ▒ ▒░ ",
        "░        ░ ░ ░ ▒  ░        ░ ░ ░ ▒  ",
        "░ ░          ░ ░  ░ ░          ░ ░  ",
        "░                 ░                 ",

      }, false),
      opts = { position = "center", hl = "DashboardHeader", spacing = 5 },
    },
    { type = "padding", val = 5 },
    {
      type = "group",
      val = {
        utils.alpha_button("LDR f f", "  查找文件  "),
        utils.alpha_button("LDR f o", "  最近文件  "),
        --[[ utils.alpha_button("LDR f p", "P  项目  "), ]]
        utils.alpha_button("LDR f n", "  新建文件  "),
        utils.alpha_button("LDR S l", "  上次回话  "),
      },
      opts = { spacing = 1 },
    },
		{ type = "padding", val = 4 },
    {
      type = "text",
      val = {
        " 编辑器加载了 " .. plugins_loaded .. " 个插件，总共有 " .. plugins_count .. " 个插件 ",
      },
      opts = { position = "center", hl = "DashboardFooter",spacing = 5 },
    },
  },
}
