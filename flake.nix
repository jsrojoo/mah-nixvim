{
  description = "A very basic flake";

  inputs.nixvim.url = "github:nix-community/nixvim";

  outputs = {
    self,
    nixvim,
    flake-parts,
  } @ inputs: let
    config = {
      extraConfigVim = ''
        map <space> <leader>
      '';

      colorschemes.nord.enable = true;
      clipboard.register = "unnamedplus";

      plugins = import ./configs/plugins.nix;
      opts = import ./configs/opts.nix;
      inherit (import ./configs/keymaps.nix) keymaps;
      autoCmd = import ./configs/autocommands.nix;
    };
  in
    flake-parts.lib.mkFlake {inherit inputs;} {
      systems = [
        "aarch64-darwin"
        "aarch64-linux"
        "x86_64-darwin"
        "x86_64-linux"
      ];

      perSystem = {
        pkgs,
        system,
        ...
      }: let
        nixvim' = nixvim.legacyPackages."${system}";
        nvim = nixvim'.makeNixvim config;
      in {
        packages = {
          inherit nvim;
          default = nvim;
        };
      };
    };
}
