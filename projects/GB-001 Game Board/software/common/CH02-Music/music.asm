        .CR     6502
        .TF     music.hex,hex
        .LF     music.list
;
; MUSIC PLAYER USING '6502 GAMES' HARDWARE. BOARD SHOULD BE JUMPERED WITH VIA
; CHIPS AT THE ADDRESSES SPECIFIED BELOW. OTHER THAN THAT THE CODE IS SHOULD
; BE UNCHANGED FROM THE BOOK THOUGH THERE WILL BE SOME DIFFERENCES DUE TO
; ASSEMBLER USED.
;
VIA1    .EQ     $C000
VIA3    .EQ     $CC00

        .OR     $0200
        .TA     $0200
        .IN     player.asm
        .IN     ../CH01-Getkey/getkey_routine.asm