# Neovim Config

This is my personal [Neovim](https://neovim.io) config, pushed to a repo so that I can download it across devices, and made public in the off chance it helps out anybody tripping over the same roadblocks as me.

The guide is based very loosely off of the ["0 to LSP: Neovim RC From Scratch"](https://www.youtube.com/watch?v=w7i4amO_zaE) guide by [ThePrimeagen](https://www.youtube.com/@ThePrimeagen) on YouTube, so feel free to get started with the setup there.

## Getting Started

Before getting started with this configuration, make sure that you have the following prerequisites installed:

1. [Neovim](https://github.com/neovim/neovim/blob/master/INSTALL.md)
2. [packer.nvim](https://github.com/wbthomason/packer.nvim)
3. [Lazygit](https://github.com/jesseduffield/lazygit?tab=readme-ov-file#installation)
4. All the requisite language server dependencies for LSPs required [here](./after/plugin/lsp.lua)

Then clone this repo to `~/.config/nvim` with the following command:

```
git clone https://github.com/b-x-wu/nvim-config.git ~/.config/nvim
```

Lastly, run `nvim ~/.config/nvim` and run `:PackerInstall` to install the packages managed by Packer. You may have to follow it up with a `:PackerSync` to make sure everything is appropriately up to date.

