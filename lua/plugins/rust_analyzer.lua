return {
  "AstroNvim/astrolsp",
  ---@type AstroLSPOpts
  opts = {
    config = {
      rust_analyzer = {
        settings = {
          ["rust-analyzer"] = {
            checkOnSave = false,
            cargo = {
              buildScripts = {
                enable = true,
                useCpuCount = false,
              },
            },
            numThreads = 1,
            completion = {
              autoimport = { enable = false },
            },
            hover = {
              actions = { references = { enable = false } },
            },
          },
        },
      },
    },
  },
}
