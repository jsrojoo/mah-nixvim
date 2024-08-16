let
  core = [
    {
      key = "<leader>q";
      action = ":bdel!<cr>";
      options = {
        silent = true;
      };
    }
    {
      key = "<leader>w";
      action = ":w<cr>";
      options = {
        silent = true;
      };
    }
    {
      key = ";";
      action = ":";
      options = {
        silent = true;
      };
    }
    {
      key = "<leader>fs";
      action = ":set foldmethod=expr<cr>";
      options = {
        silent = true;
      };
    }
    {
      key = "<leader>fi";
      action = ":set foldmethod=indent<cr>";
      options = {
        silent = true;
      };
    }
    {
      key = "<leader>fd";
      mode = ["n" "v"];
      action = "<cmd>lua vim.lsp.buf.format()<cr>";
      options = {
        silent = true;
        desc = "Format";
      };
    }
    {
      key = "s";
      mode = ["n" "x" "o"];
      action = "<cmd>lua require('flash').jump()<cr>";
      options = {
        silent = true;
        desc = "Flash";
      };
    }
  ];
  term = [
    {
      key = "<C-a>q";
      action = "<C-\\><C-n>";
      mode = "t";
      options = {
        silent = true;
      };
    }
  ];
  fzf = [
    {
      key = "<leader>fa";
      action = ":FzfLua files<cr>";
      options = {
        silent = true;
      };
    }
    {
      key = "<leader>cw";
      action = ":FzfLua grep_cword<cr>";
      options = {
        silent = true;
      };
    }
    {
      key = "<leader>fg";
      action = ":FzfLua git_files<cr>";
      options = {
        silent = true;
      };
    }
    {
      key = "<leader><space>";
      action = ":FzfLua buffers<cr>";
      options = {
        silent = true;
      };
    }
    {
      key = "<leader>ss";
      action = ":FzfLua grep_curbuf<cr>";
      options = {
        silent = true;
      };
    }
    {
      key = "<leader>ag";
      action = ":FzfLua grep_project<cr>";
      options = {
        silent = true;
      };
    }
    {
      key = "<leader>fc";
      action = ":FzfLua commands<cr>";
      options = {
        silent = true;
      };
    }
    {
      key = "<leader>fk";
      action = ":FzfLua keymaps<cr>";
      options = {
        silent = true;
      };
    }
  ];
  git_signs = [
    {
      key = "<leader>hn";
      action = ":Gitsigns next_hunk<cr>:Gitsigns preview_hunk<cr>";
      options = {
        silent = true;
      };
    }
    {
      key = "<leader>hp";
      action = ":Gitsigns prev_hunk<cr>:Gitsigns preview_hunk<cr>";
      options = {
        silent = true;
      };
    }
    {
      key = "<leader>hs";
      action = ":Gitsigns stage_hunk<cr>";
      options = {
        silent = true;
      };
    }
    {
      key = "<leader>hu";
      action = ":Gitsigns undo_stage_hunk<cr>";
      options = {
        silent = true;
      };
    }
    {
      key = "<leader>hr";
      action = ":Gitsigns reset_hunk<cr>";
      options = {
        silent = true;
      };
    }
    {
      key = "<leader>tb";
      action = ":Gitsigns toggle_current_line_blame<cr>";
      options = {
        silent = true;
      };
    }
  ];

  fugitive = [
    {
      key = "<leader>gs";
      action = ":G<cr>";
      options = {
        silent = true;
      };
    }
    {
      key = "<leader>gcm";
      action = ":G commit<cr>";
      options = {
        silent = true;
      };
    }
    {
      key = "<leader>gca";
      action = ":G commit --amend";
      options = {
        silent = true;
      };
    }
  ];
in {
  keymaps = core
  ++ term
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
