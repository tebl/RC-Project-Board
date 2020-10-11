        .CR     6502
        .TF     piano.hex,INT
        .LF     piano.list
        
* ----------------------------------------------------------------------
* PLAY A SINGLE NOTE USING TIMER1 ON 6522 (VIA) FOUND ON THE PROJECT
* BOARD. REQUIRES INTERRUPT VECTOR CONFIGURED TO POINT TO INTR (SEE
* LISTING).
*
VOLUME  .EQ     $D0
TEMP    .EQ     $D1    
OUTPUT  .EQ     $D2


POINTH  .EQ     $FB         DIGITS 1-2
POINTL  .EQ     $FA         DIGITS 3-4
INH     .EQ     $F9         DIGITS 5-6
SCANDS  .EQ     $1F1F

VIA     .EQ     $1700
IRB     .EQ     VIA
ORA     .EQ     VIA + $1
DDRB    .EQ     VIA + $2
DDRA    .EQ     VIA + $3    
T1CL    .EQ     VIA + $4
T1CH    .EQ     VIA + $5
ACR     .EQ     VIA + $B
IER     .EQ     VIA + $E

        .OR     $0200
        .TA     $0200

SETUP   LDA     #$FF        SET PORT A
        STA     DDRA         AS OUTPUTS
        LDA     #$00        SET PORT B
        STA     DDRB         AS INPUTS
TIMER   LDA     #$FF        RESET TIMER1
        STA     T1CL
        STA     T1CH
        LDA     #$40        FREE-RUN MODE WITHOUT
        STA     ACR          ENABLING OUTPUT ON PB7
        LDA     #$C0        ENABLE VIA
        STA     IER          INTERRUPT
        CLI                 ENABLE CPU INTERRUPT

WAIT    LDA     #$FF        READ SWITCHES,
        EOR     IRB          BUT INVERT LOGIC
        STA     VOLUME       TO AVOID KEEPING
        JMP     WAIT         VOLUME AT 100%

SETNOTE LDA     #$E4
        STA     T1CL
        LDA     #$17
        STA     T1CH
        RTS

INTR    LDA     T1CL
        LDA     VOLUME
        CMP     TEMP
        BEQ     TOGGLE
        STA     TEMP
        STA     OUTPUT
TOGGLE  LDA     #$FF
        EOR     OUTPUT
        STA     OUTPUT
        STA     ORA
        CLI
        RTI