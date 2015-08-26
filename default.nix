{ mkDerivation, aeson, base, QuickCheck, servant-client
, servant-mock, servant-server, stdenv, wai
}:
mkDerivation {
  pname = "datadog";
  version = "0.1.0.0";
  sha256 = "19f1lcd73rj2v23cpxjnhby80p3gzlvb92fizw884km26az8y684";
  buildDepends = [
    aeson base QuickCheck servant-client servant-mock servant-server
    wai
  ];
  license = stdenv.lib.licenses.bsd3;
}
