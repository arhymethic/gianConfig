; Configuration file for Duet WiFi / Ethernet running RRF3 on E3D Tool Changer
; executed by the firmware on start-up

; General preferences
M111 S0                                      ; Debugging off
G21                                          ; Work in millimetres
G90                                          ; Send absolute coordinates...
M83                                          ; ...but relative extruder moves
M555 P2                                      ; Set firmware compatibility to look like Marlin
M669 K1                                      ; Select CoreXY kinematics

; Network
M550 P"Gian"                                 ; Set machine name
M551 P"giankapassword"                       ; Set machine password
M552 S1                                      ; Enable Networking
M586 P0 S1                                   ; Enable HTTP
M586 P1 S0                                   ; Disable FTP
M586 P2 S0                                   ; Disable Telnet

; Drive direction
M569 P0 S0                                   ; Drive 0 X
M569 P1 S1                                   ; Drive 1 Y
M569 P2 S1                                   ; Drive 2 Z
M569 P3 S1                                   ; Drive 3 E0 Now X
M569 P4 S0                                   ; Drive 4 E1 Now E0
M569 P5 S0                                   ; Drive 5 E2 Now E1
M569 P6 S0                                   ; Drive 6 E3 Now E2
M569 P7 S0                                   ; Drive 7 COUPLER
M569 P8 S0                                   ; Drive 8 Now E3
M569 P9 S0                                   ; Drive 9 UNUSED

M584 X3 Y1 Z2 C7 E4:5:6:8                    ; Apply custom drive mapping
M208 X-42:528.5 Y-49:555 Z0:500 C-45:360     ; Set axis maxima & minima (covers T3 dock at Y541)
M564 H0 S1                                   ; Allow axis movement before homing, enforce limits when homed
M92 X160 Y160 Z1600 C91.022 E834:834:834:834 ; Set steps per mm
M350 E16:16:16:16 I1                         ; Configure microstepping with interpolation
M350 C16 I0                                  ; Configure microstepping without interpolation
M350 X16 Y16 Z16 I1                          ; Configure microstepping with interpolation
M566 X400 Y400 Z12 C2 E120:120:120:120       ; Set maximum instantaneous speed changes (mm/min)
M203 X35000 Y35000 Z600 C5000 E5000:5000:5000:5000 ; Set maximum speeds (mm/min)
M201 X6000 Y6000 Z200 C500 E2500:2500:2500:2500    ; Set accelerations (mm/s^2)
M906 X1800 Y1800 Z1630 I30                   ; Motion motor currents & 30% idle
M906 E1000:1000:1000:1000 C500 I10           ; Extruder motor currents

; Endstops
M574 X1 Y1 S3                                ; Set X / Y endstop stall detection
M574 C0                                      ; No C physical endstop
M574 Z1 S1 P"zstop"                          ; Z endstop switch configured at Z min (top limit switch)

; Z probe (Disabled in favor of physical Z endstop)
M558 P0                                      ; No Z probe
G31 P0 X0 Y0 Z0                              ; Clear probe offsets

; Stall Detection
M915 X Y S3 F0 H400 R0                       ; X / Y Axes sensitivity

; Heaters & Tuned PID Models
M308 S0 P"bedtemp" Y"thermistor" A"Bed" T100000 B4138 C0         ; Bed thermistor
M950 H0 C"bedheat" T0                                            ; Bed heater
M143 H0 S125                                                     ; Limit bed to 125C
M307 H0 R0.129 C700.000 D10.00 S1.00 V0.0 B1                     ; Tuned Bed model
M140 H0                                                          ; Bed mapping

M308 S1 P"e0temp" Y"thermistor" A"T0" T100000 B4725 C7.06e-8     ; T0 thermistor
M950 H1 C"e0heat" T1                                             ; T0 heater
M143 H1 S305                                                     ; Limit T0 to 305C
M307 H1 R4.662 C48.400 D1.85 S1.00 V23.9 B0                      ; Tuned T0 PID model

M308 S2 P"e1temp" Y"thermistor" A"T1" T100000 B4725 C7.06e-8     ; T1 thermistor
M950 H2 C"e1heat" T2                                             ; T1 heater
M143 H2 S305                                                     ; Limit T1 to 305C
M307 H2 R5.005 C158.104 D2.80 S1.00 V23.9 B0                     ; Tuned T1 PID model

M308 S3 P"e2temp" Y"thermistor" A"T2" T100000 B4725 C7.06e-8 R2200 ; T2 thermistor
M950 H3 C"duex.e2heat" T3                                        ; T2 heater
M143 H3 S305                                                     ; Limit T2 to 305C
M307 H3 R3.794 C30.400 D3.55 S1.00 V24.0 B0                      ; Tuned T2 PID model

M308 S4 P"e3temp" Y"thermistor" A"T3" T100000 B4725 C7.06e-8 R2200 ; T3 thermistor
M950 H4 C"duex.e3heat" T4                                        ; T3 heater
M143 H4 S305                                                     ; Limit T3 to 305C
M307 H4 R2.429 C140.000 D5.50 S1.00 V24.0 B0                     ; Tuned T3 PID model

; Fans (Defined BEFORE Tools as required by RRF3)
M950 F1 C"fan1"                              ; T0 Hotend Fan
M950 F2 C"fan2"                              ; T0 Part Cooling Fan
M950 F3 C"duex.fan3"                         ; T1 Hotend Fan
M950 F4 C"duex.fan4"                         ; T1 Part Cooling Fan
M950 F5 C"duex.fan5"                         ; T2 Hotend Fan
M950 F6 C"duex.fan6"                         ; T2 Part Cooling Fan
M950 F7 C"duex.fan7"                         ; T3 Hotend Fan
M950 F8 C"duex.fan8"                         ; T3 Part Cooling Fan

M106 P1 S255 H1 T50                          ; T0 HE Fan thermostatic at 50C
M106 P2 S0                                   ; T0 Part Fan off
M106 P3 S255 H2 T50                          ; T1 HE Fan thermostatic at 50C
M106 P4 S0                                   ; T1 Part Fan off
M106 P5 S255 H3 T50                          ; T2 HE Fan thermostatic at 50C
M106 P6 S0                                   ; T2 Part Fan off
M106 P7 S255 H4 T50                          ; T3 HE Fan thermostatic at 50C
M106 P8 S0                                   ; T3 Part Fan off

; Tools & Calibrated Offsets
global globalZOffset = 0.00                  ; Master Z trim for first-layer squish

M563 P0 S"T0" D0 H1 F2                       ; Tool 0
G10 P0 X-9.00 Y39.00 Z{-2.53 + global.globalZOffset} ; Tool 0 offsets
M568 P0 R0 S0                                ; Reset initial tool temperatures

M563 P1 S"T1" D1 H2 F4                       ; Tool 1
G10 P1 X-9.00 Y38.72 Z{-3.36 + global.globalZOffset} ; Tool 1 offsets
M568 P1 R0 S0

M563 P2 S"T2" D2 H3 F6                       ; Tool 2
G10 P2 X-9.06 Y38.83 Z{-3.38 + global.globalZOffset} ; Tool 2 offsets
M568 P2 R0 S0

M563 P3 S"T3" D3 H4 F8                       ; Tool 3
G10 P3 X-9.16 Y38.96 Z{-3.20 + global.globalZOffset} ; Tool 3 offsets
M568 P3 R0 S0

M593 F42.2                                   ; Ringing cancellation
M575 P1 S1 B57600                            ; Enable LCD

; Startup sequence
T-1 P0                                       ; Deselect active tools on boot without running macros
G29 S2                                       ; Disable mesh bed compensation