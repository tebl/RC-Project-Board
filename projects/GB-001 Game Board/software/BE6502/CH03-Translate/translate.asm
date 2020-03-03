        .CR     65C02
        .TF     translate.hex,INT
        .LF     translate.list
;
; BINARY TRANSLATION GAME FOR THE BE6502 USING '6502 GAMES' HARDWARE. BOARD
; SHOULD BE JUMPERED WITH VIA CHIPS AT THE ADDRESSES SPECIFIED BELOW. CODE
; IS MOSTLY UNCHANGED FROM THE BOOK, LOOKUP TABLE 'NUMTAB' WAS MOVED OUT OF
; ZERO PAGE TO MAKE LOADING A BIT EASIER.
;
; NOTE THAT ALL OF THE PARTS BELONGING TO THE GAME BOARD ASSUMES A TIMING OF
; 1 MHZ, SO ANY MANUAL CLOCKING AND SLOW CLOCKS ARE NOT APPLICABLE.
;
VIA1    .EQ     $4000       ; GAME BOARD (VIA #1)
VIA3    .EQ     $4C00       ; GAME BOARD (VIA #3)

        .OR     $8000
        .TA     $0000
        .IN     ../../common/CH03-Translate/game.asm
;
; STORE CPU INITIALIZATION VECTORS AT THE END OF THE EEPROM.
;
        .NO     $FFFA,$FF
        .DA     START       ; NMI VECTOR
        .DA     START       ; RESET VECTOR
        .DA     START       ; IRQ VECTOR