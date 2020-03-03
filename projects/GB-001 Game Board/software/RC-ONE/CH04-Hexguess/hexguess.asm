        .CR     6502
        .TF     hexguess.hex,INT
        .LF     hexguess.list
;
; HEX GUESSING GAME FOR THE KIM-1 USING '6502 GAMES' HARDWARE. BOARD SHOULD BE
; JUMPERED WITH VIA CHIPS AT THE ADDRESSES SPECIFIED BELOW. OTHER THAN THAT
; THE CODE IS UNCHANGED FROM THE BOOK.
;
VIA1    .EQ     $C000
VIA3    .EQ     $CC00

        .OR     $0200
        .TA     $0200
RCONE   JSR     INITKEY
        .IN     ../../common/CH04-Hexguess/game.asm
        .IN     ../../common/CH01-Getkey/getkey_routine.asm