;   'MINDBENDER'
; PLAYS MINDBENDER GAME: USER SPECIFIES LENGTH OF NUMBER TO BE GUESSED, THEN
; GUESSES DIGITS, AND COMPUTER TELLS PLAYER HOW MANY OF THE DIGITS GUESSED
; WERE RIGHT, AND HOW MANY OF THOSE CORRECT DIGITS WERE IN THE CORRECT PLACE,
; UNTIL THE PLAYER CAN GUESS THE NUMBER ON THE BOARD. BLINKING LEDS INDICATE
; CORRECT VALUE & CORRECT DIGIT, AND NON-BLINKING LEDS SHOW CORRECT DIGIT
; VALUE, BUT WRONG PLACE.
;
; THE BOTTOM ROW OF LEDS IS USED TO SHOW THE MODE OF THE PROGRAM: IF THE
; LEFTMOST LEDS ARE LIT, THE PROGRAM EXPECTS A GUESS. THE PROGRAM REJECTS
; UNSUITABLE VALUES FOR A NUMBER LENGTH, WHICH CAN ONLY BE 1-9, A VALUE OTHER
; THAN 0-9 FOR A GUESS RESTARTS THE GAME.
;
; A LOW TONE DENOTES A BAD GUESS, A HIGH TONE, A WIN. AFTER A WIN, THE PROGRAM
; RESTARTS. AN INTERRUPT ROUTINE IS USED TO BLINK THE LEDS.
;
PORT1B  .EQ     VIA1        ; PORT B
PORT1A  .EQ     VIA1+1      ; PORT A
DDR1B   .EQ     VIA1+2      ; PORT B DATA DIRECTION REGISTER
DDR1A   .EQ     VIA1+3      ; PORT A DATA DIRECTION REGISTER
T1LL    .EQ     VIA1+4      ; TIMER 1 LATCH LOW
T1CH    .EQ     VIA1+5      ; TIMER 1 COUNTER HIGH
IER     .EQ     VIA1+14     ; INTERRUPT ENABLE REGISTER
ACR     .EQ     VIA1+11     ; AUXILLIARY CONTROL REGISTER

PORT3B  .EQ     VIA3        ; PORT B    
PORT3A  .EQ     VIA3+1      ; PORT A
DDR3B   .EQ     VIA3+2      ; PORT B DATA DIRECTION REGISTER
DDR3A   .EQ     VIA3+3      ; PORT A DATA DIRECTION REGISTER

;
; VARIABLE STORAGE.
;
ZP      .EQ     $00
DIGITS  .EQ     ZP          ; NUMBER OF DIGITS TO BE GUESSED
DUR     .EQ     ZP+1        ; TONE DURATION CONSTANT
XTEMP   .EQ     ZP+2        ; TEMP STORAGE FOR X REGISTER
YTEMP   .EQ     ZP+3        ; TEMP STORAGE FOR Y REGISTER
CNT     .EQ     ZP+4        ; KEEPS TRACK OF # OF MATCHES
MASKA   .EQ     ZP+5        ; CONTAINS PATTERN EOR-ED WITH LED
                            ;  STATUS REGISTER A TO CAUSE BLINK
MASKB   .EQ     ZP+6        ; LED PORT B BLINK MASK
FREQ    .EQ     ZP+7        ; TEMPORARY STORAGE FOR TONE FREQUENCY
CNT1    .EQ     ZP+8        ; # OF CORRECT DIGITS IN RIGHT PLACE
RND     .EQ     ZP+9        ; FIRST OF RANDOM # LOCATIONS
DIG0    .EQ     ZP+15       ; FIRST OF 9 DIGIT LOCATIONS
ENTRY0  .EQ     ZP+18       ; FIRST OF 9 GUESS LOCATIONS
IRQVECL .EQ     $A67E       ; INTERRUPT VECTOR LOW ORDER BYTE
IRQVECH .EQ     $A67F       ;  AND HIGH ORDER    

;
; ROUTINE TO SET UP VARIABLES AND INTERRUPT TIMER FOR LED FLASHING.
;
START   LDA     #$EA        ; LOAD LOW INTERRUPT VECTOR
        STA     IRQVECL     ; ... AND SET AT VECTOR LOCATION.
        LDA     #$03        ; LOAD INTERRUPT VECTOR ...
        STA     IRQVECH     ; ... AND STORE.
        LDA     #$7F        ; CLEAR INTERRUPT ENABLE REGISTER
        STA     IER
        LDA     #$C0        ; ENABLE TIMER 1 INTERRUPT
        STA     IER
        LDA     #$40        ; ENABLE TIMER 1 IN FREE-RUN MODE
        STA     ACR
        LDA     #$FF
        STA     T1LL        ; SET LOW LATCH ON TIMER 1
        STA     T1CH        ; SET LATCH HIGH & START COUNT
        CLI                 ; ENABLE INTERRUPTS
        STA     DDR1A       ; SET VIA 1 PORT A FOR OUTPUT
        STA     DDR1B       ; SET VIA 1 PORT B FOR OUTPUT
        STA     DDR3B       ; SET VIA 3 PORT B FOR OUTPUT
KEY1    LDA     #0          ; CLEAR LEDS
        STA     PORT1A
        STA     PORT1B
        STA     MASKA       ; CLEAR BLINK MASKS
        STA     MASKB
;
; ROUTINE TO GET NUMBER OF DIGITS TO GUESS, THEN FILL THE DIGITS WITH RANDOM
; NUMBERS FROM 0-9.
;
        LDA     #%00000010  ; LIGHT LED TO SIGNAL USER TO
        STA     PORT1B      ;  INPUT # OF DIGITS NEEDED.
        JSR     GETKEY      ; GET # OF DIGITS
        CMP     #10         ; IF KEY# > 9, RESTART GAME
        BPL     KEY1
        CMP     #0          ; CHECK FOR 0 DIGITS TO GUESS
        BEQ     KEY1        ; ... 0 DIGITS NOT ALLOWED.
        STA     DIGITS      ; STORE VALID # OF DIGITS
        LDA     T1LL        ; GET RANDOM #,
        STA     RND+1       ;  USE IT TO START RANDOM
        STA     RND+4       ;  NUMBER GENERATOR.
        STA     RND+5
        LDY     DIGITS      ; GET # OF DIGITS TO BE GUESSED
        DEY                 ; ... AND COUNT DOWN TO 0, FILLING THEM WITH VALUES
RAND    JSR     RANDOM      ; GET RANDOM VALUE FOR DIGIT
        SED
        ADC     #00         ; DECIMAL ADJUST
        CLD
        AND     #%00001111  ; KEEP DIGIT < 10
        STA     DIG0,Y      ; SAVE IT IN DIGIT TABLE.
        DEY
        BPL     RAND        ; FILL NEXT DIGIT
;
; ROUTINE TO FILL GUESS TABLE WITH USERS GUESSES
;
ENTER   LDA     #0          ; CLEAR ENTRY TABLE POINTER
        STA     XTEMP
        LDA     #%00000110  ; LET USER KNOW THAT GUESSES
        ORA     PORT1B      ;  SHOULD BE INPUT ...
        STA     PORT1B      ; ... WITHOUT CHANGING ARRAY
KEY2    JSR     GETKEY      ; GET GUESS
        CMP     #10         ; IS IT GREATER THAN 9?
        BPL     KEY1        ; IF YES, RESTART GAME.
        LDX     XTEMP       ; GET POINTER FOR INDEXING
        STA     ENTRY0,X    ; STORE GUESS IN TABLE
        INX                 ; INCREMENT POINTER
        STX     XTEMP
        CPX     DIGITS      ; CORRECT # OF GUESSES FETCHED?
        BNE     KEY2        ; IF NOT, GET ANOTHER
;
; THIS ROUTINE COMPARES USERS GUESSES WITH DIGITS OF NUMBER TO GUESS. FOR
; EACH CORRECT DIGIT IN THE CORRECT PLACE, A BLINKING LED IS LIT, AND FOR
; EACH CORRECT DIGIT IN THE WRONG PLACE, A NON-BLINKING LED IS LIT.
;
        LDX     #0          ; CLEAR FOLLOWING STORAGES:
        STX     PORT1A      ;  LEDS
        STX     PORT1B
        STX     MASKA       ;  BLINK MASKS
        STX     MASKB
        STX     CNT         ; COUNT OF MATCHES
        STX     CNT1        ; COUNT OF RIGHT DIGITS
DIGLP   LDA     DIG0,X      ; LOAD 1ST DIGIT OF # FOR COMPARISON
        CMP     ENTRY0,X    ; RIGHT GUESS, RIGHT PLACE?
        BNE     ENTCMP      ; NO, IS RIGHT GUESS IN WRONG PLACE?
        INC     CNT1        ; ONE MORE RIGHT GUESS/RIGHT PLACE
        BNE     NEXTDIG     ; EXAMINE NEXT DIGIT OF NUMBER
ENTCMP  LDY     #0          ; RESET GUESS # PTR FOR COMPARES
ENTRYLP CMP     ENTRY0,Y    ; RIGHT DIGIT, WRONG PLACE?
        BNE     NEXTENT     ; NO, SEE IF NEXT DIGIT IS.
        INC     CNT         ; ONE MORE RIGHT DIGIT/WRONG PLACE
        BNE     NEXTDIG     ; EXAMINE NEXT DIGIT OF NUMBER
NEXTENT INY                 ; INCREMENT GUESS # POINTER
        CPY     DIGITS      ; ALL GUESSES TESTED?
        BNE     ENTRYLP     ; NO, TRY NEXT GUESS.
NEXTDIG INX                 ; INCREMENT DIGIT # POINTER
        CPX     DIGITS      ; ALL DIGITS EVALUATED?
        BNE     DIGLP       ; NO, CHECK NEXT DIGIT.
        CLC                 ; GET READY FOR ADD...
        LDA     CNT         ;  OF TOTAL MATCHES TO DETERMINE
        ADC     CNT1        ;  NUMBER OF LEDS TO LIGHT.
        TAY                 ; TRANSFER A TO Y FOR 'LIGHT' ROUTINE
        JSR     LITE        ; GET PATTERN TO LIGHT LEDS
        STA     PORT1A      ; TURN LEDS ON
        BCC     CC          ; IF CARRY=0, DON'T LIGHT PB0
        LDA     #1
        STA     PORT1B      ; TURN PB0 ON.
CC      LDY     CNT1        ; LOAD # OF LEDS TO BLINK
        JSR     LITE        ; GET PATTERN
        STA     MASKA       ; START TO BLINK LEDS
        BCC     TEST        ; IF CARRY=0, PB0 WON'T BLINK
        LDA     #1
        STA     MASKB
;
; ROUTINE TO TEST FOR WIN BY CHECKING IF # OF CORRECT DIGITS IN CORRECT
; PLACES = NUMBER OF DIGITS. IF WIN, A HIGH PITCHED SOUND IS GENERATED, AND
; IF ANY DIGIT IS WRONG, A LOW SOUND IS GENERATED INSTEAD.
;
TEST    LDX     CNT1        ; LOAD NUMBER OF CORRECT DIGITS
        CPX     DIGITS      ; ALL GUESSES CORRECT?
        BEQ     WIN         ; IF YES, PLAYER WINS
BAD     LDA     #$72
        STA     DUR         ; SET UP LENGTH OF LOW TONE
        LDA     #$BE        ; TONE VALUE FOR LOW TONE
        JSR     TONE        ; SIGNAL BAD GUESSES WITH TONE
        BEQ     ENTER       ; GET NEXT GUESSES
WIN     LDA     #$FF        ; DURATION FOR HIGH TONE
        STA     DUR
        LDA     #$54        ; TONE VALUE FOR HIGH TONE
        JSR     TONE        ; SIGNAL WIN
        JMP     KEY1        ; RESTART GAME
;
; ROUTINE TO FILL ACCUMULATOR WITH ONES, STARTING AT THE LOW ORDER END, UP
; TO AND INCLUDING THE BIT POSITION CORRESPONDING TO THE # OF LEDS TO BE LIT
; OR SET TO BLINKING.
;
LITE    BNE     STRTSH      ; IF Y NOT ZERO, SHIFT ONES IN
        LDA     #0          ; SPECIAL CASE: RESULT IS NO ONES.
        CLC
        RTS
STRTSH  LDA     #0          ; CLEAR A SO PATTERN WILL SHOW
SHIFT   SEC                 ; MAKE A BIT HIGH
        ROL     A           ; SHIFT IT TO CORRECT POSITION
        DEY                 ; BY LOOPING TO # OF GUESS/DIGIT
                            ;  MATCHES, AS PASSED IN Y
        BNE     SHIFT       ; LOOP UNTIL DONE
        RTS
;
; RANDOM NUMBER GENERATOR
; USES NUMBERS A,B,C,D,E,F STORED AS RND THROUGH RND+5: ADDS B+E+F+1 AND
; PLACES RESULT IN A, THEN SHIFTS A TO B, B TO C, ETC. THE NEW RANDOM NUMBER
; WHICH IS BETWEEN 0 AND 255 INCLUSIVE IS IN THE ACCUMULATOR ON EXIT.
;
RANDOM  SEC                 ; CARRY ADDS VALUE 1
        LDA     RND+1       ; ADD A,B,E AND CARRY
        ADC     RND+4
        ADC     RND+5
        STA     RND
        LDX     #4          ; SHIFT NUMBERS OVER
RPL     LDA     RND,X
        STA     RND+1,X
        DEX
        BPL     RPL
        RTS
;
; TONE GENERATOR ROUTINE
; DURATION OF TONE (NUMBER OF CYCLES TO CREATE) SHOULD BE IN 'DUR' ON ENTRY,
; AND THE NOTE VALUE (FREQUENCY) IN THE ACCUMULATOR.
;
TONE    STA     FREQ
        LDA     #$FF
        STA     PORT3B
        LDA     #$00
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