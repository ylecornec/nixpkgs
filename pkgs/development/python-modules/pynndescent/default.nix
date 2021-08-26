{ lib
, buildPythonPackage
, fetchPypi
, nose
, scikit-learn
, scipy
, numba
, llvmlite
, joblib
}:

buildPythonPackage rec {
  pname = "pynndescent";
  version = "0.5.4";

  src = fetchPypi {
    inherit pname version;
    sha256 = "221124cbad8e3cf3ed421a4089d80ac5a29d3215e76cb49effc1df887533d2a8";
  };

  propagatedBuildInputs = [
    scikit-learn
    scipy
    numba
    llvmlite
    joblib
  ];

  checkInputs = [
    nose
  ];

  checkPhase = ''
    nosetests
  '';

  meta = with lib; {
    description = "Nearest Neighbor Descent";
    homepage = "https://github.com/lmcinnes/pynndescent";
    license = licenses.bsd2;
    maintainers = [ maintainers.mic92 ];
  };
}
