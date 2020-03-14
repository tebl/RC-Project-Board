;   'SLOT MACHINE'
; SLOT MACHINE SIMULATOR PROGRAM, PRESS ANY KEY TO START 'SPIN'. SCORE 
; DETERMINED BY ARRAY 'SCORTB'. 8 POINTS INITIAL SCORE, ONE POINT PENALTY
; FOR EACH BAD SPIN.

;
; I/O:
;
PORT1B  .EQ     VIA1        ; PORT B
PORT1A  .EQ     VIA1+1      ; PORT A
DDR1B   .EQ     VIA1+2      ; PORT B DATA DIRECTION REGISTER
DDR1A   .EQ     VIA1+3      ; PORT A DATA DIRECTION REGISTER
T1CL    .EQ     VIA1+4

PORT3B  .EQ     VIA3        ; PORT B    
PORT3A  .EQ     VIA3+1      ; PORT A
DDR3B   .EQ     VIA3+2      ; PORT B DATA DIRECTION REGISTER
DDR3A   .EQ     VIA3+3      ; PORT A DATA DIRECTION REGISTER

;
; VARIABLE STORAGE.
;
ZP      .EQ     $00
TEMP    .EQ     ZP          ; TEMPORARY STORAGE.
SCORTP  .EQ     ZP+1        ; TEMPORARY SCORE STORAGE
SCORE   .EQ     ZP+2        ; SCORE.
DUR     .EQ     ZP+3        ; DURATION OF TONES.
FREQ    .EQ     ZP+4    
SPEEDS  .EQ     ZP+5        ; SPEEDS OF REVOLUTION FOR LEDS IN COLUMNS
INDX    .EQ     ZP+8        ; DELAY COUNTERS FOR LED REVOLUTIONS.
INCR    .EQ     ZP+11       ; POINTERS FOR LED POSITIONS:
                            ;  USED TO FETCH PATTERNS OUT OF TABLES.
LTMSK   .EQ     ZP+14       ; PATTERNS FOR LIT LEDS
VALUES  .EQ     ZP+17       ; NUMBER OF LIT LEDS IN EACH ROW.
RND     .EQ     ZP+20       ; SCRATCHPAD FOR RND # GENERATOR.

;
; MAIN PROGRAM
;
        LDA     #$FF        ; SET UP PORTS.
        STA     DDR1A
        STA     DDR1B
        STA     DDR3B
        LDA     T1CL        ; GET SEED FOR RANDOM # GENERATOR.
        STA     RND+1
START   LDA     #8          ; INITIAL SCORE IS EIGHT.
        STA     SCORE
        TAY                 ; SHOW INITIAL SCORE
        JSR     LIGHT
KEY     JSR     GETKEY      ; ANY KEY PRESSED STARTS PROGRAM.
        JSR     DISPLY      ; SPIN WHEELS
        JSR     EVAL        ; CHECK SCORE AND SHOW IT
        LDA     SCORE
        BNE     KEY         ; IF SCORE <> 0, GET NEXT PLAY.
        BEQ     START       ; IF SCORE = 0; RESTART.

;
; SUBROUTINE 'DISPLY'
; SUBROUTINE TO DISPLAY 'SPINNING' LEDS, FIND COMBINATION USED TO
; DETERMINE SCORE.
;
LOLIM = 90
HILIM = 135
SPDPRM = 80
DISPLY  LDA     #0          ; RESET POINTERS.
        STA     INCR
        STA     INCR+1
        STA     INCR+2
LDRND   LDY     #2          ; SET INDEX FOR 3 ITERATIONS.
GETRND  JSR     RANDOM      ; GET RANDOM #.
        CMP     #HILIM      ; TOO LARGE?
        BCS     GETRND      ; IF SO, GET ANOTHER.
        CMP     #LOLIM      ; TOO SMALL?
        BCC     GETRND      ; IF SO, GET ANOTHER.
        STA     INDX,Y      ; SAVE IN LOOP INDEXES AND
        STA     SPEEDS,Y    ;  LOOP SPEED COUNTERS.
        DEY
        BPL     GETRND      ; GET NEXT RND #.
UPDATE  LDX     #2          ; SET INDEX FOR THREE ITERATIONS.
UPDTLP  LDY     SPEEDS,X    ; IS SPEED(X) = 0?
        BEQ     NXTUPD      ; IF SO, DO NEXT UPDATE.
        DEC     INDX,X      ; DECREMENT LOOP INDEX(X)
        BNE     NXTUPD      ; IF LOOPINDEX(X) <> 0, DO NEXT UPDATE.
        LDY     INCR,X      ; INCREMENT POINTER(X).
        INY
        CPY     #3          ; POINTER = 3?
        BNE     NORST       ; IF NOT SKIP...
        LDY     #0          ; ... RESET OF POINTER TO 0.
NORST   STY     INCR,X      ; RESTORE POINTER(X).
        STX     TEMP        ; MULTIPLY X BY 3 FOR ARRAY ACCESS.
        TXA
        ASL     A
        CLC
        ADC     TEMP
        ADC     INCR,X      ; ADD COLUMN # TO PTR(X) FOR ROW#.
        TAY                 ; TRANSFER TO Y FOR INDEXING.
        LDA     LTABLE,Y    ; GET PATTERN FOR LED.
        STA     LTMSK,X     ; STORE IN LIGHT MASK(X).
SPDUPD  LDY     SPEEDS,X    ; INCREMENT SPEED (X).
        INY
        STY     SPEEDS,X    ; RESTORE.    
        STY     INDX,X      ; RESET LOOP INDEX(X).
LEDUPD  LDA     #0          ; UPDATE LIGHTS.
        STA     PORT1B      ; RESET LED #9
        LDA     LTMSK+2     ; COMBINE PATTERN FOR OUTPUT.
        BNE     OFFLD9      ; IF MASK#3 <> 0, LED 9 OFF.
        LDA     #01         ; TURN ON LED 9.
        STA     PORT1B
        LDA     #0          ; RESET A SO PATTERN WON'T BE BAD.
OFFLD9  ORA     LTMSK       ; COMBINE REST OF PATTERNS.
        ORA     LTMSK+1
        STA     PORT1A      ; SET LIGHTS.
        LDA     PORT3B      ; TOGGLE SPEAKER.
        EOR     #$FF
        STA     PORT3B
NXTUPD  DEX                 ; DECREMENT X FOR NEXT UPDATE.
        BPL     UPDTLP      ; IF X >= 0, DO NEXT UPDATE.
        LDY     #SPDPRM     ; DELAY A BIT TO SLOW
WAIT    DEY                 ; FLASHING OF LEDS.
        BNE     WAIT
        LDA     SPEEDS      ; CHECK IF ALL COLUMNS OF LEDS STOPPED.
        ORA     SPEEDS+1
        ORA     SPEEDS+2
        BNE     UPDATE      ; IF NOT, DO NEXT SEQUENCE OF UPDATES.
        LDA     #$FF
        STA     DUR         ; DELAY TO SHOW USER PATTERN.
        JSR     DELAY
        RTS                 ; ALL LEDS STOPPED, DONE.

;
; SUBROUTINE 'EVAL'
; SUBROUTINE TO EVALUATE PRODUCT OF SPIN, AND DISPLAY SCORE WITH TONES FOR
; WIN, LOSE, WIN+ENDGAME AND LOST+ENDGAME.
;
HITONE  = $20
LOTONE  = $F0
EVAL    LDA     #0          ; RESET VARIABLES.
        STA     VALUES
        STA     VALUES+1
        STA     VALUES+2
        STA     SCORTP
        LDY     #2          ; SET INDEX Y FOR 3 ITERATIONS TO COUNT # OF 
                            ;  LEDS ON IN EACH ROW.
CNTLP   LDX     INCR,Y      ; CHECK POINTER(Y), ADDING
        INC     VALUES,X    ;  UP # OF LEDS ON IN EACH ROW.
        DEY
        BPL     CNTLP       ; LOOP IF NOT DONE.
        LDX     #2          ; SET INDEX X FOR 3 ITERATIONS 
                            ; OF LOOP TO FIND SCORE.
SCORLP  TXA                 ; MULTIPLY INDEX BY FOUR FOR ARRAY ROW ACCESS.
        ASL     A
        ASL     A
        CLC                 ; ADD # OF LEDS ON IN ROW(X) TO...
        ADC     VALUES,X    ; ... ARRIVE AT COLUMN ADDRESS IN ARRAY.
        TAY                 ; USE AS INDEX
        LDA     SCORTB,Y    ; GET SCORE FOR THIS SPIN.
        CLC
        ADC     SCORTP      ; ADD TO ANY PREVIOUS SCORES 
                            ; ACCUMULATED IN THIS LOOP.
        STA     SCORTP      ; RESTORE
        DEX
        BPL     SCORLP      ; LOOP IF NOT DONE
        LDA     #$60        ; SET UP DURATIONS FOR TONES.
        STA     DUR
        LDA     SCORTP      ; GET SCORE FOR THIS SPIN.
        BEQ     LOSE        ; IF SCORE IS 0, LOSE A POINT.
WIN     INC     SCORE       ; RAISE OVERALL SCORE BY ONE.
        LDY     SCORE       ; GET SCORE
        CPY     #16         ; WIN WITH 16 POINTS?
        BEQ     WINEND      ; YES; WIN+ENDGAME.
        JSR     LIGHT       ; SHOW SCORE
        LDA     #HITONE     ; PLAY HIGH BEEP.
        JSR     TONE
        JSR     DELAY       ; SHORT DELAY.
        DEC     SCORTP      ; DECREMENT SCORE TO BE ADDED TO...
                            ;  OVERALL SCORE BY ONE.
        BNE     WIN         ; LOOP IF SCORE TRANSFER NOT COMPLETE.
        RTS                 ; DONE, RETURN TO MAIN PROGRAM.
WINEND  LDA     #$FF        ; TURN ALL LEDS ON TO SIGNAL WIN.
        STA     PORT1A
        STA     PORT1B
        STA     TEMP        ; SET FREQ PARAMETER FOR RISING WARBLE.
        LDA     #0
        STA     SCORE       ; CLEAR TO FLAG RESTART.
        LDA     #4
        STA     DUR         ; SHORT DURATION FOR INDIVIDUAL BEEPS IN WARBLE.
RISE    LDA     TEMP        ; GET FREQUENCY...
        JSR     TONE        ; ... FOR BEEP.
        DEC     TEMP        ; NEXT BEEP WILL BE HIGHER.
        BNE     RISE        ; DO NEXT BEEP IF NOT DONE.
        RTS                 ; RETURN FOR RESTART.
LOSE    DEC     SCORE       ; IF SPIN BAD, SCORE=SCORE-1    
        LDY     SCORE       ; SHOW SCORE
        JSR     LIGHT
        LDA     #LOTONE     ; PLAY LOW LOSE TONE.
        JSR     TONE
        LDY     SCORE       ; GET SCORE TO SEE...
        BEQ     LOSEND      ; ... IF GAME IS OVER.
        RTS                 ; IF NOT, RETURN FOR NEXT SPIN.
LOSEND  LDA     #0          ; SET TEMP FOR USE AS FREQUENCY PARAMETER
        STA     TEMP        ;  IN FALLING WARBLE.
        STA     PORT1A      ; CLEAR LED #1.
        LDA     #4
        STA     DUR
FALL    LDA     TEMP
        JSR     TONE        ; PLAY BEEP.
        INC     TEMP        ; NEXT TONE WILL BE LOWER.
        BNE     FALL
        RTS                 ; RETURN FOR RESTART.

;
; SUBROUTINE 'DELAY'
; VARIABLE LENGHT DELAY SUBROUTINE
; DELAY LENGTH = (2046*[DUR]+10) US.
;
DELAY   LDY     DUR         ; GET DELAY LENGHT.
DL1     LDX     #$FF        ; SET COUNTER FOR INNER 2040 US. LOOP TO
DL2     BNE     DL3         ;  WASTE TIME.
DL3     DEX                 ; DECREMENT INNER LOOP COUNTER.
        BNE     DL2         ; LOOP UNTIL INNER LOOP DONE.
        DEY                 ; DECREMENT OUTER LOOP COUNTER.
        BNE     DL1         ; LOOP UNTIL DONE.
        RTS                 ; RETURN.

;
; SUBROUTINE 'LIGHT'
; SUBROUTINE TO LIGHT LEDS CORRESPONDING TO THE CONTENTS OF REGISTER Y ON
; ENTERING.
;
LIGHT   LDA     #0          ; CLEAR ACCUMULATOR FOR BIT SHIFT.
        STA     TEMP        ; CLEAR OVERFLOW FLAG
        STA     PORT1A      ; CLEAR LOW LEDS
        STA     PORT1B      ; CLEAR HIGH LEDS.
        CPY     #15         ; CODE FOR UNCONNECTED BIT?
        BEQ     LIGHT0      ; IF SO, NO CHANGE.
        DEY                 ; DECREMENT TO MATCH.
LIGHT0  SEC                 ; SET BIT TO BE SHIFTED HIGH.
LTSHFT  ROL     A           ; SHIFT BIT LEFT.
        BCC     LTCC        ; IF CARRY SET, OVERFLOW HAS OCCURRED
                            ; INTO HIGH BYTE.
        LDX     #$FF        ; SET OVERFLOW FLAG.
        STX     TEMP
        ROL                 ; MOVE BIT OUT OF CARRY.
LTCC    DEY                 ; ONE LESS BIT TO BE SHIFTED.
        BPL     LTSHFT      ; SHIFT AGAIN IF NOT DONE.
        LDX     TEMP        ; GET OVERFLOW FLAG.
        BNE     HIBYTE      ; IF FLAG <> 0, OVERFLOW: A CONTAINS HIGH BYTE.
LOBYTE  STA     PORT1A      ; STORE A IN LOW ORDER LEDS.
        RTS                 ; RETURN.
HIBYTE  STA     PORT1B      ; STORE A IN HIGH ORDER LEDS.
        RTS                 ; RETURN.

;
; SUBROUTINE 'TONE'
; TONE GENERATION SUBROUTINE.
;
TONE    STA     FREQ
        LDA     #$FF
        STA     PORT3B
        LDA     #0
        LDX     DUR
FL2     LDY     FREQ
FL1     DEY
        CLC
        BCC     FL0
FL0     BNE     FL1
        EOR     #$FF
        STA     PORT3B
        DEX
        BNE     FL2
        RTS

;
; SUBROUTINE 'RANDOM'
; RANDOM NUMBER GENERATOR SUBROUTINE.
;
RANDOM  SEC
        LDA     RND+1
        ADC     RND+4
        ADC     RND+5
        STA     RND
        LDX     #4
RNDSH   LDA     RND,X
        STA     RND+1,X
        DEX
        BPL     RNDSH
        RTS
        
;
; ARRAYS                                   
;

;
; ARRAY OF PATTERNS TO LIGHT LEDS, ARRAY ROWS CORRESPOND TO COLUMNS OF LED 
; ARRAY, AND COLUMNS TO ROWS, FOR EXAMPLE, THIRD BYTE IN ROW ONE WILL LIGHT
; LED 7.
;
LTABLE  .HS     01.08.40.02.10.80.04.20.00

;
; ARRAY OF SCORES RECEIVED FOR CERTAIN PATTERS OF LIT LEDS; ROWS CORRESPOND TO
; ROWS IN LED ARRAY. COLUMNS CORRESPOND TO NUMBER OF LEDS LIT IN THAT ROW.
; I.E. 3 LEDS IN MIDDLE ROW IS 3 PTS.
;
SCORTB  .HS     00.00.00.00.00.00.01.03.00.00.00.00