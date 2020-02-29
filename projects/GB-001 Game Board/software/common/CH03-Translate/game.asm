;   'TRANSLATE'
; PROGRAM TO TEST 2 PLAYERS SPEED IN TRANSLATING A BINARY NUMBER TO A SINGLE
; HEXADECIMAL DIGIT. EACH PLAYER IS GIVEN A TURN, AS SHOWN BY A LIGHTED LEFT
; OR RIGHT POINTER. THE NUMBER WILL SUDDENLY FLASH ON LEDS 12-15, ACCOMPANIED
; BY THE LIGHTING OF LED #10. THE PLAYER MUST THEN PUSH THE CORRESPONDING
; BUTTON. AFTER BOTH PLAYERS TAKE TURNS, RESULTS ARE SHOWN ON BOTTOM ROW. AFTER
; 10 WINS, A PLAYERS RESULT WILL FLASH, SHOWING THE BETTER PLAYER. THEN THE
; GAME RESTARTS.
;
PORT1B  .EQ     VIA1        ; LEDS 9-15
PORT1A  .EQ     VIA1+1      ; LEDS 1-8
DDR1B   .EQ     VIA1+2
DDR1A   .EQ     VIA1+3
PORT3B  .EQ     VIA3        ; KEY # OUTPUT
PORT3A  .EQ     VIA3+1      ; KEY STROBE INPUT.
DDR3B   .EQ     VIA3+2
DDR3A   .EQ     VIA3+3
;
; VARIABLE STORAGE:
;
ZP      .EQ     $00
TEMP    .EQ     ZP          ; TEMPORARY STORAGE FOR AMOUNT OF TIME PLAYER 
                            ;  USES TO GUESS.
CNTHI   .EQ     ZP+1
CNTLO   .EQ     ZP+2
CNT1H   .EQ     ZP+3        ; AMOUNT OF TIME PLYR1 USES TO GUESS.
CNT1L   .EQ     ZP+4
PLYR1   .EQ     ZP+5        ; SCORE OF # WON FOR PLAYER 1.
PLYR2   .EQ     ZP+6        ; PLAYER 2 SCORE.
NUMBER  .EQ     ZP+7        ; STORES NUMBER TO BE GUESSED.
SCR     .EQ     ZP+8        ; SCRATCHPAD FOR RND # GEN.
;
; MAIN PROGRAM
;
START   LDA     #$FF        : SET UP PORTS
        STA     DDR1A
        STA     DDR1B
        STA     DDR3B
        LDA     #0
        STA     DDR3A
        STA     PLYR1       ; CLEAR NUMBER OF WINS.
        STA     PLYR2
MOVE    LDA     #%01111001
        STA     PORT1A      ; SHOW RIGHT ARROW
        LDA     #0
        STA     PORT1B
        STA     CNTLO       ; CLEAR COUNTERS
        STA     CNTHI
        JSR     PLAY        ; GET PLAYER 1S TIME.
        LDA     CNTLO       ; TRANSFER TEMP COUNT TO PERMANENT STORAGE
        STA     CNT1L
        LDA     CNTHI
        STA     CNT1H
        LDA     #%00111100  ; SHOW LEFT ARROW
        STA     PORT1A
        LDA     #1
        STA     PORT1B
        LDA     #0
        STA     CNTLO       ; CLEAR COUNTERS
        STA     CNTHI
        JSR     PLAY        ; GET PLAYER 2S TIME.
        LDA     CNTHI       ; GET PLAYER 2S COUNT AND...
        CMP     CNT1H       ;  COMPARE TO PLAYER 1S.
        BEQ     EQUAL       ; CHECK LOW ORDER BYTES TO RESOLVE WINNER.
        BCC     PLR2        ; PLAYER 2 HAS SMALLER COUNT, SHOW IT.
        BCS     PLR1        ; PLAYER 1 HAS SMALLER COUNT, SHOW IT.
EQUAL   LDA     CNTLO       ; HI BYTES WERE EQUAL, SO CHECK LOW BYTES.
        CMP     CNT1L       ; COMPARE SCORES.
        BCC     PLR2        ; PLAYER 2 WINS, SHOW IT.
        BCS     PLR1        ; PLAYER 1 WINS, SHOW IT.
PLR1    LDA     #%11110000  ; LIGTH RIGHT SIDE OF BOTTOM ROW
        STA     PORT1B      ; TO SHOW WIN.
        LDA     #0
        STA     PORT1A      ; CLEAR LOW LEDS.
        LDA     #$40        ; WAIT A WHILE TO SHOW WIN.
        JSR     DELAY
        INC     PLYR1       ; PLAYER 1 WINS ONE MORE...
        LDA     #10         ; ... HAS HE WON 10?
        CMP     PLYR1
        BNE     MOVE        ; IF NOT, PLAY ANOTHER ROUND
        LDA     #%11110000  ; YES - GET BLINK PATTERN.
        JSR     BLINK       ; BLINK WINNING SIDE.
        RTS                 ; END OF GAME: RETURN TO MONITOR.
PLR2    LDA     #%1110      ; LIGHT LEFT SIDE OF BOTTOM.
        STA     PORT1B
        LDA     #0
        STA     PORT1A      ; CLEAR LOW LEDS.
        LDA     #$40        ; WAIT A WHILE TO SHOW WIN.
        JSR     DELAY
        INC     PLYR2       ; PLAYER 2 HAS WON ANOTHER ROUND...
        LDA     #10         ; ... HAS HE WON 10?
        CMP     PLYR2
        BNE     MOVE        ; IF NOT, PLAY ANOTHER ROUND.
        LDA     #%1110      ; YES - GET PATTERN TO BLINK LEDS.
        JSR     BLINK       ; BLINK THEM
        RTS                 ; END.
;
; SUBROUTINE 'PLAY'
; GETS TIME COUNT OF EACH PLAYER, AND IF BAD GUESSES ARE MADE, THE PLAYER IS
; GIVEN ANOTHER CHANCE. THE NEW TIME ADDED TO THE OLD.
;
PLAY    JSR     RANDOM      ; GET RANDOM NUMBER.
        JSR     DELAY       ; RANDOM - LENGTH DELAY.
        JSR     RANDOM      ; GET ANOTHER
        AND     #$0F        ; KEEP UNDER 16 FOR USE AS
        STA     NUMBER      ;  NUMBER TO GUESS.
        TAX                 ; USE AS INDEX TO ...
        LDA     NUMTAB,X    ;  GET REVERSED PATTERN FROM TABLE
        ORA     PORT1B      ;  TO DISPLAY IN LEDS 12-15.
        STA     PORT1B
        JSR     CNTSUB      ; GET KEYSTROKE 1 DURATION COUNT.
        CPY     NUMBER      ; IS KEYSTROKE CORRECT GUESS?
        BEQ     DONE        ; IF SO, DONE.
        LDA     #01         ; NO: CLEAR OLD GUESS FROM LEDS.
        AND     PORT1B
        STA     PORT1B
        JMP     PLAY        ; TRY AGAIN W/ANOTHER NUMBER.
DONE    RTS                 ; RETURN WITH DURATION IN CNTLO+CNTHI
;
; SUBROUTINE 'COUNTER'
; GETS KEYSTROKE WHILE KEEPING TRACK OF AMOUNT OF TIME BEFORE KEYPRESS.
;    
CNTSUB  LDY     #$0F        ; SET UP KEY # COUNTER.
KEYLP   STY     PORT3B      ; OUTPUT KEY # TO KEYBOARD MPXR
        BIT     PORT3A      ; KEY DOWN?
        BPL     FINISH      ; IF YES, DONE.
        DEY                 ; COUNT DOWN KEY #.
        BPL     KEYLP       ; TRY NEXT KEY.
        INC     CNTLO       ; ALL KEYS TRIED, INCREMENT COUNT.
        BNE     CNTSUB      ; TRY KEYS AGAIN IF NO OVERFLOW.
        INC     CNTHI       ; OVERFLOW, INCREMENT HIGH BYTE.
        BNE     CNTSUB      ; TRY KEYS AGAIN.
FINISH  RTS                 ; DONE: TIME RAN OUT OR KEY PRESSED.
;
; SUBROUTINE 'BLINK'
; BLINKS LEDS WHOSE BITS ARE SET IN ACCUMULATOR ON ENTRY.
;
BLINK   LDX     #20         ; 20 BLINKS.
        STX     CNTHI       ; SET BLINK COUNTER.
        STA     CNTLO       ; BLINK REGISTER
BLOOP   LDA     CNTLO       ; GET BLINK PATTERN
        EOR     PORT1B      ; BLINK LEDS.
        STA     PORT1B
        LDA     #10         ; SHORT DELAY
        JSR     DELAY
        DEC     CNTHI
        BNE     BLOOP       ; LOOP IF NOT DONE.
        RTS
;
; SUBROUTINE 'DELAY'
; CONTENTS OF ACCUMULATOR DETERMINES DELAY LENGTH.
;
DELAY   STA     TEMP
DL1     LDY     #$10
DL2     LDX     #$FF
DL3     DEX
        BNE     DL3
        DEY
        BNE     DL2
        DEC     TEMP
        BNE     DL1
        RTS
;
; SUBROUTINE 'RANDOM'
; RANDOM NUMBER GENERATOR, RETURNS RANDOM NUMBER IN ACCUMULATOR.
;
RANDOM  SEC
        LDA     SCR+1
        ADC     SCR+4
        ADC     SCR+5
        STA     SCR
        LDX     #4
RNDLP   LDA     SCR,X
        STA     SCR+1,X
        DEX
        BPL     RNDLP
        RTS
;
; TABLE OF 'REVERSED' NUMBERS FOR DISPLAY
; IN BITS 3-8 OF PORT1B, OR LEDS 12-15.
;
NUMTAB  .DA     #%00000010
        .DA     #%10000010
        .DA     #%00100010
        .DA     #%10100010
        .DA     #%00010010
        .DA     #%10010010
        .DA     #%00110010
        .DA     #%10110010
        .DA     #%00001010
        .DA     #%10001010
        .DA     #%00101010
        .DA     #%10101010
        .DA     #%00011010
        .DA     #%10011010
        .DA     #%00111010
        .DA     #%10111010