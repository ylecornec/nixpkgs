{ lib, fetchPypi, buildPythonPackage
, gviz-api
, protobuf
, werkzeug
}:

buildPythonPackage rec {
  pname = "tensorboard_plugin_profile";
  version = "2.5.0";
  format = "wheel";

  src = fetchPypi {
    inherit pname version;
    format = "wheel";
    python = "py3";
    sha256 = "f832698d87a773b9a017fc4dd5cf598a1ff942ccfbf3392c83fe12c949ab9f52";
  };

  propagatedBuildInputs = [
    gviz-api
    protobuf
    werkzeug
  ];

  meta = with lib; {
    description = "Profile Tensorboard Plugin.";
    homepage = http://tensorflow.org;
    license = licenses.asl20;
    maintainers = with maintainers; [ ndl ];
  };
}
