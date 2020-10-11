        .CR     6502
        .TF     song.hex,INT
        .LF     song.list
        
* ----------------------------------------------------------------------
* PLAY A SONG USING THE TIMERS ON THE 6522.
*

ADDRS   .EQ     $01
TEMP    .EQ     $03
YSAVE   .EQ     $04
F       .EQ     $05

VIA     .EQ     $1700
ORA     .EQ     VIA + $1
DDRA    .EQ     VIA + $3    
T1CL    .EQ     VIA + $4
T1CH    .EQ     VIA + $5
TIMER   .EQ     VIA + $7
ACR     .EQ     VIA + $B
IER     .EQ     VIA + $E

        .OR     $0010
        .TA     $0010
TIME20  LDA     #$31
        STA     TIMER
T1      BIT     TIMER       RESET TIMER
        BPL     T1
        DEX
        BNE     TIME20
        RTS

        .OR     $0020
        .TA     $0020
FREQT   STY     YSAVE
        STA     F
FT0     LDA     #$31
        STA     TIMER       START TIMER (1/20 SEC.)
FT1     LDY     F
FT2     INY
        BNE     FT2
        INC     ORA         SWITCH SPEAKER
        BIT     TIMER       TIME LAPSED?
        BPL     FT1         NO: GO ON.
FT3     DEX
        BNE     FT0
        LDY     YSAVE
        RTS
        
        .OR     $0040
        .TA     $0040
START   LDX     #$0F
        TXS
        LDA     #$00
        STA     $17FA
        STA     $17FE
        LDA     #$1C
        STA     $17FB
        STA     $17FF       INTERRUPT VECTOR
        LDA     #$01
        STA     ORA         OUTPUT AUDIO
DACAPO  LDY     #$00
NEXT    LDA     (ADDRS),Y
        STA     TEMP
        AND     #$7F
        TAX                 DURATION
        BEQ     DACAPO
        INY
        LDA     (ADDRS),Y
        BEQ     TONE
        JSR     FREQT
        BIT     TEMP
        BMI     AFTER
        LDX     #$02
        JSR     TIME20
AFTER   INY
        JMP     NEXT
TONE    JSR     TIME20
        BEQ     AFTER