return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    local function my_on_attach(bufnr)
      local api = require("nvim-tree.api")

      local function opts(desc)
        return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
      end
      api.config.mappings.default_on_attach(bufnr)
    end

    local nvimTreeRevealOrToggle = function()
      local api = require("nvim-tree.api")
      local buf_name = vim.api.nvim_buf_get_name(0)

      -- Function to check if nvim-tree is open in any window
      local function is_nvim_tree_open()
        for _, win in ipairs(vim.api.nvim_list_wins()) do
          local buf = vim.api.nvim_win_get_buf(win)
          if vim.bo[buf].filetype == "NvimTree" then
            return true
          end
        end
        return false
      end

      -- Check if the current file exists
      if vim.fn.filereadable(buf_name) == 1 or vim.fn.isdirectory(vim.fn.fnamemodify(buf_name, ":p:h")) == 1 then
        if is_nvim_tree_open() then
          -- Close nvim-tree if it's open
          api.tree.close()
        else
          -- Open nvim-tree and reveal the current file
          api.tree.find_file({ open = true, focus = true })
        end
      else
        -- If the file doesn't exist, just toggle nvim-tree in cwd
        api.tree.toggle({ focus = true })
      end
    end

    local nvimTreeToggleCwd = function()
      local api = require("nvim-tree.api")
      api.tree.toggle({ path = vim.uv.cwd(), focus = true })
    end

    require("nvim-tree").setup({})
    -- custom mappings
    vim.keymap.set("n", "<leader>r", nvimTreeRevealOrToggle)
    vim.keymap.set("n", "<leader>R", nvimTreeToggleCwd)
  end,
}
