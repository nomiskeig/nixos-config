{ config, lib,...}:
let 
	srcDir = ./.;
	files = builtins.attrNames (builtins.readDir srcDir);
	filteredFiles = lib.filter (name: name != "default.nix") files;
in
{
	home.file = lib.genAttrs filteredFiles (name: {
	source = srcDir + "/${name}";
	target = ".config/nvim/${name}";
	});
}
