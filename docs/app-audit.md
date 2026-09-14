# App audit — 2026-09-14

The local audit inventoried 153 desktop launchers and the installed terminal tools, then checked the theme integration paths rather than assuming every application reads terminal colors. Personal launcher names and session screenshots are kept outside the public repository.

## Live checks

| App or surface | Result |
| --- | --- |
| Foot | Configuration parsed successfully; live light surface, caret, colored text and selections inspected. |
| Neovim | Syntax, search matches, current search, line numbers, floating surfaces and status line inspected. A local hot-reload bug lost plugin setup after unloading modules; setup is now reapplied. Three consecutive reloads preserve the custom search color and light mode. |
| Herdr 0.8.2 | Removed the user's forced black panel background. Built-in automatic Latte/dark switching starts with light panels and readable tabs in Foot. Checked in an isolated session. |
| tmux | Isolated server starts with light panes, reset session-label styles and palette-derived copy-mode colors. |
| btop | Light CPU/memory panels, meter gradients and labels inspected; selected/banner roles checked in its theme. |
| Lazygit / Lazydocker | Live panel borders, selection rows, and Git diffs inspected. Reproduced dark panels in agent-launched previews with inherited `NO_COLOR=1`; reopening without it restored the configured light colors in both apps. Docker was inspected read-only; the Git diff preview uses a disposable sample repository. |
| Chromium / GTK | Existing Chromium window inspected; desktop preference is `prefer-light` with `Adwaita` and `Yaru-purple` icons. |
| Omarchy bar | Transparent text selection checked across all twelve wallpapers. Dark ink selected for nine light backgrounds; porcelain selected for three dark skies. Light and dark desktop captures inspected. |

## Configuration and output checks

| App group | Result and scope |
| --- | --- |
| Codex | Installed binary includes `catppuccin-latte`; selected explicitly for code blocks. A local theme hook switches between Latte/Mocha when desktop polarity changes, while respecting other manual syntax-theme choices. Running sessions may require `/theme` or reopening. |
| Claude | Generated custom theme has `base: light`, pale code/message surfaces and readable diff colors. Selected `custom:omarchy`; previously the generated theme was unused. |
| Hermes | Active configuration selects the `omarchy` skin. Background, completion panels, status rows, diff and syntax tokens match the installed Hermes skin schema and light palette. |
| Pi | Color-only theme checked. The machine has an install-on-first-run launcher rather than a provisioned Pi runtime, so no live Pi claim is made. |
| OpenCode | Selected `system` in its current TUI configuration. Uses terminal palette and background detection. |
| Alacritty | Generated color config parsed; optional user template replaces amber/red search backgrounds and reversed footer with the selection pair. |
| Ghostty / Kitty / Helix | Omarchy's generated configs checked for resolved values; these runtimes were not present for live checks. |
| bat / eza / Starship | Sample output generated successfully. No explicit background-color escape sequences appeared in the inspected outputs. bat remains on Omarchy's `ansi` theme. |
| fzf | Added a palette-derived user template for normal/matched/selected text and surfaces; option parsing and filtering succeeded. New shells read the generated file. |
| Gum | Generated input, confirm, filter, table, pager and other foreground/background roles checked. |
| Zed | Omazed generated a light palette but Zed still selected One Light/One Dark. Selected Omazed for both system modes so its existing theme hook can supply the current palette. |
| VS Code family / T3 Code / Obsidian / HEY | Existing Omarchy/generated integration paths inspected. App-owned appearance settings or an optional theme/plugin may still need selection; not every runtime was installed or opened. |
| Other desktop apps | GTK/system-aware apps inherit light mode and icons. Browser content, Electron application-owned themes, games, Wine apps and remote terminals can control their own colors; a desktop theme cannot force arbitrary app UI or hard-coded RGB sequences. |

## Distribution checks

- The repository's root is color data and images, with `mode = "light"` and the canonical `omarchy-catppuccin-latte-theme` name.
- Omarchy's actual installed-theme staging function accepted it with no ignored files.
- Rendered without user templates; checked 31 resulting color/config files for resolved placeholders and JSON/TOML syntax, plus Foot's own config validation.
- Optional user templates and local fixes are documented separately; an installed theme does not execute or install them.
- Foreground and all six normal text accents exceed 5.4:1 against the base. The selection pair measures 6.61:1. These are role checks, not whole-application accessibility certification.
- The gallery image is a real 5120 × 2880 desktop capture at the existing 2× display scale and 9 pt terminal font, showing four tiled windows: Neovim, btop, Lazygit, and a shell with Fastfetch. The gallery copy is 1200 × 675 WebP, under 100 KB. The screenshot contains no pointer, notification or personal conversation; editor and Git contents are a disposable Python example.

References: [Omarchy theme manual](https://omarchy.org/manual/making-your-own-theme/), [site submission instructions](https://github.com/omacom/omarchy-site#adding-your-theme), [OpenCode themes](https://opencode.ai/docs/themes/), [Codex syntax-theme setting](https://learn.chatgpt.com/docs/config-file/config-reference), [Lazygit configuration](https://github.com/jesseduffield/lazygit/blob/master/docs/Config.md), [Lazydocker configuration](https://github.com/jesseduffield/lazydocker/blob/master/docs/Config.md). Herdr and the remaining integrations were checked against installed help/configuration and local source.
