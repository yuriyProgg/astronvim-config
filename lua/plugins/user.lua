---@type LazySpec
return {

  -- == Добавление плагинов ==

  "andweeb/presence.nvim",
  {
    "ray-x/lsp_signature.nvim",
    event = "BufRead",
    config = function() require("lsp_signature").setup() end,
  },

  -- == Кастомизация интерфейса ==
  
{
    "folke/snacks.nvim",
    opts = {
      dashboard = {
        preset = {
          header = table.concat({
            "██╗   ██╗██╗   ██╗██████╗ ██╗██╗   ██╗██████╗ ██████╗  ██████╗  ██████╗  ██████╗ ",
            "╚██╗ ██╔╝██║   ██║██╔══██╗╚═╝╚██╗ ██╔╝██╔══██╗██╔══██╗██╔═══██╗██╔════╝ ██╔════╝ ",
            " ╚████╔╝ ██║   ██║██████╔╝██╗ ╚████╔╝ ██████╔╝██████╔╝██║   ██║██║  ███╗██║  ███╗",
            "  ╚██╔╝  ██║   ██║██╔══██╗██║  ╚██╔╝  ██╔═══╝ ██╔══██╗██║   ██║██║   ██║██║   ██║",
            "   ██║   ╚██████╔╝██║  ██║██║   ██║   ██║     ██║  ██║╚██████╔╝╚██████╔╝╚██████╔╝",
            "   ╚═╝    ╚═════╝ ╚═╝  ╚═╝╚═╝   ╚═╝   ╚═╝     ╚═╝  ╚═╝ ╚═════╝  ╚═════╝  ╚═════╝ ",
          }, "\n"),
        },
      },
    },
  },

  -- == Исправление конфигурации Luasnip для v6 ==
  {
    "L3MON4D3/LuaSnip",
    config = function(plugin, opts)
      -- В v6 дефолтная конфигурация вызывается стандартным методом Lazy:
      local luasnip = require "luasnip"
      luasnip.setup(opts)
      luasnip.filetype_extend("javascript", { "javascriptreact" })
    end,
  },

  -- == Исправление конфигурации Autopairs для v6 ==
  {
    "windwp/nvim-autopairs",
    config = function(plugin, opts)
      local npairs = require "nvim-autopairs"
      npairs.setup(opts) -- Безопасный вызов вместо старого API astronvim
      
      local Rule = require "nvim-autopairs.rule"
      local cond = require "nvim-autopairs.conds"
      npairs.add_rules(
        {
          Rule("$", "$", { "tex", "latex" })
            :with_pair(cond.not_after_regex "%%")
            :with_pair(cond.not_before_regex("xxx", 3))
            :with_move(cond.none())
            :with_del(cond.not_after_regex "xx")
            :with_cr(cond.none()),
        },
        Rule("a", "a", "-vim")
      )
    end,
  },

  -- == Ваша ИИ-интеграция Supermaven ==
  {
    "supermaven-inc/supermaven-nvim",
    config = function()
      require("supermaven-nvim").setup {
        keymaps = {
          accept_suggestion = "<A-a>",
          clear_suggestion = "<C-]>",
          accept_word = "<C-j>",
        },
        ignore_filetypes = { txt = true },
      }
    end,
  },

  -- == Мультикурсоры ==
  {
    "smoka7/multicursors.nvim",
    event = "VeryLazy",
    dependencies = {
      "nvimtools/hydra.nvim",
    },
    opts = {},
    cmd = { "MCstart", "MCvisual", "MCclear", "MCpattern", "MCvisualPattern", "MCunderCursor" },
    keys = {
      {
        mode = { "v", "n" },
        "<Leader>m",
        "<cmd>MCstart<cr>",
        desc = "Create a selection for selected text or word under the cursor",
      },
    },
  },

  -- == Zen Mode ==
  {
    "folke/zen-mode.nvim",
  },

  -- == Настройка Neo-tree ==
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      window = {
        position = "right",
      },
    },
  },

  -- == Исправление nvim-ts-autotag для корректного старта ==
  {
    "windwp/nvim-ts-autotag",
    opts = {}, -- Обязательно в новых версиях, иначе плагин не инициализируется
  },
}
