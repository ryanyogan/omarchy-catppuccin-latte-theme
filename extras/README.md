# Optional local app refinements

Omarchy deliberately does not install executable configuration from a theme repository. Its supported extension point is `~/.config/omarchy/themed/*.tpl`, managed by the user. These templates use the current palette and therefore follow later theme switches too.

Back up an existing user template before replacing it. Copy only the templates for the refinements you want from this directory into `~/.config/omarchy/themed/`, then reapply the theme with `omarchy theme set catppuccin-latte`.

| Template | Effect and activation |
| --- | --- |
| `alacritty.toml.tpl` | Search results and the footer use the readable selection pair instead of amber/red/reversed fills. Alacritty's normal Omarchy import activates it. |
| `fzf.conf.tpl` | Readable picker text, matches and selected rows. Set `FZF_DEFAULT_OPTS_FILE="$HOME/.local/state/omarchy/current/theme/fzf.conf"` in your shell configuration. |
| `tmux.conf.tpl` | Palette-derived copy-mode selection, messages and pane borders. Add `source-file -q ~/.local/state/omarchy/current/theme/tmux.conf` at the end of your tmux config. Reload it in running servers after changing themes. |
| `lazygit.yml.tpl` | Quiet selections, readable inactive rows and highlighted-commit backgrounds. Merge its `gui.theme` values into your own config, or point an otherwise empty config at `~/.local/state/omarchy/current/theme/lazygit.yml`. |
| `lazydocker.yml.tpl` | The same treatment for Docker panels. Merge its `gui.theme` values, or point an otherwise empty config at the generated `lazydocker.yml`. |

For tmux's session label, resetting the entire style avoids leaking a foreground into following text:

```tmux
set -g status-left "#[fg=blue,bg=default,bold] #S #[default] "
```

For Herdr, remove an old `[theme.custom] panel_bg = "black"` override and use its supported automatic switching:

```toml
[theme]
name = "catppuccin-latte"
auto_switch = true
dark_name = "catppuccin"
light_name = "catppuccin-latte"
```

Codex code blocks have their own syntax theme. Select `catppuccin-latte` in `/theme` or set `theme = "catppuccin-latte"` in `[tui]` in `~/.codex/config.toml`. Switch it to a dark syntax theme when changing to a dark desktop theme. For OpenCode, select `system` in its theme menu or `tui.json`.

Omarchy's standard app commands can activate generated agent themes:

```bash
omarchy theme set-claude --activate
omarchy theme set-pi --activate
omarchy theme set-hermes --activate
```

Only run the command for an app you use. Some apps need reopening. A theme can change the terminal's ANSI palette; it cannot reinterpret arbitrary hard-coded RGB backgrounds emitted by a program. ANSI black intentionally remains the light background in Omarchy's light terminal templates so inverse-color TUI labels remain legible.

## Neovim searches

Omarchy bundles an authored Catppuccin configuration for this name, so it takes priority over a user template. For the additional local search treatment, merge these entries into Catppuccin's `custom_highlights` in your own Neovim plugin configuration:

```lua
Search = { fg = "#4c4f69", bg = "#dcddeb" },
IncSearch = { fg = "#4c4f69", bg = "#c8cbe4", bold = true },
CurSearch = { fg = "#4c4f69", bg = "#c8cbe4", bold = true },
LineNr = { fg = "#595c74" },
```

Apply these only to your Latte configuration. A locally authored theme can contain its own `neovim.lua`; a remotely installed theme cannot supply it.

## Dark or uncolored panels in agent-launched apps

An automation runner can pass `NO_COLOR=1` into a graphical terminal. In the checked Lazygit and Lazydocker versions, that suppresses theme colors and can produce a dark panel on this light palette. Reopening without that inherited variable restored the configured colors:

```bash
env -u NO_COLOR lazygit
env -u NO_COLOR lazydocker
```

Use a normal desktop launch environment for interactive previews, including Fastfetch and other tools that honor `NO_COLOR`. This is a per-launch correction; there is no need to globally disable an intentional no-color preference.
