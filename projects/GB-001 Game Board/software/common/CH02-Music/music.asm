        .CR     6502
        .TF     music.hex,hex
        .LF     music.list

        .OR     $0200
        .TA     $0200
        .IN     player.asm
        .IN     ../CH01-Getkey/getkey_routine.asm