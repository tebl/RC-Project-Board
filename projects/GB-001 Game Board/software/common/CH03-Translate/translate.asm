        .CR     6502
        .TF     translate.hex,hex
        .LF     translate.list
;
; BINARY TRANSLATION GAME FOR '6502 GAMES' HARDWARE. BOARD SHOULD BE JUMPERED
; VIA ADDRESSES SPECIFIED BELOW. CODE IS MOSTLY UNCHANGED FROM THE BOOK,
; LOOKUP TABLE 'NUMTAB' WAS MOVED OUT OF ZERO PAGE TO MAKE LOADING A BIT
; EASIER.
;
VIA1    .EQ     $C000
VIA3    .EQ     $CC00

        .OR     $0200
        .TA     $0200
        .IN     game.asm
