# az-nvim

A Neovim plugin to interact with Azurite, the Azure Storage emulator.

## Installation

Use your favorite plugin manager to install `az-nvim`. For example, with `vim-plug`:

```vim
Plug 'abenteuerzeit/az-nvim'
```

## Usage

This plugin provides the following commands:

- `:AzStartAzurite [backend]`: Starts Azurite using either the Docker image (default) or the NPM package.
- `:AzStopAzurite`: Stops the running Azurite instance.
- `:AzCleanAzurite`: Cleans the Azurite workspace by removing all data.

## Configuration

By default, the plugin will use the Docker image to run Azurite if available, or fallback to the NPM package. You can customize the backend by providing the `backend` argument to the `:AzStartAzurite` command (`docker` or `npm`).

The plugin also uses `~/.azurite` as the default workspace location. You can modify this by changing the `s:azurite_workspace` variable in `autoload/az_nvim.vim`.

## Requirements

- Docker (for using the Docker backend)
- Azurite NPM package (for using the NPM backend)

