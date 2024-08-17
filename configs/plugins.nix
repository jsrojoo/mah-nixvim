{
  # cmp = import ./cmp.nix;
  endwise.enable = true;
  # flash.enable = true;
  # cmp-buffer.enable = true;
  # cmp-nvim-lsp.enable = true;
  # cmp-path.enable = true;
  # cmp_luasnip.enable = true;
  comment.enable = true;
  # conform-nvim = import ./plugins/conform-nvim.nix;
  coverage.enable = true;
  # dap.enable = true;
  # dap.extensions.dap-python.enable = true;
  # firenvim.enable = true;
  # friendly-snippets.enable = true;
  fugitive.enable = true;
  fzf-lua.enable = true;
  gitsigns.enable = true;
  sleuth.enable = true;
  indent-blankline.enable = true;
  # # jupytext.enable = true;
  # lsp-format.enable = true;
  packer = {
    enable = true;
    plugins = [
      # "dgagn/diagflow.nvim"
      # "samjwill/nvim-unception"
      "tpope/vim-dadbod"
      "kristijanhusak/vim-dadbod-ui"
      "kristijanhusak/vim-dadbod-completion"
    ];
  };
  lsp = import ./lsp.nix;
  luasnip.enable = true;
  nix.enable = true;
  none-ls = import ./plugins/none-ls.nix;
  nvim-autopairs.enable = true;
  surround.enable = true;
  tmux-navigator.enable = true;
  # # treesitter-context.enable = true;
  # treesitter-refactor.enable = true;
  # treesitter-textobjects.enable = true;
  treesitter.enable = true;
  # ts-autotag.enable = true;
  # ts-context-commentstring.enable = true;
  # typescript-tools.enable = true;
}
