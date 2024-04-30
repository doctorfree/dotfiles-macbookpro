## Kitty Configuration

See https://sw.kovidgoyal.net/kitty/conf/

### Table of Contents

1. [Usage](#usage)
    1. [Override options](#override-options)
    1. [Command option](#command-option)
    1. [Single instance options](#single-instance-options)
1. [Window size](#window-size)
1. [Window decoration](#window-decoration)
1. [Color scheme](#color-scheme)
1. [Cursor](#cursor)
1. [Fonts](#fonts)
1. [Include directives](#include-directives)
1. [Auto copy selection](#auto-copy-selection)
1. [Kitty fonts](#kitty-fonts)

### Usage

**kitty** [options] [program-to-run ...]

#### Override options

To override a configuration option, use `-o <option>`.

For example, to override the font size configuration:

```
kitty -o font_size=20
```

#### Command option

Specify the command to run after all options on the command line:

```
kitty --hold sh -c "echo hello, world"
```

#### Single instance options

```
--single-instance, -1
```

If specified only a single instance of kitty will run. New invocations will
instead create a new top-level window in the existing kitty instance. This
allows kitty to share a single sprite cache on the GPU and also reduces
startup time. You can also have separate groups of kitty instances by using
the `kitty --instance-group` option.

```
--instance-group <INSTANCE_GROUP>
```

Used in combination with the `kitty --single-instance` option. All kitty
invocations with the same kitty --instance-group will result in new windows
being created in the first kitty instance within that group.

```
--wait-for-single-instance-window-close
```

Normally, when using `kitty --single-instance`, kitty will open a new window
in an existing instance and quit immediately. With this option, it will not
quit till the newly opened window is closed. Note that if no previous instance
is found, then kitty will wait anyway, regardless of this option.

### Window size

```
remember_window_size  yes
initial_window_width  82c
initial_window_height 24c
```

### Window decoration

```
hide_window_decorations yes
```

### Color scheme

```
foreground #dddddd
background #000000
background_opacity 1.0
```

### Cursor

Can be block beam or underline

```
cursor_shape underline
```

### Fonts

```
font_family      monospace
bold_font        auto
italic_font      auto
bold_italic_font auto
font_size        11.0
```

### Include directives

```
include other.conf
# Include *.conf files from all subdirs of kitty.d inside the kitty config dir
globinclude kitty.d/**/*.conf
# Include the *contents* of all env vars starting with KITTY_CONF_
envinclude KITTY_CONF_*
```

### Auto copy selection

```
# This copies selected text to a private buffer named a1
# The keyboard shortcut shift+cmd+v pastes the contents of the a1 buffer
copy_on_select a1
map shift+cmd+v paste_from_buffer a1
```

### Kitty fonts

Output of `kitty +list-fonts` on Mac OS Monterey

```
Andale Mono
    Andale Mono Regular

Courier New
    Courier New Bold
    Courier New Bold Italic
    Courier New Italic
    Courier New Regular

Menlo
    Menlo Bold
    Menlo Bold Italic
    Menlo Italic
    Menlo Regular

MesloLGS NF
    MesloLGS NF Bold
    MesloLGS NF Bold Italic
    MesloLGS NF Italic
    MesloLGS NF Regular

Monaco
    Monaco Regular

PT Mono
    PT Mono Bold
    PT Mono Regular
```
