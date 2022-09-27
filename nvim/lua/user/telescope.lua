--telescope

local action_state = require "telescope.actions.state"

local actions = require "telescope.actions"

require('telescope').setup{
  defaults = {
      prompt_prefix = "$ ",
      file_ignore_patterns = {"target"},
      pickers = {
          find_files = {
              find_command = { "fd", "--type", "f", "--strip-cwd-prefix" }
          },
      }, 
      mappings = {
          i = {
            ["<M-h>"] = actions.select_horizontal,
            ["<M-v>"] = actions.select_vertical,
          }        
      }
  }
}

require('telescope').load_extension('fzy_native')
require('telescope').load_extension('file_browser')

local mappings = {}

mappings.curr_buf = function() 
  local opt = require('telescope.themes').get_dropdown({height=10, previewer=false})
  require('telescope.builtin').current_buffer_fuzzy_find(opt)
end
return mappings
