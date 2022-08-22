return {
  after = "nvim-cmp",
  require = "hrsh7th/nvim-cmp",
  run = "./install.sh",
  config = function()
    require "user.plugins.cmp-tabnine.config"
  end,
}
