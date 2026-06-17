-- lua/plugins/mason.lua
-- Single source of truth for every Mason tool this config relies on.
-- Uses the extend pattern (vim.list_extend) so tools added by LazyVim extras
-- are preserved rather than overwritten. mason.nvim is keyed by the short name
-- "mason.nvim", so this merges with LazyVim's own mason spec.
return {
  {
    "mason-org/mason.nvim",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, {
        "bash-language-server",
        "beautysh",
        "black",
        "cmakelang",
        "cmakelint",
        "docker-compose-language-service",
        "editorconfig-checker",
        "gh",
        "jdtls",
        "jq",
        "json-lsp",
        "json-repair",
        "lua-language-server",
        "markdownlint-cli2",
        "markdown-toc",
        "marksman",
        "mdformat",
        "neocmakelsp",
        "prettier",
        "pylint",
        "pyright",
        "ruff",
        "rust-analyzer",
        "shellcheck",
        "shfmt",
        "sqlfluff",
        "sqlfmt",
        "stylua",
        "systemdlint",
        "systemd-lsp",
        "taplo",
        "xcode-build-server",
        "xmlformatter",
        "yaml-language-server",
      })
    end,
  },
}
