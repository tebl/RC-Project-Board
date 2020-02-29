        .CR     6502
        .TF     music.hex,hex
        .LF     music.list
;
; MUSIC PLAYER FOR THE KIM-1 USING '6502 GAMES' HARDWARE, THIS ASSUMES THE
; BOARD IS JUMPERED FOR ADDRESSES $C000 AND $CC00 FOR VIA CHIPS. OTHER THAN
; THAT THE CODE IS UNCHANGED FROM THE BOOK.
;
        .OR     $0200
        .TA     $0200
        .IN     ../../common/CH02-Music/player.asm
        .IN     ../../common/CH01-Getkey/getkey_routine.asm