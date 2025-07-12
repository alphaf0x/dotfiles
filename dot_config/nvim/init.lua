-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- enable colorizer for all filetypes
require("colorizer").setup()

-- nvim-tree smart toggling
local nvimTreeFocusOrToggle = function()
  local nvimTree = require("nvim-tree.api")
  local currentBuf = vim.api.nvim_get_current_buf()
  local currentBufFt = vim.api.nvim_get_option_value("filetype", { buf = currentBuf })
  if currentBufFt == "NvimTree" then
    nvimTree.tree.toggle()
  else
    nvimTree.tree.focus()
  end
end

vim.keymap.set("n", "<C-Tab>", nvimTreeFocusOrToggle)
