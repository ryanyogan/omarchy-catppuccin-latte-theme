# Circuit City: optional AI-reactive glow

`backgrounds/002-circuit-city.png` is the circuit-city scene. Its companion `.reactive.json` file marks the towers and racing line that can glow with local AI activity.

On the author's desktop, the separately customized `ryan.background` Omarchy shell plugin renders these paths:

- Rosewater lights follow active Claude turns.
- Lavender lights follow active Codex turns.
- The center and track combine activity from both providers.
- Activity strengthens the glow; it fades back as turns finish or expire.

This responds to local agent activity, not spending, remaining quota, or an account usage percentage. The companion file is inert visual data. The activity reader and background renderer are separate local customizations and are not bundled or installed by this theme. Standard Omarchy installations show the static Circuit City wallpaper.
