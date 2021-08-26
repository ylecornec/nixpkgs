{ lib
, stdenv
, pythonAtLeast
, pythonOlder
, fetchPypi
, python
, buildPythonPackage
, numpy
, llvmlite
, setuptools
, libcxx
}:

buildPythonPackage rec {
  version = "0.54.0";
  pname = "numba";
  disabled = pythonOlder "3.6" || pythonAtLeast "3.10";

  src = fetchPypi {
    inherit pname version;
    sha256 = "bad6bd98ab2e41c34aa9c80b8d9737e07d92a53df4f74d3ada1458b0b516ccff";
  };

  NIX_CFLAGS_COMPILE = lib.optionalString stdenv.isDarwin "-I${lib.getDev libcxx}/include/c++/v1";

  propagatedBuildInputs = [ numpy llvmlite setuptools ];
  pythonImportsCheck = [ "numba" ];
  # Copy test script into $out and run the test suite.
  checkPhase = ''
    ${python.interpreter} -m numba.runtests
  '';
  # ImportError: cannot import name '_typeconv'
  doCheck = false;

  meta =  with lib; {
    homepage = "http://numba.pydata.org/";
    license = licenses.bsd2;
    description = "Compiling Python code using LLVM";
    maintainers = with maintainers; [ fridh ];
  };
}
