def toggle_zen(qtile):
    bar = qtile.current_screen.bottom
    if bar.is_show():
        bar.show(False)
    else:
        bar.show(True)

