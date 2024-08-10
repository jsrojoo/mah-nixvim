let
  cmp = {
    enable = true;
    cmdline = {
      "/" = {
        mapping = {
          __raw = "cmp.mapping.preset.cmdline()";
        };
        sources = [
          {
            name = "buffer";
          }
        ];
      };
      ":" = {
        mapping = {
          __raw = "cmp.mapping.preset.cmdline()";
        };
        sources = [
          {
            name = "path";
          }
          {
            name = "cmdline";
            option = {
              ignore_cmds = [
                "Man"
                "!"
              ];
            };
          }
        ];
      };
    };
    settings = {
      mapping = {
        __raw = ''
          cmp.mapping.preset.insert({
          		['<C-b>'] = cmp.mapping.scroll_docs(-4),
          		['<C-f>'] = cmp.mapping.scroll_docs(4),
          		['<C-Space>'] = cmp.mapping.complete(),
          		['<C-e>'] = cmp.mapping.abort(),
          		['<TAB>'] = cmp.mapping.confirm({ select = true }),
          		})
        '';
      };
      snippet = {
        expand = "function(args) require('luasnip').lsp_expand(args.body) end";
      };
      sources = [
        {
          name = "nvim_lsp";
        }
        {
          name = "luasnip";
        }
        {
          name = "path";
        }
        {
          name = "buffer";
        }
      ];
    };
  };
in {
  nix.enable = true;
  fzf-lua.enable = true;
  indent-o-matic.enable = true;
  indent-blankline.enable = true;
  guess-indent.enable = true;
  treesitter.enable = true;
  treesitter-context.enable = true;
  treesitter-refactor.enable = true;
  treesitter-textobjects.enable = true;
  tmux-navigator.enable = true;
  fugitive.enable = true;
  gitsigns.enable = true;
  lsp.enable = true;
  lsp-format.enable = true;
  lsp-lines.enable = true;

  inherit cmp;

  cmp-nvim-lsp.enable = true;
  cmp-path.enable = true;
  cmp-buffer.enable = true;
  cmp_luasnip.enable = true;
  luasnip.enable = true;
  friendly-snippets.enable = true;
  nvim-autopairs.enable = true;
  comment.enable = true;
}
