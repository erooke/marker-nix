{
  buildPythonPackage,
  fetchPypi,
  # Deps
  streamlit,
  pillow,
  numpy,
}: let
  pname = "streamlit-drawable-canvas-jsretry";
  version = "0.9.3";
  src = fetchPypi {
    inherit pname version;
    hash = "sha256-2dqKhj+u6uAchSHo4oLtg8wVuEWWJRkUmmH8jurXr+Y=";
  };
in
  buildPythonPackage {
    inherit pname version;

    inherit src;

    format = "setuptools";

    propagatedBuildInputs = [
      streamlit
      pillow
      numpy
    ];
  }
