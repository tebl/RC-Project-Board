        .CR     6502
        .TF     getkey.hex,hex
        .LF     getkey.list

        .OR     $0100       ; NOTE: BOOK PLACES $0100 INSIDE STACK, MEANING
        .TA     $0100       ;  THAT ROUTINE MAY EASILY GET OVERWRITTEN.
        .IN     getkey_routine.asm