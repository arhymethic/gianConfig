; start.g - executed before print begins
if !move.axes[0].homed || !move.axes[1].homed || !move.axes[2].homed
    G28                         ; Home all axes if not already homed
G29 S2                          ; Ensure mesh bed compensation is disabled
