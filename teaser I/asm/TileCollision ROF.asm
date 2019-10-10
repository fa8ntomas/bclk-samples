; Map 'ROF' Tile Collision

    .local
    cmp #$15
    beq fatal
	
    cmp #$16
    beq fatal

    cmp #$17
    beq fatal
	

    rts

fatal
    jmp HitFatal


    .endl