        .CR     6502
        .TF     music.hex,hex
        .LF     music.list
;
; MUSIC PLAYER FOR THE BE6502 USING '6502 GAMES' HARDWARE. BOARD SHOULD BE 
; JUMPERED WITH VIA CHIPS AT THE ADDRESSES SPECIFIED BELOW. OTHER THAN THAT
; THE CODE IS UNCHANGED FROM THE BOOK.
;
VIA1    .EQ     $4000       ; GAME BOARD (VIA #1)
VIA3    .EQ     $4C00       ; GAME BOARD (VIA #3)
DDR3A   .EQ     VIA3+3
DDR3B   .EQ     VIA3+2
PORT3A  .EQ     VIA3+1
PORT3B  .EQ     VIA3

        .OR     $8000
        .TA     $0000
BE6502  JSR     INITKEY
        .IN     ../../common/CH02-Music/player.asm
        .IN     ../../common/CH01-Getkey/getkey_routine.asm
;
; STORE CPU INITIALIZATION VECTORS AT THE END OF THE EEPROM.
;
        .NO     $FFFA,$FF
        .DA     BE6502      ; NMI VECTOR
        .DA     BE6502      ; RESET VECTOR
        .DA     BE6502      ; IRQ VECTOR