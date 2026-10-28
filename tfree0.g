; tfree0.g - called when tool 0 is freed
G91
G1 Z4 F1000                     ; Drop the bed 4mm relative to current height
G90
;M98 P"purge.g"                 ; Purge nozzle
G53 G1 X63 Y450 F5000           ; Move In
G53 G1 X63 Y500 F5000
G53 G1 X63 Y510 F5000
G53 G1 X63 Y529 F500
M98 P"/macros/Coupler - Unlock" ; Open Coupler
M106 P2 S0                      ; Fan off
G53 G1 X63 Y525 F500            ; Move Out
G53 G1 X63 Y510 F500
G53 G1 X63 Y475 F5000