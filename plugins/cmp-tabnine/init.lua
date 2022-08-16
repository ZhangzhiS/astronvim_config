return {
  "tzachar/cmp-tabnine",
  --[[ event = "InsertEnter", ]]
  after = "nvim-com",
  require = "hrsh7th/nvim-cmp",
  run = "./install.sh",
  config = function()
    require "user.plugins.cmp-tabnine.config"
  end,
}
