; tfree3.g - called when tool 3 is freed
G91
G1 Z4 F1000                     ; Drop bed relative 4mm safely
G90
;M98 P"purge.g"                 ; Purge nozzle
G53 G1 X417 Y450 F5000          ; Move In
G53 G1 X417 Y500 F5000
G53 G1 X417 Y510 F5000
G53 G1 X417 Y529 F500
M98 P"/macros/Coupler - Unlock" ; Open Coupler
M106 P8 S0                      ; Tool 3 Fan off
G53 G1 X417 Y525 F500           ; Move Out
G53 G1 X417 Y475 F5000