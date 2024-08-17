{
  enable = true;
  servers = {
    cssls.enable = true;
    docker-compose-language-service.enable = true;
    dockerls.enable = true;
    emmet-ls.enable = true;
    eslint.enable = true;
    helm-ls.enable = true;
    html.enable = true;
    jsonls.enable = true;
    lua-ls.enable = true;
    nixd.enable = true;
    # pyright.enable = true;
    pylsp.enable = true;
    pylyzer.enable = true;
    # ruff-lsp.enable = true;
    # ruff.enable = true;
    sqls.enable = true;
    tsserver.enable = true;
    yamlls.enable = true;
  };
  keymaps = (import ./keymaps.nix).lsp;
}
