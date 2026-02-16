return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
    },
    "nvim-tree/nvim-web-devicons",
  },
  keys = {
    { "<leader>ff", "<cmd>Telescope find_files<CR>",      desc = "Find files" },
    { "<leader>fg", "<cmd>Telescope live_grep<CR>",       desc = "Live grep" },
    { "<leader>fb", "<cmd>Telescope buffers<CR>",         desc = "Buffers" },
    { "<leader>fh", "<cmd>Telescope help_tags<CR>",       desc = "Help" },
    { "<leader>fr", "<cmd>Telescope oldfiles<CR>",        desc = "Recent files" },
    { "<leader>fc", "<cmd>Telescope colorscheme<CR>",     desc = "Colorschemes" },
    { "<leader>fk", "<cmd>Telescope keymaps<CR>",         desc = "Keymaps" },
    { "<leader>fm", "<cmd>Telescope marks<CR>",           desc = "Marks" },
    { "<leader>f/", "<cmd>Telescope search_history<CR>",  desc = "Search history" },
    { "<leader>ft", "<cmd>Telescope todo-comments<CR>",   desc = "TODOs" },
    { "<leader>f:", "<cmd>Telescope command_history<CR>", desc = "Command history" },
    { "<leader>sD", "<cmd>Telescope diagnostics<CR>",     desc = "Diagnostics (project)" },
    {
      "<leader>sd",
      function()
        require("telescope.builtin").diagnostics({ bufnr = 0 })
      end,
      desc = "Diagnostics (buffer)",
    },
  },
  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")
    local layout = require("telescope.actions.layout")

    telescope.setup({
      defaults = {
        prompt_prefix = "Telescope ",
        selection_caret = "➤ ",
        debounce = 120,
        cache_picker = { num_pickers = 10 },
        path_display = { "truncate" },
        sorting_strategy = "ascending",
        layout_strategy = "horizontal",
        file_ignore_patterns = {
          "%.git/",
          "node_modules",
          "serverGeneratedData",
          "Database",
          "dist",
          "build",
          "cache",
          "%.png$",
          "%.jpg$",
          "%.ttf$",
          "%.min.js",
        },

        vimgrep_arguments = {
          "rg",
          "--color=never",
          "--no-heading",
          "--with-filename",
          "--line-number",
          "--column",
          "--smart-case",
          "--hidden",
          "--max-count=5000",
          "--glob=!.git/",
          "--glob=!node_modules/",
          "--glob=!**serverGeneratedData**",
        },
        layout_config = {
          horizontal = {
            prompt_position = "top",
            preview_width = 0.55,
            results_width = 0.8,
          },
          vertical = { mirror = false },
          width = 0.87,
          height = 0.80,
          preview_cutoff = 120,
        },
        mappings = {
          i = {
            ["<C-n>"] = actions.cycle_history_next,
            ["<C-p>"] = actions.cycle_history_prev,
            ["<C-j>"] = actions.move_selection_next,
            ["<C-k>"] = actions.move_selection_previous,
            ["<C-l>"] = layout.toggle_preview,
            ["<C-h>"] = actions.which_key,
            ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
            ["<Esc>"] = actions.close,
          },
          n = {
            ["q"] = actions.close,
            ["l"] = layout.toggle_preview,
          },
        },
      },
      pickers = {
        find_files = { theme = "dropdown", previewer = false },
        buffers = { theme = "dropdown", previewer = false },
        oldfiles = { theme = "dropdown" },
        colorscheme = { enable_preview = true },
        diagnostics = {
          theme = "ivy",
          wrap_results = true,
        },
      },
      extensions = {
        fzf = {
          fuzzy = true,
          override_generic_sorter = true,
          override_file_sorter = true,
          case_mode = "smart_case",
        },
      },
    })

    telescope.load_extension("fzf")
  end,
}
