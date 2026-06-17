-- lua/plugins/treesitter.lua
-- Silence nvim-treesitter's per-parser install progress
-- ("[nvim-treesitter/install/<lang>]: Compiling parser", "Installing parser",
-- "Language installed", "Installed N/N languages") during HEADLESS runs — i.e.
-- the neolazy bootstrap, where parsers auto-install across several stages and
-- the progress is just noise. Interactive sessions keep the progress, and
-- warnings/errors are never suppressed (only the info level is).
--
-- The logger has no level switch, but `Logger` is exposed on the module and all
-- info messages route through `Logger:info`, so overriding it to a no-op
-- silences them. This runs in `opts` (before the plugin's config() kicks off
-- the auto-install) and the log module is loadable by then.
return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      if #vim.api.nvim_list_uis() == 0 then
        pcall(function()
          require("nvim-treesitter.log").Logger.info = function() end
        end)
      end
      return opts
    end,
  },
}
