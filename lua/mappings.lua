require "nvchad.mappings"
local snipe = require "snipe"
local harpoon = require "harpoon"
-- local blink = require "blink"
local telescope_builtin = require "telescope.builtin"

-- add yours here

local map = vim.keymap.set
local del = vim.keymap.del

-- map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map("i", "<A-CR>", "<End><CR>", { desc = "C-CR moves the cursor to new line" })

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

-- silence nvchad's inbuilt mappingsfor code actions and references
del("n", "gra") -- removed code actions
del("n", "grr") -- removed goto references
del("n", "gri") -- removed goto implementations
del("n", "grn") -- removed rename(grn doesn't make sense)
del("n", "<leader>rn") -- removed toggling relative numbers

-- added personalized versions of deleted mappings above.
map("n", "gr", function()
  telescope_builtin.lsp_references {
    entry_maker = function(entry)
      local filename = vim.fn.fnamemodify(entry.filename, ":t") -- just the file name
      local line = entry.lnum or 0
      local raw_text = entry.text or ""

      local cleaned_text = raw_text:gsub("^%s+", ""):gsub("%s+$", "")

      return {
        value = entry,
        display = string.format("%s:%d → %s", filename, line, cleaned_text),
        ordinal = filename .. " " .. cleaned_text,
        filename = entry.filename,
        lnum = line,
        col = entry.col,
        bufnr = entry.bufnr,
      }
    end,
  }
end, { noremap = true, silent = true, desc = "Goto [R]eferences" })
map("n", "gI", function()
  telescope_builtin.lsp_implementations()
end, { noremap = true, silent = true, desc = "Goto [I]mplementations" })
map("n", "<leader>rn", vim.lsp.buf.rename, { desc = "[R]e[n]ame" })
map("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "[C]ode [A]ction" })
map("v", "<leader>ca", function()
  vim.lsp.buf.range_code_action()
end, { desc = "Code actions for selected text", noremap = true, silent = true })

-- remove diagnostic loclist
del("n", "<leader>ds") -- removed diagnostic loclist

-- moved the diagnostic loclist to di
map("n", "<leader>di", vim.diagnostic.setloclist, { desc = "LSP diagnostic loclist" })
map("n", "<leader>ds", "<cmd>Telescope lsp_document_symbols<CR>", { desc = "Telescope document symbols" })
map("n", "<leader>ws", function()
  require("telescope.builtin").lsp_dynamic_workspace_symbols()
end, { desc = "Telescope document symbols" })
map("n", "<leader>fr", telescope_builtin.resume, { desc = "resume previous search" })

-- tab related mappings
map("n", "<leader>tn", "<cmd>tabnew<CR>", { desc = "New Tab" })
map("n", "<leader>tc", "<cmd>tabclose<CR>", { desc = "Close Tab" })
map("n", "<leader>to", "<cmd>tabonly<CR>", { desc = "Close Other Tabs" })
map("n", "<leader>tt", "<cmd>tabnext<CR>", { desc = "Next Tab" })
map("n", "<leader>tp", "<cmd>tabprevious<CR>", { desc = "Previous Tab" })

harpoon:setup()

vim.keymap.set("n", "<leader>a", function()
  harpoon:list():add()
end)
vim.keymap.set("n", "<C-o>", function()
  harpoon.ui:toggle_quick_menu(harpoon:list())
end)

vim.keymap.set("n", "<leader>1", function()
  harpoon:list():select(1)
end)
vim.keymap.set("n", "<leader>2", function()
  harpoon:list():select(2)
end)
vim.keymap.set("n", "<leader>3", function()
  harpoon:list():select(3)
end)
vim.keymap.set("n", "<leader>4", function()
  harpoon:list():select(4)
end)

-- Toggle previous & next buffers stored within Harpoon list
vim.keymap.set("n", "<C-S-P>", function()
  harpoon:list():prev()
end)
vim.keymap.set("n", "<C-S-N>", function()
  harpoon:list():next()
end)

harpoon:extend {
  UI_CREATE = function(cx)
    vim.keymap.set("n", "<C-v>", function()
      harpoon.ui:select_menu_item { vsplit = true }
    end, { buffer = cx.bufnr })

    vim.keymap.set("n", "<C-x>", function()
      harpoon.ui:select_menu_item { split = true }
    end, { buffer = cx.bufnr })

    vim.keymap.set("n", "<C-t>", function()
      harpoon.ui:select_menu_item { tabedit = true }
    end, { buffer = cx.bufnr })
  end,
}

local harpoon_extensions = require "harpoon.extensions"
harpoon:extend(harpoon_extensions.builtins.highlight_current_file())

-- Snipe mappings

map("n", "<leader><leader>", function()
  snipe.open_buffer_menu()
end, { desc = "Open Snipe buffer menu" })

-- blink opts
-- blink.select_next

-- map("n", "<leader>fk", require("conform").format { async = true, lsp_format = "fallback" }, { desc = "Format Buffer" })
