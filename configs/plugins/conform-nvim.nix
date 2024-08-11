{
  enable = true;
  formatOnSave = {
    lspFallback = true;
    timeoutMs = 500;
  };
  notifyOnError = true;
  formattersByFt = {
    liquidsoap = ["liquidsoap-prettier"];
    html = [
      [
        "prettierd"
        "prettier"
      ]
    ];
    css = [
      [
        "prettierd"
        "prettier"
      ]
    ];
    javascript = [
      [
        "prettierd"
        "prettier"
      ]
    ];
    javascriptreact = [
      [
        "prettierd"
        "prettier"
      ]
    ];
    typescript = [
      [
        "prettierd"
        "prettier"
      ]
    ];
    typescriptreact = [
      [
        "prettierd"
        "prettier"
      ]
    ];
    python = [
      [
        "ruff_fix"
        "ruff_format"
        "ruff_organize_imports"
      ]
    ];
    lua = ["stylua"];
    nix = ["nixfmt"];
    markdown = [
      [
        "prettierd"
        "prettier"
      ]
    ];
    yaml = [
      "yamllint"
      "yamlfmt"
    ];
  };
}
