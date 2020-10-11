        .CR     6502
        .TF     siren.hex,INT
        .LF     siren.list
        
* ----------------------------------------------------------------------
* SIREN PROGRAM AS FOUND IN THE BOOK "6502 APPLICATIONS BOOK" BY RODNEY
* ZAKS. ADAPTED FOR THE KIM-1 WITH THE 6502 PROJECT PLATFORM BOARD AND
* COVOX PROJECT BOARD.
*
DELAY   .EQ     $D1

VIA     .EQ     $1700
IRB     .EQ     VIA
ORA     .EQ     VIA + $1
DDRB    .EQ     VIA + $2
DDRA    .EQ     VIA + $3    

        .OR     $0200
        .TA     $0200

START   LDA     #$FF        SET PORT A
        STA     DDRA         AS OUTPUTS
        STA     DELAY       INITIALIZE DELAY
        LDA     #$03        INITIALIZE VOLUME
        STA     ORA         
SWITCH  LDA     #$FF        EXCLUSIVE OR WITH
        EOR     ORA          MASK $FF IS USED
        STA     ORA          TO INVERT OUTPUT.
        LDX     DELAY       
LOOP    DEX
        BNE     LOOP
        DEC     DELAY
        JMP     SWITCH