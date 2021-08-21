# How to contribute to this project

## Instructions

### Updating dependencies

If you have Nix with flakes support, you can use [nvfetcher](https://github.com/berberman/nvfetcher)
to update the dependencies:

```sh
nix run github:berberman/nvfetcher
```

### Adding a new plugin

Add a package to the `flake.nix` in this repository.
