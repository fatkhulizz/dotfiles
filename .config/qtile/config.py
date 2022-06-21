import os
from libqtile import bar, layout, widget, hook
from libqtile.config import Click, Drag, Group, Key, Match, Screen
from libqtile.lazy import lazy
from libqtile.utils import guess_terminal
import subprocess

mod = "mod4"
terminal = guess_terminal()

# Colors
bg = "#1E1D2F"
blue = "#96CDFB"
cyan = "#89DCEB"
fg = "#d9e0ee"
gray = "#6E6C7E"
magenta = "#F5C2E7"
red = "#F28FAD"
yellow = "#FAE3B0"

keys = [
    # Switch between windows
    Key([mod], "h", lazy.layout.left(), desc="Move focus to left"),
    Key([mod], "l", lazy.layout.right(), desc="Move focus to right"),
    Key([mod], "j", lazy.layout.down(), desc="Move focus down"),
    Key([mod], "k", lazy.layout.up(), desc="Move focus up"),
    Key([mod], "f", lazy.window.toggle_fullscreen()),
    Key([mod], "space", lazy.next_layout(), desc="Move window focus to other window"),
    Key([mod, 'shift'], "space", lazy.window.toggle_floating(), desc='Toggle floating'), 
    # Move windows between left/right columns or move up/down in current stack.
    # Moving out of range in Columns layout will create new column.
    Key([mod, "shift"], "h", lazy.layout.shuffle_left(), desc="Move window to the left"),
    Key([mod, "shift"], "l", lazy.layout.shuffle_right(), desc="Move window to the right"),
    Key([mod, "shift"], "j", lazy.layout.shuffle_down(), desc="Move window down"),
    Key([mod, "shift"], "k", lazy.layout.shuffle_up(), desc="Move window up"),
    # Grow windows. If current window is on the edge of screen and direction
    # will be to screen edge - window would shrink.
    Key([mod, "control"], "h", lazy.layout.grow_left(), desc="Grow window to the left"),
    Key(
        [mod, "control"], "l", lazy.layout.grow_right(), desc="Grow window to the right"
    ),
    Key([mod, "control"], "j", lazy.layout.grow_down(), desc="Grow window down"),
    Key([mod, "control"], "k", lazy.layout.grow_up(), desc="Grow window up"),
    Key([mod], "n", lazy.layout.normalize(), desc="Reset all window sizes"),
    # Toggle between split and unsplit sides of stack.
    # Split = all windows displayed
    # Unsplit = 1 window displayed, like Max layout, but still with
    # multiple stack panes
    Key(
        [mod, "shift"],
        "Return",
        lazy.layout.toggle_split(),
        desc="Toggle between split and unsplit sides of stack",
    ),
    Key([mod], "Return", lazy.spawn(terminal), desc="Launch terminal"),
    # Toggle between different layouts as defined below
    # Key([mod], "Tab", lazy.next_layout(), desc="Toggle between layouts"),
    Key([mod], "w", lazy.window.kill(), desc="Kill focused window"),
    Key([mod, "control"], "r", lazy.reload_config(), desc="Reload the config"),
    Key([mod, "control"], "q", lazy.shutdown(), desc="Shutdown Qtile"),

    #-----------------APPS----------------------
    Key([mod], "b", lazy.spawn("/usr/bin/firefox"), desc="Shutdown Qtile"),
     # Menu
    Key([mod], "m", lazy.spawn(os.path.expanduser("~/.config/rofi/launchers/misc/launcher.sh"))),
    Key([mod], "x", lazy.spawn(os.path.expanduser("~/.config/rofi/powermenu/powermenu.sh"))),
    Key([mod], "s", lazy.spawn(os.path.expanduser("~/.config/rofi/applets/applets/screenshot.sh"))),
    Key([mod], "n", lazy.spawn(os.path.expanduser("~/.config/rofi/applets/applets/network.sh"))),

    #-----------------Hardware----------------------
        # Volume
    Key([], "XF86AudioLowerVolume", lazy.spawn(
        "pactl set-sink-volume @DEFAULT_SINK@ -5%"
    )),
    Key([], "XF86AudioRaiseVolume", lazy.spawn(
        "pactl set-sink-volume @DEFAULT_SINK@ +5%"
    )),
    Key([], "XF86AudioMute", lazy.spawn(
        "pactl set-sink-mute @DEFAULT_SINK@ toggle"
    )),

    # Brightness
    Key([], "XF86MonBrightnessUp", lazy.spawn("brightnessctl set +10%")),
    Key([], "XF86MonBrightnessDown", lazy.spawn("brightnessctl set 10%-")),
]

groups = []

group_names = [
    "1",
    "2",
    "3",
    "4",
    "5",
]

group_labels = [
    "",
    "",
    "",
    "",
    "",
]

group_layouts = [
    "bsp",
    "bsp",
    "bsp",
    "bsp",
    "bsp",
]

for i in range(len(group_names)):
    groups.append(
        Group(
            name=group_names[i],
            layout=group_layouts[i].lower(),
            label=group_labels[i],
        )
    )

for i in groups:
    keys.extend(
        [
            # mod1 + letter of group = switch to group
            Key(
                [mod],
                i.name,
                lazy.group[i.name].toscreen(),
                desc="Switch to group {}".format(i.name),
            ),
            # mod1 + shift + letter of group = switch to & move focused window to group
            Key(
                [mod, "shift"],
                i.name,
                lazy.window.togroup(i.name, switch_group=True),
                desc="Switch to & move focused window to group {}".format(i.name),
            ),
            # Or, use below if you prefer not to switch to that group.
            # # mod1 + shift + letter of group = move focused window to group
            # Key([mod, "shift"], i.name, lazy.window.togroup(i.name),
            #     desc="move focused window to group {}".format(i.name)),
        ]
    )


#layout

layout_theme = {
    "border_width": 0,
    "margin": [4,8,0,8],
    "border_focus": blue,
    "border_normal": bg,
}
layouts = [
    layout.MonadTall(**layout_theme),
    layout.Columns(**layout_theme),
    layout.Max(),
    layout.Floating(
        border_focus=gray,
        border_normal=bg,
        border_width=2,
    ),
    layout.Bsp(fair=False, **layout_theme),
    layout.Stack(num_stacks=2),
]
# layouts = [
#         layout.Bsp(fair=False, **layout_options),
#         layout.Columns(border_focus=["#6D6B7D", "#302D41"],border_normal=["#302D41","#302D41"], border_width=8),
#         ]
#
# layout_options = {"margin": 3, "border_width": 0}

colors =  [
        ["#2e3440", "#2e3440"],  # color 0
        [ "#302D41", "#302D41"], # color 5
        ["#434c5e", "#434c5e"],  # color 2
        ["#4c566a", "#4c566a"],  # color 3
        ["#d8dee9", "#d8dee9"],  # color 4
        ["#e5e9f0", "#e5e9f0"],  # color 5
        ["#eceff4", "#eceff4"],  # color 6
        ["#88c0d0", "#88c0d0"],  # color 7
        ["#81a1c1", "#81a1c1"],  # color 8
        ["#5e81ac", "#5e81ac"],  # color 9
        ["#00FFFFFF", "#00FFFFFF"] # color 10
        ]


widget_defaults = dict(
    font="JetBrainsMono Nerd Font Bold",
    fontsize=12,
    padding=5,
)
extension_defaults = widget_defaults.copy()

screens = [
    Screen(
        top=bar.Bar(
            [
                widget.CurrentLayoutIcon(
                    scale=0.5,
                    background=bg,
                    foreground=fg,
                ),
                widget.Sep(
                    foreground=gray,
                    line_width=9,
                    size_percent=70,
                ),
                widget.TextBox(
                    font="Font Awesome 6 Free",
                    text=" ",
                    foreground=yellow,
                    padding=0,
                    fontsize=20,
                ),
                widget.Memory(
                    format='{MemUsed:.2f}{mm} / {MemTotal:.1f}{mm}',
                    measure_mem='G',
                    update_interval=1,
                    fontsize=12,
                    foreground=fg,
                ),
                widget.Sep(
                    foreground=gray,
                    line_width=9,
                    size_percent=70,
                ),
                widget.TextBox(
                    font="Font Awesome 6 Free",
                    text="",
                    foreground=blue,
                    fontsize=18,
                    background=bg,
                ),
                widget.CPU(
                    # font="Source Code Pro",
                    format="{load_percent}%",
                    fontsize=12,
                    foreground=fg,
                    # mouse_callbacks={"Button1": open_btm},
                    background=bg,
                ),
                widget.Sep(
                    foreground=gray,
                    line_width=9,
                    size_percent=70,
                ),
                # # # #
                widget.Spacer(),
                widget.Sep(
                    foreground=gray,
                    line_width=9,
                    size_percent=70,
                ),
                widget.GroupBox(
                    fontsize=18,
                    # active=cyan,
                    active=cyan,
                    # inactive=gray,
                    # foreground=cyan,
                    # rounded=False,
                    margin_y=3,
                    margin_x=5,
                    padding_y=0,
                    padding_x=0,
                    borderwidth=0,
                    disable_drag=True,
                    margin=4,
                    highlight_method="text",
                    # highlight_color=bg,
                    highlight_color=cyan,
                    other_screen_border=gray,
                    # other_current_screen_border=cyan,
                    # this_current_screen_border=cyan,
                    this_screen_border=gray,
                ),
                # widget.WindowName(foreground=fg, max_chars=20),
                # widget.Spacer(length=100),
                widget.Sep(
                    foreground=gray,
                    line_width=9,
                    size_percent=70,
                ),
                widget.Spacer(),
                # # # #
                widget.Systray(icon_size=18),
                widget.Sep(
                    foreground=gray,
                    line_width=9,
                    size_percent=70,
                ),
                widget.Battery(
                    foreground=cyan,
                    low_foreground=red,
                    low_percentage=0.3,
                    format="{char} {percent:2.0%}",
                    charge_char="",
                    discharge_char="",
                    full_char="",
                    unknown_char="",
                    empty_char="",
                    fontsize=14,
                ),
                widget.Sep(
                    foreground=gray,
                    line_width=9,
                    size_percent=70,
                ),
                widget.TextBox(
                    text=" ",
                    background=bg,
                    foreground=red,
                    padding=0,
                    fontsize=17,
                ),
                widget.ThermalSensor(
                    foreground=fg,
                    background=bg,
                    format='{temp}°C|'
                ),
                widget.Sep(
                    foreground=gray,
                    line_width=9,
                    size_percent=70,
                ),
                widget.TextBox(
                    text="  ",
                    background=bg,
                    foreground=yellow,
                    padding=0,
                    fontsize=17,
                ),
                # widget.PulseVolume(
                #     foreground=fg,
                #     background=bg,
                # ),
                widget.Volume(
                    foreground=fg,
                    background=bg,
                ),
                widget.Sep(
                    foreground=gray,
                    line_width=9,
                    size_percent=70,
                ),
                # widget.TextBox(
                #     text="  ",
                #     background=bg,
                #     foreground=blue,
                #     padding=0,
                #     fontsize=17,
                # ),
                widget.Clock(
                    background=bg,
                    foreground=fg,
                    format="%b %d - %I:%M %p",
                ),
            ],
            30,
            background=bg,
            opacity=20,
            margin=[-2, 10, 5, 10],
        ),
    ),
]

# Drag floating layouts.
mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(), start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(), start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front()),
]

dgroups_key_binder = None
dgroups_app_rules = []  # type: list
follow_mouse_focus = True
bring_front_click = False
cursor_warp = False
floating_layout = layout.Floating(
    float_rules=[
        # Run the utility of `xprop` to see the wm class and name of an X client.
        *layout.Floating.default_float_rules,
        Match(wm_class="confirmreset"),  # gitk
        Match(wm_class="makebranch"),  # gitk
        Match(wm_class="maketag"),  # gitk
        Match(wm_class="ssh-askpass"),  # ssh-askpass
        Match(title="branchdialog"),  # gitk
        Match(title="pinentry"),  # GPG key password entry
    ]
)
auto_fullscreen = True
focus_on_window_activation = "smart"
reconfigure_screens = True

# If things like steam games want to auto-minimize themselves when losing
# focus, should we respect this or not?
auto_minimize = True

# When using the Wayland backend, this can be used to configure input devices.
wl_input_rules = None

# XXX: Gasp! We're lying here. In fact, nobody really uses or cares about this
# string besides java UI toolkits; you can see several discussions on the
# mailing lists, GitHub issues, and other WM documentation that suggest setting
# this string if your java app doesn't work correctly. We may as well just lie
# and say that we're a working one by default.
#
# We choose LG3D to maximize irony: it is a 3D non-reparenting WM written in
# java that happens to be on java's whitelist.
wmname = "LG3D"

@hook.subscribe.startup_once
def autostart():
    home = os.path.expanduser('~/.config/qtile/autostart.sh')
    subprocess.call([home])
