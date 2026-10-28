if !move.axes[0].homed || !move.axes[1].homed
    G28 X Y

if state.currentTool != -1
    T-1

M98 P"homez.g"
T0

G90
G1 Z10 F3000

; 1. Front-Left
G1 X0 Y0 F10000
G1 Z0 F1200
M291 P"Adjust Front-Left" R"Bed Leveling" S3
G1 Z5 F3000

; 2. Mid-Left
G1 X0 Y215 F10000
G1 Z0 F1200
M291 P"Adjust Mid-Left" R"Bed Leveling" S3
G1 Z5 F3000

; 3. Back-Left
G1 X0 Y430 F10000
G1 Z0 F1200
M291 P"Adjust Back-Left" R"Bed Leveling" S3
G1 Z5 F3000

; 4. Back-Right
G1 X447 Y430 F10000
G1 Z0 F1200
M291 P"Adjust Back-Right" R"Bed Leveling" S3
G1 Z5 F3000

; 5. Mid-Right
G1 X447 Y215 F10000
G1 Z0 F1200
M291 P"Adjust Mid-Right" R"Bed Leveling" S3
G1 Z5 F3000

; 6. Front-Right
G1 X447 Y0 F10000
G1 Z0 F1200
M291 P"Adjust Front-Right" R"Bed Leveling" S3
G1 Z5 F3000

; Park
G1 Z10 F3000
G1 X250 Y-49 F15000
