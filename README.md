# Custom NvChad config

My custom config for NvChad. Currently adds at least the following:

- Format on save
- CSS modules LSP
- Adds the "compose" property to cssls
- CSS formatting through postcss
- JS,JSX,TS,TSX formatting through eslint

## Installation

### Custom dependencies

First install the custom dependencies through `npm` _globally_:

```
npm install -g postcss postcss-cli cssmodules-language-server vscode-langservers-extracted
```

For based-pyright we also need to `pip install basedpyright`

### If you dont have NvChad installed yet:

First install all the
[NvChad pre-requisites](https://nvchad.com/docs/quickstart/install#pre-requisites)
and then run the following one-liner to install NvChad with this custom config:

```
git clone -b v2.0 https://github.com/NvChad/NvChad ~/.config/nvim --depth 1 && git clone https://github.com/jur-ng/nvchad-custom-config.git ~/.config/nvim/lua/custom --depth 1 && nvim
```

You might need to execute `:MasonInstallAll` after.

### If you already have NvChad installed:

Simply run:

```
git clone https://github.com/jur-ng/nvchad-custom-config.git ~/.config/nvim/lua/custom --depth 1 && nvim
```

You might need to execute `:MasonInstallAll` after.
