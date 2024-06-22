{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = {
    self,
    nixpkgs,
    flake-utils,
    ...
  }:
    flake-utils.lib.eachDefaultSystem (system: {
      packages.default = with (import nixpkgs {inherit system;});
        runCommand "cosmicreach-prism-instance" {
          buildInputs = [bash coursier jq tera-cli];
          src = ./.;
        } ''
          bash $src/scripts/render.sh $src/templates/ ./rendered/ "$(cat $src/data.json)"
          mkdir $out
          cp ./rendered/* $out -r
        '';
    });
}
