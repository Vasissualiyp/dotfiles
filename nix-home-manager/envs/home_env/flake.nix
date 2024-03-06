{
  description = "Home python environments";

  inputs.nixpkgs.url = "nixpkgs/nixos-unstable";

  outputs = { self, nixpkgs }: {
    packages.x86_64-linux = {
      general = nixpkgs.legacyPackages.x86_64-linux.python3.withPackages (ps: with ps; [
        numpy
        pandas
      ]);

      vim = nixpkgs.legacyPackages.x86_64-linux.python3.withPackages (ps: with ps; [
        pynvim
        pandas
      ]);

      shellgpt = nixpkgs.legacyPackages.x86_64-linux.python3.withPackages (ps: with ps; [
        scipy
        matplotlib
      ]);
    };
  };
}

