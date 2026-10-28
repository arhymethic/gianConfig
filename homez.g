; homez.g - Homes the Z axis using the top zstop limit switch
if state.currentTool != -1
    T-1                         ; Dock current tool head first

M98 P"/macros/Coupler - Unlock" ; Ensure tool coupler is unlocked

; Move X and Y to the centre before homing Z (if homed)
if move.axes[0].homed && move.axes[1].homed
    G90
    G1 X243 Y247 F10000

G91                             ; Relative positioning

; Lift/lower bed slightly away from nozzle safely (5mm down)
G1 H2 Z5 F5000

; Move fast towards Z endstop until triggered
var maxTravel = move.axes[2].max - move.axes[2].min + 5 ; calculate how far Z can travel plus 5mm
G1 H1 Z{-var.maxTravel} F1800

; Back off 5mm
G1 Z5 F3000

; Slow precision homing pass
G1 H1 Z-10 F300

; Switch back to absolute positioning
G90

; Safe drop to 5mm height so nozzle does not scrape bed during traverse
G1 Z5 F1000

; After Z is homed, move X and Y to their own (0, 0) home (if homed)
if move.axes[0].homed && move.axes[1].homed
    G1 X0 Y0 F10000