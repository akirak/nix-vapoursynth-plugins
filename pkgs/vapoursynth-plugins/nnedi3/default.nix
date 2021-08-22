{ pname
, src
, version
, stdenv
, lib
, autoreconfHook
, pkg-config
, yasm
, vapoursynth
, runCommandNoCC
}:
let
  drv = import ./bin.nix {
    inherit pname src version stdenv
      lib
      autoreconfHook
      pkg-config
      yasm
      vapoursynth;
  };
in
runCommandNoCC "${pname}-wrapper-${version}"
{
  propagatedBuildInputs = [ drv ];
} ''
  mkdir -p $out/lib/vapoursynth
  ln -s -t $out/lib/vapoursynth ${drv}/share/nnedi3/nnedi3_weights.bin
''
