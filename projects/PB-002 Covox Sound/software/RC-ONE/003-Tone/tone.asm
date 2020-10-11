        .CR     6502
        .TF     tone.hex,INT
        .LF     tone.list
        
* ----------------------------------------------------------------------
* PLAY A SINGLE NOTE USING TIMER1 ON 6522 (VIA) FOUND ON THE PROJECT
* BOARD. REQUIRES INTERRUPT VECTOR CONFIGURED TO POINT TO INTR (SEE
* LISTING).
*
VOLUME  .EQ     $D0

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
TIMER   LDA     #$FF        RESET TIMER1
        STA     T1CL
        STA     T1CH
        LDA     #$40        FREE-RUN MODE WITHOUT
        STA     ACR          ENABLING OUTPUT ON PB7
        LDA     #$C0        ENABLE VIA
        STA     IER          INTERRUPT
        CLI                 ENABLE CPU INTERRUPT

SETNOTE LDA     #$E4
        STA     T1CL
        LDA     #$17
        STA     T1CH

WAIT    LDX     #$7F
MORE    NOP
        DEX
        BNE     MORE
        JMP     WAIT

INTR    LDA     #$FF
        EOR     VOLUME
        STA     VOLUME
        STA     ORA
        CLI
        RTI