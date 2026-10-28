; tpre3.g - called before tool 3 is selected
G91
G1 Z10 F1000                    ; Safely lower bed 10mm relative BEFORE docking
G90

G53 G1 X417 Y450 F4000        ; Move out
M98 P"/macros/Coupler - Unlock" ; Unlock Coupler
G53 G1 X417 Y500 F5000          ; Move to location
G53 G1 X417 Y510 F500           ; Move in
G53 G1 X417 Y529 F250           ; Collect
M98 P"/macros/Coupler - Lock"   ; Close Coupler
G53 G1 X417 Y450 F4000          ; Move Out