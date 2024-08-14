{
  enable = true;
  enableLspFormat = true;
  settings = {
    updateInInsert = false;
  };
  sources = {
    code_actions = {
      gitsigns.enable = true;
      statix.enable = true;
    };
    diagnostics = {
      statix.enable = false;
      yamllint.enable = false;
    };
    formatting = {
      alejandra.enable = true;
      black = {
        enable = true;
        settings = ''
          {
            extra_args = { "--fast" },
          }
        '';
      };
      prettier = {
        enable = true;
        disableTsServerFormatter = true;
        settings = ''
          {
            extra_args = { "--no-semi", "--single-quote" },
          }
        '';
      };
      stylua.enable = true;
      yamlfmt.enable = true;
    };
  };
}
