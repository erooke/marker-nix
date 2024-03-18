let
  provide-package = name: path: python-final: python-prev: {
    "${name}" = python-final.callPackage path {};
  };
in
  final: prev: {
    pythonPackagesExtensions =
      (prev.pythonPackagesExtensions or [])
      ++ [
        (provide-package "pypdfium2" ./pypdfium2.nix)
        (provide-package "streamlit-drawable-canvas-jsretry" ./streamlit-drawable-canvas.nix)
        (provide-package "huggingface-hub" ./huggingface-hub.nix)
        (provide-package "texify" ./texify.nix)
      ];
  }
