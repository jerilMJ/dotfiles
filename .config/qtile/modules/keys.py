from libqtile.lazy import lazy
from libqtile.config import Key
import os

from .functions import toggle_zen


mod = "mod4"
terminal = "alacritty"
file_manager = "thunar"
HOME_DIR = os.path.expanduser("~")
SCRIPTS_DIR = f"{HOME_DIR}/.scripts"

keys = [
    # A list of available commands that can be bound to keys can be found
    # at https://docs.qtile.org/en/latest/manual/config/lazy.html
    # Switch between windows
    Key([mod], "h", lazy.layout.left(), desc="Move focus to left"),
    Key([mod], "l", lazy.layout.right(), desc="Move focus to right"),
    Key([mod], "j", lazy.layout.down(), desc="Move focus down"),
    Key([mod], "k", lazy.layout.up(), desc="Move focus up"),
    Key(
        [mod],
        "space",
        lazy.layout.next(),
        desc="Move window focus to other window",
    ),
    # Move windows between left/right columns or move up/down in current stack.
    # Moving out of range in Columns layout will create new column.
    Key(
        [mod, "shift"],
        "h",
        lazy.layout.shuffle_left(),
        desc="Move window to the left",
    ),
    Key(
        [mod, "shift"],
        "l",
        lazy.layout.shuffle_right(),
        desc="Move window to the right",
    ),
    Key(
        [mod, "shift"], "j", lazy.layout.shuffle_down(), desc="Move window down"
    ),
    Key([mod, "shift"], "k", lazy.layout.shuffle_up(), desc="Move window up"),
    # Grow windows. If current window is on the edge of screen and direction
    # will be to screen edge - window would shrink.
    Key(
        [mod, "control"],
        "h",
        lazy.layout.grow_left(),
        desc="Grow window to the left",
    ),
    Key(
        [mod, "control"],
        "l",
        lazy.layout.grow_right(),
        desc="Grow window to the right",
    ),
    Key(
        [mod, "control"], "j", lazy.layout.grow_down(), desc="Grow window down"
    ),
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
    # Toggle between different layouts as defined below
    Key([mod], "Tab", lazy.next_layout(), desc="Toggle between layouts"),
    Key([mod], "w", lazy.window.kill(), desc="Kill focused window"),
    Key([mod, "control"], "r", lazy.reload_config(), desc="Reload the config"),
    # Key([mod, "control"], "q", lazy.shutdown(), desc="Shutdown Qtile"),
    Key(
        [mod],
        "r",
        lazy.spawncmd(),
        desc="Spawn a command using a prompt widget",
    ),
    # My custom keybindings
    Key(
        [mod, "shift"],
        "r",
        lazy.spawn(f"{SCRIPTS_DIR}/show-on-rofi.sh"),
        desc="Show my scripts on rofi",
    ),
    Key([mod], "q", lazy.spawn("rofi -show drun"), desc="Show applications"),
    Key(
        [],
        "Print",
        lazy.spawn(f"{SCRIPTS_DIR}/common/screenshot.sh"),
        desc="Screenshot",
    ),
    # Volume up
    Key(
        [],
        "XF86AudioRaiseVolume",
        lazy.spawn("amixer -q set Master 1%+"),
        desc="Master audio +1%",
    ),
    # Volume down
    Key(
        [],
        "XF86AudioLowerVolume",
        lazy.spawn("amixer -q set Master 1%-"),
        desc="Master audio -1%",
    ),
    # Mute/unmute
    Key(
        [],
        "XF86AudioMute",
        lazy.spawn("amixer -q set Master toggle"),
        desc="Toggle master audio",
    ),
    # Open tmux starting with nvim in the specified directory by rofi
    Key(
        [mod, "shift"],
        "Return",
        lazy.spawn(f"{SCRIPTS_DIR}/common/open-tmux-nvim-in-dir.sh"),
        desc="Launch nvim with tmux in dir",
    ),
    # Open tmux with alacritty
    Key([mod], "t", lazy.spawn(terminal), desc="Launch terminal"),
    Key(
        [mod],
        "Return",
        lazy.spawn(f"{SCRIPTS_DIR}/common/open-tmux.sh"),
        desc="Launch terminal",
    ),
    # Hide bottom bar
    Key([mod], "z", lazy.function(toggle_zen)),
    Key([mod], "period", lazy.next_screen(), desc="Next monitor"),
    Key(
        [mod],
        "F10",
        lazy.spawn(f"expect -f {SCRIPTS_DIR}/common/connect-trackball.expect"),
        desc="Connect to trackball",
    ),  
    Key(
        [mod],
        "F11",
        lazy.spawn(f"{SCRIPTS_DIR}/common/show-glove80-rig.sh"),
        desc="Show glove80 rig",
    ),
    Key(
        [mod],
        "F12",
        lazy.spawn(f"{SCRIPTS_DIR}/common/random_wallpaper.sh"),
        desc="Randomize wallpaper",
    ),
    Key(
        [mod],
        "f",
        lazy.spawn(file_manager),
        desc="Open file manager",
    ),
]
