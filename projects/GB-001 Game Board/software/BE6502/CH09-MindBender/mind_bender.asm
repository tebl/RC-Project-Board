        .CR     65C02
        .TF     mind_bender.hex,INT
        .LF     mind_bender.list
;
; MASTERMIND-TYPE OF GAME FOR THE '6502 GAMES' HARDWARE, BOARD SHOULD BE 
; JUMPERED WITH VIA CHIPS AT THE ADDRESSES SPECIFIED BELOW. OTHER THAN THAT 
; THE CODE IS SHOULD BE UNCHANGED FROM THE BOOK THOUGH THERE WILL BE SOME
; DIFFERENCES DUE TO ASSEMBLER USED.
;
VIA1    .EQ     $4000       ; GAME BOARD (VIA #1)
VIA3    .EQ     $4C00       ; GAME BOARD (VIA #3)

        .OR     $8000
        .TA     $0000
BE6502  JSR     INITKEY
        .IN     ../../common/CH09-MindBender/game.asm
        .IN     ../../common/CH01-Getkey/getkey_routine.asm
        .IN     ../../common/CH09-MindBender/interrupt.asm
;
; STORE CPU INITIALIZATION VECTORS AT THE END OF THE EEPROM.
;
        .NO     $FFFA,$FF
        .DA     BE6502      ; NMI VECTOR
        .DA     DOINT       ; RESET VECTOR
        .DA     BE6502      ; IRQ VECTOR