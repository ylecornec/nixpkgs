{ buildPythonPackage
, flit-core
, pytestCheckHook
, testpath
}:

buildPythonPackage rec {
  pname = "flit-core";
  inherit (flit-core) version;

  src = flit-core.testsout;

  dontBuild = true;
  dontInstall = true;

  checkInputs = [
    pytestCheckHook
    testpath
  ];
}
