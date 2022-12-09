local dap = require('dap')                                                                                                                
dap.adapters.lldb = {                                                                                                                      
   type = 'executable',                                                                                                                   
   attach = {                                                                                                                             
      pidProperty = "pid",                                                                                                                
      pidSelect = "ask"                                                                                                                   
   },                                                                                                                                     
   command = '/usr/local/opt/llvm/bin/lldb-vscode', -- my binary was called 'lldb-vscode-11'                                                                   
   env = {                                                                                                                                
      LLDB_LAUNCH_FLAG_LAUNCH_IN_TTY = "YES"                                                                                              
   },                                                                                                                                     
   name = "lldb"                                                                                                                          
}                                                                                                                                         
                                                                                                                                         
dap.configurations.cpp = {                                                                                                                
    {                                                                                                                                         
       name = "Launch",                                                                                                                         
       type = "lldb",                                                                                                                          
       request = "launch",                                                                                                                    
       program = function()                                                                                                                   
          return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')                                                         
       end,                                                                                                                                   
       cwd = '${workspaceFolder}',                                                                                                            
       externalTerminal = false,                                                                                                              
       stopOnEntry = false,                                                                                                                   
       args = {}                                                                                                                              
    },                                                                                                                                        
} 
dap.configurations.c = dap.configurations.cpp
dap.configurations.rust = dap.configurations.cpp

-- keybindings for dap
local function map(mode, lhs, rhs, opts)
  local options = {noremap = true}
  if opts then options = vim.tbl_extend('force', options, opts) end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

vim.keymap.set('n', '<leader>db', dap.toggle_breakpoint, {})
vim.keymap.set('n', '<leader>dc', dap.continue, {})
vim.keymap.set('n', '<leader>di', dap.step_into, {})
vim.keymap.set('n', '<leader>do', dap.step_over, {})
vim.keymap.set('n', '<leader>dr', dap.repl.open, {})
vim.keymap.set('n', '<leader>dr', dap.repl.open, {})
vim.keymap.set('n', '<leader>dl', dap.run_last, {})
vim.keymap.set('n', '<leader>dt', dap.terminate, {})
