{
  buildPythonPackage,
  fetchPypi,
  # Build deps
  poetry-core,
  # Deps
  streamlit,
  transformers,
  torch,
  pydantic,
  pydantic-settings,
  pillow,
  numpy,
  pypdfium2,
  python-dotenv,
  watchdog,
  ftfy,
  tabulate,
  streamlit-drawable-canvas-jsretry,
  huggingface-hub,
}: let
  pname = "texify";
  version = "0.1.8";
  src = fetchPypi {
    inherit pname version;
    hash = "sha256-H/dhW1i1U4Gu1yPLJCArEHpewSoaRWT+Ht2NExWz8NE=";
  };
in
  buildPythonPackage {
    inherit pname version;

    inherit src;

    format = "pyproject";

    propagatedBuildInputs = [
      streamlit
      transformers
      torch
      pydantic
      pydantic-settings
      pillow
      numpy
      pypdfium2
      python-dotenv
      watchdog
      ftfy
      tabulate
      streamlit-drawable-canvas-jsretry
      huggingface-hub
    ];

    nativeBuildInputs = [poetry-core];
  }
