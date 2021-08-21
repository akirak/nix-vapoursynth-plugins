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
, opencl-headers
, ocl-icd
, boost
,
}:
stdenv.mkDerivation rec {
  inherit pname version src;

  nativeBuildInputs = [
    pkg-config
    meson
    ninja
  ];

  # https://github.com/NixOS/nixpkgs/issues/86131
  BOOST_INCLUDEDIR = "${lib.getDev boost}/include";
  BOOST_LIBRARYDIR = "${lib.getLib boost}/lib";

  mesonFlags = [ "--prefix=${placeholder "out"}" ];

  patches = [
    ./meson-install-dir.patch
  ];

  buildInputs = [
    vapoursynth
    cmake
    opencl-headers
    ocl-icd
    boost
  ];

  meta = with lib; {
    description = "Renewed EEDI3 filter for VapourSynth ";
    homepage = "https://github.com/HomeOfVapourSynthEvolution/VapourSynth-EEDI3";
    license = licenses.gpl2;
    platforms = platforms.all;
  };
}
