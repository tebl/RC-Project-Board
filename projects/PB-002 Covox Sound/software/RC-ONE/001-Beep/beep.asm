        .CR     6502
        .TF     beep.hex,INT
        .LF     beep.list
        
* ----------------------------------------------------------------------
* SAMPLE PROGRAM AS FOUND IN THE BOOK "6502 APPLICATIONS BOOK" BY RODNEY
* ZAKS, IT IS A SOFTWARE METHOD OF CONTROLLING SOUND DURATION.ADAPTED FOR
* THE KIM-1 WITH THE 6502 PROJECT PLATFORM BOARD / COVOX PROJECT BOARD.
*
DELAY   .EQ     $04

VIA     .EQ     $1700
IRB     .EQ     VIA
ORA     .EQ     VIA+1
DDRB    .EQ     VIA+2
DDRA    .EQ     VIA+3    

        .OR     $0200
        .TA     $0200
START   LDA     #$80        LOAD A DEFAULT VALUE, START PROGRAM AT
        STA     DELAY        BSCSPK TO JUST USE ZP $04 AS IN THE BOOK.
BSCSPK  LDA     #$FF        SET PORT A
        STA     DDRA         AS OUTPUTS
        
AGAIN   LDA     #$20        DEFAULT VOLUME
        STA     ORA         SET SPEAKER DRIVER HIGH
        JSR     DLYB        CALL DELAY
        LDA     #$00
        STA     ORA         SET SPEAKER DRIVER LOW
        JSR     DLYB        CALL DELAY
        JMP     AGAIN
        
DLYB    LDX     DELAY       LOAD DELAY VALUE INTO X
LPXB    INX                 INCREMENT X
        CPX     #$00
        BMI     LPXB        LOOP TILL (X)=0
        RTS