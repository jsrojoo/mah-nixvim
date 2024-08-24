{
	description = "mah-nixvim";

	inputs.nixvim.url = "github:nix-community/nixvim";
	inputs.nixpkgs.url = "github:NixOS/nixpkgs";

	outputs = {
		self,
		nixvim,
		nixpkgs,
		flake-parts,
		} @ inputs: let

			pkgs = import <nixpkgs> { confgs = {}; overlays = []; };

			config = {
				colorschemes.rose-pine.enable = true;

				clipboard.register = "unnamed,unnamedplus";

				opts = import ./configs/opts.nix;

				globals.mapleader = " ";

				extraConfigVim = (builtins.readFile ./configs/init.vim);
				extraConfigLua = (builtins.readFile ./configs/init.lua);

				extraPlugins = with pkgs.vimPlugins; [
					(pkgs.vimUtils.buildVimPlugin {
						name = "screenkey";
						src = pkgs.fetchFromGitHub {
							owner = "NStefan002";
							repo = "screenkey.nvim";
							rev = "b1516d5";
							hash = "sha256-gCKZLMkdGQ8u/5fsM1Iv+eGF7wRdXr7mB/tu37uJozo=";
						};
					})
					vim-smalls
					quick-scope
				];

				plugins = {
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
              mappings = {
                "<C-Space>" = "cmp.mapping.complete()";
                "<C-u>" = "cmp.mapping.scroll_docs(-4)";
                "<esc>" = "cmp.mapping.close()";
                "<C-d>" = "cmp.mapping.scroll_docs(4)";
                "<tab>" = "cmp.mapping.confirm({ select = true })";
                "<C-k>" = "cmp.mapping(cmp.mapping.select_prev_item(), {'i', 's'})";
                "<C-j>" = "cmp.mapping(cmp.mapping.select_next_item(), {'i', 's'})";
              };
            };
          };
					lsp = {
						enable = true;
						servers = {
							nixd = {
								enable = true;
							};
						};
					};
					treesitter = {
						enable = true;
						folding = true;
						settings = {
							auto_install = false;
							ensure_installed = "all";
							indent = {
								enable = true;
							};
							highlight = {
								additional_vim_regex_highlighting = true;
								custom_captures = { };
								disable = [
									"rust"
								];
								enable = true;
							};
						};
					};
					fzf-lua = {
						enable = true;
						settings = {
							fzf_colors = true;
						};
					};
					gitsigns = {
						enable = true;
					};
				};

				keymaps = [
					{
						mode = "x";
						key = "s";
						action = "<Plug>(smalls)";
						options = { silent = true; };
					}
					{
						mode = "o";
						key = "s";
						action = "<Plug>(smalls)";
						options = { silent = true; };
					}
					{
						mode = "n";
						key = "s";
						action = "<Plug>(smalls)";
						options = { silent = true; };
					}
					{
						mode = "n";
						key = "<leader>fh";
						action = ":FzfLua helptags<cr>";
						options = { silent = true; };
					}
					{
						mode = "n";
						key = "<leader>fk";
						action = ":FzfLua keymaps<cr>";
						options = { silent = true; };
					}
					{
						mode = "n";
						key = "<leader>fc";
						action = ":FzfLua commands<cr>";
						options = { silent = true; };
					}
					{
						mode = "n";
						key = "<leader>cw";
						action = ":FzfLua grep_cword<cr>";
						options = { silent = true; };
					}
					{
						mode = "n";
						key = "<leader>ss";
						action = ":FzfLua blines<cr>";
						options = { silent = true; };
					}
					{
						mode = "n";
						key = "<leader><space>";
						action = ":FzfLua buffers<cr>";
						options = { silent = true; };
					}
					{
						mode = "n";
						key = "<leader>ag";
						action = ":FzfLua live_grep<cr>";
						options = { silent = true; };
					}
					{
						mode = "n";
						key = "<leader>fa";
						action = ":FzfLua files<cr>";
						options = { silent = true; };
					}
					{
						mode = "n";
						key = "<leader>fg";
						action = ":FzfLua git_files<cr>";
						options = { silent = true; };
					}
					{
						mode = "n";
						key = "<leader>q";
						action = ":q!<cr>";
						options = { silent = true; };
					}
					{
						mode = "n";
						key = "<leader>w";
						action = ":w!<cr>";
						options = { silent = true; };
					}
				];

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
