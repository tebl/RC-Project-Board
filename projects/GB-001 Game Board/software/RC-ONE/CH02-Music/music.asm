        .CR     6502
        .TF     music.hex,INT
        .LF     music.list
;
; MUSIC PLAYER FOR THE KIM-1 USING '6502 GAMES' HARDWARE. BOARD SHOULD BE 
; JUMPERED WITH VIA CHIPS AT THE ADDRESSES SPECIFIED BELOW. OTHER THAN THAT
; THE CODE IS UNCHANGED FROM THE BOOK.
;
VIA1    .EQ     $C000
VIA3    .EQ     $CC00
TABEG   .EQ     $0350       ; TABLE TO STORE MUSIC

        .OR     $0200
        .TA     $0200
RCONE   JSR     INITKEY
        .IN     ../../common/CH02-Music/player.asm
        .IN     ../../common/CH01-Getkey/getkey_routine.asm