# A collection of VapourSynth plugins in a Nix flake

[![.github/workflows/build.yml](https://github.com/akirak/nix-vapoursynth-plugins/actions/workflows/build.yml/badge.svg)](https://github.com/akirak/nix-vapoursynth-plugins/actions/workflows/build.yml)
[![Cachix Cache](https://img.shields.io/badge/cachix-akirak-blue.svg)](https://akirak.cachix.org)

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

This is an experimental project, and only a limited number of plugins are provided.
At present, the following plugins are provided from this repository:

- `eedi3`
- `bwdif`: Doesn't seem to work in VapourSynth. I don't know how to load the plugin.

My initial goal is to allow applying [QTGMC](http://avisynth.nl/index.php/QTGMC)
to an interlaced video via `nix run`. QTGMC support for VapourSynth is part of
[havsfunc](https://github.com/HomeOfVapourSynthEvolution/havsfunc), so I will
take a look at it.
