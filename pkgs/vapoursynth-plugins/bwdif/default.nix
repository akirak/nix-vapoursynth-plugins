{ pname
, src
, version
, stdenv
, lib
, pkg-config
, meson
, ninja
, vapoursynth
, cmake
}:
stdenv.mkDerivation rec {
  inherit pname version src;

  nativeBuildInputs = [
    pkg-config
    meson
    ninja
  ];

  mesonFlags = [ "--prefix=${placeholder "out"}" ];

  buildInputs = [
    vapoursynth
    cmake
  ];

  patches = [
    ./meson-install-dir.patch
  ];

  meta = with lib; {
    description = "Bwdif filter for VapourSynth ";
    homepage = "https://github.com/HomeOfVapourSynthEvolution/VapourSynth-Bwdif";
    license = licenses.lgpl3;
    platforms = platforms.all;
  };
}
