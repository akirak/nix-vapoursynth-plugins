{ pname
, src
, version
, stdenv
, lib
, autoreconfHook
, pkg-config
, yasm
, vapoursynth
}:
stdenv.mkDerivation rec {
  inherit pname version src;

  PREFIX = placeholder "out";

  nativeBuildInputs = [
    autoreconfHook
    pkg-config
  ];

  buildInputs = [
    vapoursynth
    yasm
  ];

  postPatch = ''
    patchShebangs autogen.sh
  '';

  preAutoreconf = ''
    ./autogen.sh
  '';

  meta = with lib; {
    description = "nnedi3 filter for VapourSynth";
    homepage = "https://github.com/dubhater/vapoursynth-nnedi3";
    license = licenses.gpl2;
    platforms = platforms.all;
  };
}
