{
  description = "My nixos setup";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";

	home-manager = {
      url = "github:nix-community/home-manager";
	  inputs.nixpkgs.follows = "nixpkgs";
	};
  };

  outputs = { self, nixpkgs, ... }@inputs: 
  let
    system = "x86_64-linux";
	#pkgs = nixpkgs.legacyPackages.${system};

    pkgs = import nixpkgs {
	  inherit system;

	  config ={
	    allowUnfree = true;
	  };
	};

  in
  {
    nixosConfigurations = {
      nicekoffer = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs;};
        modules = [
          ./hosts/nicekoffer/configuration.nix
		  inputs.home-manager.nixosModules.default
        ];
      };
      weisskoffer = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs;};
        modules = [
          ./hosts/weisskoffer/configuration.nix
		  inputs.home-manager.nixosModules.default
        ];
      };
  };
  #packages.x86_64-linux.hello = nixpkgs.legacyPackages.x86_64-linux.hello;
  #packages.x86_64-linux.default = self.packages.x86_64-linux.hello;
  };
}
