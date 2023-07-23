# lunaria-tmux

A tmux theme based on the [Lunaria](https://lunaria.design) color palette.

Please note, that not everything has been styled yet. If you find anything that
misses styling, please open an issue or create a PR.

## Installation

### Using Tmux Plugin Manager (tpm)

```
set -g @plugin '0x1DA117/lunaria-tmux'
```

## Customiztion

```
set -g @lunaria-flavor 'light' # or dark, eclipse
```

## Development

### Building the Theme Files

Usually this shouldn't be necessary unless the Lunaria color palette changes.
The current theme files have been generated using a version of Lunaria from an
open [PR](https://github.com/dfoxfranke/lunaria/pull/16).

To generate the theme files you need to clone the
[Lunaria Repo](https://github.com/dfoxfranke/lunaria), because this contains
`lunarize.py` script.

```bash
$ python3 /path/to/lunarize.py \
    /path/to/lunaria-light.json \
    template.tmuxtheme > lunaria-light.tmuxtheme

$ python3 /path/to/lunarize.py \
    /path/to/lunaria-dark.json \
    template.tmuxtheme > lunaria-dark.tmuxtheme

$ python3 /path/to/lunarize.py \
    /path/to/lunaria-eclipse.json \
    template.tmuxtheme > lunaria-eclipse.tmuxtheme
```
