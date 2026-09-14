[theme]
# Omarchy owns these UI colors; host appearance detection must not override them.
name = "terminal"
auto_switch = false

[theme.custom]
accent = "{{ accent }}"
panel_bg = "{{ background }}"
sidebar_bg = "{{ background }}"
active_row_bg = "{{ selection_background }}"
selection_bg = "{{ selection_background }}"
surface0 = "{{ lighter_background }}"
surface1 = "{{ selection_background }}"
surface_dim = "{{ mix background foreground 45% }}"
overlay0 = "{{ foreground }}"
overlay1 = "{{ mix foreground background 10% }}"
text = "{{ foreground }}"
subtext0 = "{{ mix foreground background 10% }}"
mauve = "{{ magenta }}"
green = "{{ green }}"
yellow = "{{ yellow }}"
red = "{{ red }}"
blue = "{{ blue }}"
teal = "{{ cyan }}"
peach = "{{ orange }}"
