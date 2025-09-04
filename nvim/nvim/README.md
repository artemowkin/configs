# NeoVim config

It's my neovim config

## Setup

### Dependencies

```
sudo dnf install gcc g++
```

### packer.nvim

First of all install vim-plug

```
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
```

### LSP

Install the python LSP server:

```
npm install -g pyright
```

And go LSP server

```
sudo dnf install golang-x-tools-gopls
```

### Installing

After installing the vim-plug copy all files from repository to `~/.config/nvim` directory

Open NeoVim and install plugins

```
:PackerSync
```

