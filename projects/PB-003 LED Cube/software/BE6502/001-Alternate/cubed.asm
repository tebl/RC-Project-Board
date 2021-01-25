        .CR     6502
        .TF     cubed.hex,INT
        .LF     cubed.list
        
* ----------------------------------------------------------------------
* SIMPLE ALTERNATING PATTERN SHOWN ACROSS THE VARIOUS LED CUBE LAYERS,
* CONTROL SIGNALS WILL BE MIRRORED OUT TO SBC LEDS TO HELP WITH
* DEBUGGING AND ENSURE BATTERIES DRAIN EXTREMELY FAST.
CURRENT .EQ     $04

VIA     .EQ     $6000       SBC VIA
ORB     .EQ     VIA         PORT B DATA
ORA     .EQ     VIA+1       PORT A DATA
DDRB    .EQ     VIA+2       PORT B DATA-DIRECTION
DDRA    .EQ     VIA+3       PORT A DATA-DIRECTION

PP_VIA  .EQ     $4000       PP VIA
PP_ORB  .EQ     PP_VIA
PP_ORA  .EQ     PP_VIA+1
PP_DDRB .EQ     PP_VIA+2
PP_DDRA .EQ     PP_VIA+3    

        .OR     $8000
        .TA     $0000
START   LDA     #$FF        SET SBC VIA PORT B AS OUTPUTS
        STA     DDRB
        
        LDA     #%1111111   PORT A, USED TO LOAD VALUES FOR LED-S
        STA     PP_DDRA      INTO LATCHES.
        LDA     #%0011111   PORT B, USED FOR CONTROL LINES AS WELL AS
        STA     PP_DDRB      SWITCHES.
        
        LDA     #$55        INITIAL VALUE TO START WITH
        STA     CURRENT
        
OUTPUT  LDA     #%00111111  DISABLE ALL LAYERS
        STA     PP_ORB

        LDA     #$FF        ALTERNATE LEDS ON
        EOR     CURRENT      THE LAYERS BY DOING
        STA     CURRENT      AN EXCLUSIVE OR ON
        STA     PP_ORA       THE CURRENT VALUE,
        JSR     LATCH        THEN LATCH THEM.
        
        JSR     DELAY
        LDA     #%00111011
        STA     PP_ORB
        STA     ORB

        JSR     DELAY
        LDA     #%00110111
        STA     PP_ORB
        STA     ORB

        JSR     DELAY
        LDA     #%00101111
        STA     PP_ORB
        STA     ORB

        JSR     DELAY
        LDA     #%00011111
        STA     PP_ORB
        STA     ORB
        
        JMP     OUTPUT
        
LATCH   LDA     #%00111100  LATCH VALUES BY
        STA     PP_ORB       TAKING THE CONTROLS
        LDA     #%00111111   LOW AND THEN
        STA     PP_ORB       HIGH AGAIN.
        RTS


DELAY   LDX     #$FF        LOAD DELAY VALUE INTO X
LPDLY   DEX                 DECREMENT X
        BNE     LPDLY
        RTS


* ---------------------------------------------------------
* STORE VECTORS AT END OF EPROM.
        .OR     $FFFA
        .TA     $7FFA
        .DA     START           NMI VECTOR
        .DA     START           RESET VECTOR
        .DA     START           IRQ VECTOR