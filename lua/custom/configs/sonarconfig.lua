local M = {
  server = {
    cmd = {
     'sonarlint-language-server',
     -- Ensure that sonarlint-language-server uses stdio channel
     '-stdio',
     '-analyzers',
     -- paths to the analyzers you need, using those for python and java in this example
     vim.fn.expand("$MASON/share/sonarlint-analyzers/sonarpython.jar"),
     vim.fn.expand("$MASON/share/sonarlint-analyzers/sonarcfamily.jar"),
     vim.fn.expand("$MASON/share/sonarlint-analyzers/sonarjava.jar"),
    }
  },
  filetypes = {
    'python',
    'cpp',
    'c',
  },
  settings = {
    sonarlint = {
      rules = {
        -- C++ rules
        ["cpp:S6004"] = { level = 'off' }, -- Use the init statement to declare "X" inside the if statement
        ["cpp:S5414"] = { level = 'off' }, -- Don't mix public and private data memebers
        ["cpp:S6003"] = { level = 'off' }, -- Replace this use of "push_back" with "emplace_back with "emplace_back".
        ["cpp:S5020"] = { level = 'off' }, -- Replace "rand" with the facilities in <random>
      }
    }
  }
}
return M
