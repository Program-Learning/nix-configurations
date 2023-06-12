{config, pkgs, libs, ...}:

{

	environment.systemPackages = with pkgs; [
	vscode
    (vscode-with-extensions.override {
      vscodeExtensions = with vscode-extensions; [
	vscodevim.vim
      	yzhang.markdown-all-in-one
      	ms-vscode.cpptools
      	golang.go
      	pkief.material-icon-theme
      	zhuangtongfa.material-theme
        ms-azuretools.vscode-docker
	vscode-extensions.bbenoist.nix
	vscode-extensions.arrterian.nix-env-selector
	vscode-extensions.jnoortheen.nix-ide
      ];
    })
  ];

}
