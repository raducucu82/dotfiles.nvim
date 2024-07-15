return {
  -- telescope.nvim
  {
    'nvim-telescope/telescope.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope-live-grep-args.nvim',
      'nvim-tree/nvim-web-devicons'
    },
    branch = '0.1.x',
    keys = {
      {
        '<leader>ff',
        function()
          return require('telescope.builtin').find_files()
        end,
        desc = 'Files',
      },
      {
        '<C-p>',
        function()
          return require('telescope.builtin').buffers()
        end,
        desc = 'Buffers',
      },
      {
        '<leader>h',
        function()
          return require('telescope.builtin').oldfiles()
        end,
        desc = 'History'
      },
      {
        '<leader>ag',
        function()
          return require('telescope').extensions.live_grep_args.live_grep_args({
            default_text = vim.fn.expand("<cword>")
          })

        end,
        desc = 'Live grep args'
      }
    },
    opts = function()
      -- Don't preview binaries
      local previewers = require('telescope.previewers')
      local Job = require('plenary.job')
      local new_maker = function(filepath, bufnr, opts)
        filepath = vim.fn.expand(filepath)
        ---@diagnostic disable-next-line: missing-fields
        Job:new({
          command = 'file',
          args = { '--mime-type', '-b', filepath },
          on_exit = function(j)
            local mime_type = vim.split(j:result()[1], '/')[1]
            if mime_type == 'text' then
              previewers.buffer_previewer_maker(filepath, bufnr, opts)
            else
              -- maybe we want to write something to the buffer here
              vim.schedule(function()
                vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, { 'BINARY' })
              end)
            end
          end,
        }):sync()
      end

      -- File and text search in hidden files and directories
      local telescopeConfig = require('telescope.config')

      -- Clone the default Telescope configuration
      local vimgrep_arguments = { unpack(telescopeConfig.values.vimgrep_arguments) }

      -- I want to search in hidden/dot files.
      table.insert(vimgrep_arguments, '--hidden')
      -- I don't want to search in the `.git` directory.
      table.insert(vimgrep_arguments, '--glob')
      table.insert(vimgrep_arguments, '!**/.git/*')

      return {
        defaults = {
          vimgrep_arguments = vimgrep_arguments,
          buffer_previewer_maker = new_maker,
          theme = 'tokyonight',
          path_display = { 'smart' },
          file_ignore_patterns = { '.git/' },
          layout_strategy = 'horizontal',
          layout_config = { prompt_position = 'top' },
          sorting_strategy = 'ascending',
          preview = { 
            treesitter = false,
            filesize_limit = 1000,
          }, 
        },
        pickers = { 
            buffers = {
                sort_lastused = true
            }
        },
      }
    end,

    config = function(_, opts)
      require("telescope").setup(opts)
      require("telescope").load_extension("live_grep_args")
    end,
  },
}
