        .CR     6502
        .TF     magicsquare.hex,hex
        .LF     magicsquare.list
;
; HEX GUESSING GAME USING '6502 GAMES' HARDWARE. BOARD SHOULD BE JUMPERED WITH
; VIA CHIPS AT THE ADDRESSES SPECIFIED BELOW. OTHER THAN THAT THE CODE IS SHOULD
; BE UNCHANGED FROM THE BOOK THOUGH THERE WILL BE SOME DIFFERENCES DUE TO
; ASSEMBLER USED.
;
VIA1    .EQ     $C000
VIA3    .EQ     $CC00

        .OR     $0200
        .TA     $0200
BEGIN   JSR     INITKEY
        .IN     game.asm
        .IN     ../CH01-Getkey/getkey_routine.asm