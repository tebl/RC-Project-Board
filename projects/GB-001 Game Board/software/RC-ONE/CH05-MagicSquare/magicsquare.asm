        .CR     6502
        .TF     magicsquare.hex,hex
        .LF     magicsquare.list
;
; MAGIC SQUARE GAME FOR THE KIM-1 USING '6502 GAMES' HARDWARE. BOARD SHOULD BE
; JUMPERED WITH VIA CHIPS AT THE ADDRESSES SPECIFIED BELOW. OTHER THAN THAT
; THE CODE IS UNCHANGED FROM THE BOOK.
;
VIA1    .EQ     $C000
VIA3    .EQ     $CC00

        .OR     $0200
        .TA     $0200
RCONE   JSR     INITKEY
        .IN     ../../common/CH05-MagicSquare/game.asm
        .IN     ../../common/CH01-Getkey/getkey_routine.asm