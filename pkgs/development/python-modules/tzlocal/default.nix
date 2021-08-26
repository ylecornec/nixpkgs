{ lib, buildPythonPackage, fetchPypi
, pytz }:

buildPythonPackage rec {
  pname = "tzlocal";
  version = "3.0";

  propagatedBuildInputs = [ pytz ];

  src = fetchPypi {
    inherit pname version;
    sha256 = "f4e6e36db50499e0d92f79b67361041f048e2609d166e93456b50746dc4aef12";
  };

  # test fail (timezone test fail)
  doCheck = false;

  pythonImportsCheck = [ "tzlocal" ];

  meta = with lib; {
    description = "Tzinfo object for the local timezone";
    homepage = "https://github.com/regebro/tzlocal";
    license = licenses.cddl;
    maintainers = with maintainers; [ dotlambda ];
  };
}
