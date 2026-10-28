; homeall.g
; called to home all axes
; Axis centers: X = 243.25mm, Y = 247mm

if state.currentTool != -1
    T-1                         ; Dock mounted tool head first so carriage is empty

M98 P"homec.g"			; Home C (ToolHead coupler)

M98 P"homey.g"			; Home Y
M98 P"homex.g"			; Home X

; Move X and Y to the centre before homing Z
G90
G1 X243 Y247 F10000

M98 P"homez.g"			; Home Z

; After Z is homed, move X and Y to their own (0, 0) home
G90
G1 X0 Y0 F10000