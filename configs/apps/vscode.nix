{config, pkgs, libs, ...}:

{

	users.users.nixos.packages = with pkgs; [

	vscode

    (vscode-with-extensions.override {
      vscodeExtensions = with vscode-extensions; [
		# vscodevim.vim
		# yzhang.markdown-all-in-one
		# ms-vscode.cpptools
		# golang.go
		# pkief.material-icon-theme
		# zhuangtongfa.material-theme
		# ms-azuretools.vscode-docker
		# bbenoist.nix
		# arrterian.nix-env-selector
		# jnoortheen.nix-ide
		# llvm-vs-code-extensions.vscode-clangd
		# usernamehw.errorlens
      ];
    })

  ];

}
