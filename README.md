# A collection of VapourSynth plugins in a Nix flake

This repository contains `flake.nix` which provides plugins for
[VapourSynth](https://github.com/vapoursynth/vapoursynth), a video processing framework with
simplicity in mind.

It is only part of my experiment with VapourSynth as a NixOS user and never meant to be officially
supported. I will provide this flake for free, and please feel free to use it at your own your risk.

## Usage

The plugins in this repository are provided as Nix packages. Each package follows the naming
convention of `vapoursynth-PLUGIN`, where `PLUGIN` is the name of a plugin.

Each derivation contains a `*.so` file in `lib/vapoursynth` directory. You can use it by either
copying it to your plugin directory or creating a symbolic link to it in the directory.

## List of plugins

This is an experimental project, and only a limited number of plugins are provided at present. The
following is a list of packages provided in this repository.

- `vapoursynth-bwdif`
- `vapoursynth-eedi3`
