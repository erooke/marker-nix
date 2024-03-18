{
  buildPythonPackage,
  fetchPypi,
}: let
  pname = "pypdfium2";
  version = "4.28.0";
  src = fetchPypi {
    inherit pname version;
    hash = "sha256-XiI/PAtwJAaSe67TzVgawZwqiiVAGQNTh7R64FBR3XE=";
    dist = "py3";
    format = "wheel";
    python = "py3";
    platform = "manylinux_2_17_x86_64.manylinux2014_x86_64";
  };
in
  buildPythonPackage {
    inherit pname version src;
    format = "wheel";
    doCheck = false;
  }
