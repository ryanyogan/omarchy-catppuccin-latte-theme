[colors.primary]
background = "{{ background }}"
foreground = "{{ foreground }}"

[colors.cursor]
text = "{{ background }}"
cursor = "{{ bright_foreground }}"

[colors.vi_mode_cursor]
text = "{{ background }}"
cursor = "{{ bright_foreground }}"

[colors.search.matches]
foreground = "{{ selection_foreground }}"
background = "{{ selection_background }}"

[colors.search.focused_match]
foreground = "{{ selection_foreground }}"
background = "{{ selection_background }}"

[colors.footer_bar]
foreground = "{{ foreground }}"
background = "{{ selection_background }}"

[colors.selection]
text = "{{ selection_foreground }}"
background = "{{ selection_background }}"

[colors.normal]
black = "{{ background }}"
red = "{{ red }}"
green = "{{ green }}"
yellow = "{{ yellow }}"
blue = "{{ blue }}"
magenta = "{{ magenta }}"
cyan = "{{ cyan }}"
white = "{{ foreground }}"

[colors.bright]
black = "{{ muted }}"
red = "{{ bright_red }}"
green = "{{ bright_green }}"
yellow = "{{ bright_yellow }}"
blue = "{{ bright_blue }}"
magenta = "{{ bright_magenta }}"
cyan = "{{ bright_cyan }}"
white = "{{ bright_foreground }}"
