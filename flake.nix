{
  description = "Convert PDF to markdown quickly with high accuracy";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";

    pyproject-nix = {
      url = "github:nix-community/pyproject.nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    pyproject-nix,
  }: let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system}.appendOverlays [(import ./nix/overlay.nix)];
    python = pkgs.python311.withPackages (ps: [
      ps.pdfplumber
      ps.scikit-learn
      ps.pillow
      ps.pytesseract
      ps.pymupdf
      ps.pydantic
      ps.pydantic-settings
      ps.transformers
      ps.numpy
      ps.python-dotenv
      ps.torch
      ps.ray
      ps.tqdm
      ps.tabulate
      ps.thefuzz
      ps.python-magic
      ps.pyspellchecker
      ps.ftfy
      ps.nltk
      ps.ocrmypdf
      ps.bitsandbytes
      ps.grpcio
      ps.texify
    ]);
  in {
    formatter.${system} = pkgs.alejandra;

    packages.${system}.default = pkgs.python311Packages.callPackage ./nix/zen-mapper.nix {};

    devShells.${system}.default = pkgs.mkShell {
      buildInputs = [
        python
        pkgs.tesseract5
        pkgs.ghostscript
      ];

      shellHook = ''
        export TESSDATA_PREFIX=${pkgs.tesseract5}/share/tessdata
      '';
    };
  };
}
