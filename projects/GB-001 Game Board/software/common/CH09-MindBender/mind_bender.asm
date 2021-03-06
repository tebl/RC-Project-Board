        .CR     6502
        .TF     mind_bender.hex,INT
        .LF     mind_bender.list
;
; PATTERN/TONE RECALL AND ESP TEST PROGRAM. FOR THE '6502 GAMES' HARDWARE,
; BOARD SHOULD BE JUMPERED WITH VIA CHIPS AT THE ADDRESSES SPECIFIED BELOW. 
; OTHER THAN THAT THE CODE IS SHOULD BE UNCHANGED FROM THE BOOK THOUGH THERE 
; WILL BE SOME DIFFERENCES DUE TO ASSEMBLER USED.
;
VIA1    .EQ     $C000
VIA3    .EQ     $CC00
        
        .OR     $0200
        .TA     $0200
BEGIN   JSR     INITKEY
        .IN     game.asm
        .IN     ../../common/CH01-Getkey/getkey_routine.asm
        .NO     $03EA,$FF
        .IN     interrupt.asm
