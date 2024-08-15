let
  core = [
    {
      action = ":q!<cr>";
      key = "<leader>q";
      options = {
        silent = true;
      };
    }
    {
      action = ":w<cr>";
      key = "<leader>w";
      options = {
        silent = true;
      };
    }
    {
      action = ":";
      key = ";";
      options = {
        silent = true;
      };
    }
    {
      action = ":set foldmethod=expr<cr>";
      key = "<leader>fs";
      options = {
        silent = true;
      };
    }
    {
      action = ":set foldmethod=indent<cr>";
      key = "<leader>fi";
      options = {
        silent = true;
      };
    }
    {
      mode = ["n" "v"];
      key = "<leader>fd";
      action = "<cmd>lua vim.lsp.buf.format()<cr>";
      options = {
        silent = true;
        desc = "Format";
      };
    }
    {
      mode = ["n" "x" "o"];
      key = "s";
      action = "<cmd>lua require('flash').jump()<cr>";
      options = {
        silent = true;
        desc = "Flash";
      };
    }
  ];
  fzf = [
    {
      action = ":FzfLua files<cr>";
      key = "<leader>fa";
      options = {
        silent = true;
      };
    }
    {
      action = ":FzfLua grep_cword<cr>";
      key = "<leader>cw";
      options = {
        silent = true;
      };
    }
    {
      action = ":FzfLua git_files<cr>";
      key = "<leader>fg";
      options = {
        silent = true;
      };
    }
    {
      action = ":FzfLua buffers<cr>";
      key = "<leader><space>";
      options = {
        silent = true;
      };
    }
    {
      action = ":FzfLua grep_curbuf<cr>";
      key = "<leader>ss";
      options = {
        silent = true;
      };
    }
    {
      action = ":FzfLua grep_project<cr>";
      key = "<leader>ag";
      options = {
        silent = true;
      };
    }
    {
      action = ":FzfLua commands<cr>";
      key = "<leader>fc";
      options = {
        silent = true;
      };
    }
    {
      action = ":FzfLua keymaps<cr>";
      key = "<leader>fk";
      options = {
        silent = true;
      };
    }
  ];
  git_signs = [
    {
      action = ":Gitsigns next_hunk<cr>:Gitsigns preview_hunk<cr>";
      key = "<leader>hn";
      options = {
        silent = true;
      };
    }
    {
      action = ":Gitsigns prev_hunk<cr>:Gitsigns preview_hunk<cr>";
      key = "<leader>hp";
      options = {
        silent = true;
      };
    }
    {
      action = ":Gitsigns stage_hunk<cr>";
      key = "<leader>hs";
      options = {
        silent = true;
      };
    }
    {
      action = ":Gitsigns undo_stage_hunk<cr>";
      key = "<leader>hu";
      options = {
        silent = true;
      };
    }
    {
      action = ":Gitsigns reset_hunk<cr>";
      key = "<leader>hr";
      options = {
        silent = true;
      };
    }
    {
      action = ":Gitsigns toggle_current_line_blame<cr>";
      key = "<leader>tb";
      options = {
        silent = true;
      };
    }
  ];

  fugitive = [
    {
      action = ":G status<cr>";
      key = "<leader>gs";
      options = {
        silent = true;
      };
    }
    {
      action = ":G commit --amend";
      key = "<leader>gca";
      options = {
        silent = true;
      };
    }
  ];
in {
  keymaps = core
  ++ fzf
  ++ fugitive
  ++ git_signs;

  lsp = {
    silent = true;
    lspBuf = {
      gd = {
        action = "definition";
        desc = "Goto Definition";
      };
      gr = {
        action = "references";
        desc = "Goto References";
      };
      gD = {
        action = "declaration";
        desc = "Goto Declaration";
      };
      gI = {
        action = "implementation";
        desc = "Goto Implementation";
      };
      gT = {
        action = "type_definition";
        desc = "Type Definition";
      };
      K = {
        action = "hover";
        desc = "Hover";
      };
      "<leader>cr" = {
        action = "rename";
        desc = "Rename";
      };
    };
    diagnostic = {
      "<leader>dl" = {
        action = "open_float";
        desc = "Line Diagnostics";
      };
      "<leader>dn" = {
        action = "goto_next";
        desc = "Next Diagnostic";
      };
      "<leader>dp" = {
        action = "goto_prev";
        desc = "Previous Diagnostic";
      };
    };
  };
}
