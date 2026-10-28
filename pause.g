; pause.g - called when a print is paused
G91
G1 H2 Z5 F5000          ; Lift Z 5mm safely
G90
G53 G1 X-10 Y200 F50000 ; Park out of the way in machine coordinates