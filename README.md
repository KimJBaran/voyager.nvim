# Voyager Neovim Theme

A visually soothing theme (a.k.a. colorscheme) for Neovim that is AAA conformant with [Web Content Accessibility Guidelines (WCAG)](https://www.w3.org/TR/WCAG22/). Its colors provide enough contrast to be readable without being too bright. The palette uses analogous colors to discern syntax without being interruptive. Signal colors are applied to convey meaning without breaking color symbolism.

*Note:* This theme needs a full color terminal such as [WezTerm](https://wezterm.org/) (recommended) or [iTerm2](https://iterm2.com/) to display RGB colors.

Integration support:

* [gitui](https://github.com/gitui-org/gitui) by [Stephan D.](https://www.linkedin.com/in/stephandilly/)
* [lualine](https://github.com/nvim-lualine/lualine.nvim) by [Shadman Saleh](https://www.linkedin.com/in/shadman-saleh/)
* [WezTerm](https://wezterm.org/) by [Wez Furlong](https://www.linkedin.com/in/wezfurlong/)

## Installation

LazyVim: create a new plugin (for example, `~/.config/nvim/lua/plugins/themes.lua`) with the following contents:

```
return {
  {
    "kimjbaran/voyager.nvim",
    lazy = false,
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "voyager",
      -- With transparent background:
      -- colorscheme = "voyager-transparent",
    },
  },
}
```

To load the lualine as shown in the exammples, add the following to `~/.config/nvim/init.lua`:

```
require("voyager").lualine()
```

## Examples

### Main editor

![maineditor](https://github.com/user-attachments/assets/4d54f7e3-a400-4d57-9fb3-952e2917ee2f)

### Explorer snacks and LazyVim menu

![explorersnacks](https://github.com/user-attachments/assets/8feac2e3-ca00-4635-af9a-42d83651db5f)

### Trouble's Symbols

![troublesymbols](https://github.com/user-attachments/assets/b4b98932-f4d5-4d84-8f2b-3d33c03c886e)

### gitui

![gitui](https://github.com/user-attachments/assets/9bf31f38-3ed4-4c7f-8f52-98367c0563f6)

## Acknowledgements

Early versions of the Voyager theme were based on [Sami Harju](https://github.com/samharju)'s [Serene](https://github.com/samharju/serene.nvim) theme.
