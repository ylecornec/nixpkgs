{ lib, buildPythonPackage, fetchPypi
, pkgs, async-timeout, hiredis, isPyPy, isPy27
}:

buildPythonPackage rec {
  pname = "aioredis";
  version = "2.0.0";

  disabled = isPy27;

  src = fetchPypi {
    inherit pname version;
    sha256 = "3a2de4b614e6a5f8e104238924294dc4e811aefbe17ddf52c04a93cbf06e67db";
  };

  propagatedBuildInputs = [
    async-timeout
  ] ++ lib.optional (!isPyPy) hiredis;

  # Wants to run redis-server, hardcoded FHS paths, too much trouble.
  doCheck = false;

  meta = with lib; {
    description = "Asyncio (PEP 3156) Redis client library";
    homepage = "https://github.com/aio-libs/aioredis";
    license = licenses.mit;
    maintainers = with maintainers; [ mmai ];
  };
}
