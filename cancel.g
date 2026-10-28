; cancel.g - called when a print is cancelled
M106 S0                 ; Turn off all print cooling fans
M104 S0                 ; Turn off tool heaters
M140 S0                 ; Turn off bed heater
T-1                     ; Deselect and dock any active tool
G91
G1 Z10 F1000            ; Drop bed 10mm relative to clear the printed part
G90
G53 G1 X250 Y-49 F15000 ; Park carriage at the front center