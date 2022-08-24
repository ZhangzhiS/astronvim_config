return {
  after = "nvim-cmp",
  run = "./install.sh",
  requires = 'hrsh7th/nvim-cmp',
  config = function()
    require "user.plugins.cmp-tabnine.config"
  end,
}
