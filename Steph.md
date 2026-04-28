# Install

## Setup npm / node

### Config

```sh
cat ~/.config/npm_local.sh

# NPM packages in homedir
export NPM_PACKAGES="${HOME}/.local"

# Tell our environment about user-installed node tools
PATH="${NPM_PACKAGES}/bin:${PATH}"
# Unset manpath so we can inherit from /etc/manpath via the `manpath` command
unset MANPATH  # delete if you already modified MANPATH elsewhere in your configuration
MANPATH="${NPM_PACKAGES}/share/man:$(manpath)"

# Tell Node about these packages
NODE_PATH="${NPM_PACKAGES}/lib/node_modules"
npm config delete prefix
npm config set prefix "${NPM_PACKAGES}"
```

Than source it from you .bashrd/.zshrc

```sh
source ~/.config/npm_local.sh
```

### Check

```sh
npm -v
node -v
npm list -g
```

## Components

[tree-sitter-cli](https://github.com/tree-sitter/tree-sitter/blob/master/crates/cli/README.md)

```sh
npm install -g neovim
npm install -g tree-sitter
npm install -g tree-sitter-cli
npm install -g tailwindcss-language-server
npm install -g prettier
npm install -g @ansible/ansible-language-server

npm list -g
```

[debugby](https://github.com/microsoft/debugpy)

```sh

```
/home/steph/.config/nvim/venv/lib/python3.12/site-packages/debugpy
XXX pip install --user yamllint


### https://medium.com/@vlagache/ma-d%C3%A9couverte-de-neovim-1eb0eec55a23

[neovim provider](https://neovim.io/doc/user/provider/)
:checkhealth
:checkhealth vim.provider

uv tool install --upgrade pynvim

https://tamerlan.dev/a-guide-to-debugging-applications-in-neovim/
