from libqtile import bar, widget, qtile
from libqtile.config import Screen
import os

from .constants import *
from .keys import terminal
from .widgets import MyVolume

bar_height_px = 40

def create_widgets():
    return [
        # widget.Image(
        #    filename='~/.config/qtile/eos-c.png', margin=10,
        #    background=c_accent,
        #    mouse_callbacks={
        #        'Button1': lambda: qtile.cmd_spawn(
        #            "rofi -show drun"
        #        )
        #   }
        # ,
        widget.Spacer(length=5),
        widget.CurrentLayoutIcon(
            scale=0.5,
        ),
        widget.Spacer(length=5),
        widget.GroupBox(
            highlight_method='line',
            this_screen_border=c_border,
            this_current_screen_border=c_border,
            active=c_white,
            inactive=c_inactive,
            background=c_accent
        ),
        widget.Prompt(),
        widget.Spacer(length=5),
        widget.WindowName(
            foreground=c_wname,
            fmt='{}',
        ),
        widget.Chord(
            chords_colors={
                'launch': (c_chords_color, c_white),
            },
            name_transform=lambda name: name.upper(),
        ),
        widget.Net(
            format='{down:.0f}{down_suffix} ↓↑ {up:.0f}{up_suffix}',
        ),
        widget.TextBox(
            text='|',
            foreground=c_wname,
        ),
        widget.Wlan(),
        widget.Spacer(length=5),
        widget.Battery(
            foreground=c_wname,
        ),
        MyVolume(
            fontsize=13,
            font='Font Awesome 5 Free',
            foreground=c_volume,
            background=c_bg,
            mouse_callbacks = {'Button1': lambda: qtile.cmd_spawn("pavucontrol")},
            padding=10,
        ),
        widget.Clock(
            format='󰥔 %Y-%m-%d %a %I:%M %p',
            background=c_accent,
            foreground=c_time,
            padding=10,
        ),
        widget.TextBox(
            text='',
            mouse_callbacks= {
                'Button1': lambda: qtile.cmd_spawn(os.path.expanduser(
                    '~/.config/rofi/powermenu.sh'))
            },
            foreground=c_power_btn,
            padding=10,
        ),
    ]

main_screen_widgets = [
    widget.Sep(padding=3, linewidth=0, background=c_accent),
    widget.Systray(icon_size = 20),
    widget.CheckUpdates(
        update_interval=1800,
        distro="Arch_yay",
        display_format="{updates} Updates",
        foreground=c_white,
        mouse_callbacks={
            'Button1':
            lambda: qtile.cmd_spawn(terminal + ' -e yay -Syu')
        },
        background=c_accent
    ),
]
main_screen_widgets.extend(create_widgets())

screens = [
    Screen(
        bottom=bar.Bar(
            main_screen_widgets, bar_height_px,
            background=c_bg,
        ),
    ),
    Screen(
        bottom=bar.Bar(
            create_widgets(), bar_height_px,
            background=c_bg,
        ),
    ),
]

