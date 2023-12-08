from libqtile.layout import bsp, columns, tile, max, floating
from libqtile.config import Match

from .constants import *


layouts = [
    bsp.Bsp(
        border_width=k_border_width,
        border_focus=c_focused,
        border_normal=c_unfocused,
    ),
    columns.Columns(),
    tile.Tile(),
    max.Max(),
    # Try more layouts by unleashing below layouts.
    # layout.Stack(num_stacks=2),
    # layout.Matrix(),
    # layout.MonadTall(),
    # layout.MonadWide(),
    # layout.RatioTile(),
    # layout.TreeTab(),
    # layout.VerticalTile(),
    # layout.Zoomy(),
]


floating_layout = floating.Floating(
    float_rules=[
        # Run the utility of `xprop` to see the wm class and name of an X client.
        *floating.Floating.default_float_rules,
        Match(wm_class="confirm"),
        Match(wm_class="dialog"),
        Match(wm_class="download"),
        Match(wm_class="error"),
        Match(wm_class="file_progress"),
        Match(wm_class="notification"),
        Match(wm_class="splash"),
        Match(wm_class="toolbar"),
        Match(wm_class="confirmreset"),
        Match(wm_class="makebranch"),
        Match(wm_class="maketag"),
        Match(title="branchdialog"),
        Match(title="pinentry"),
        Match(wm_class="ssh-askpass"),
        Match(wm_class="nextcloud"),
        Match(wm_class="system-config-printer"),
    ]
)
