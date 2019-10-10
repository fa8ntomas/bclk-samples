; Map 'BruceIsBackHome' Exec

    lda MapVar2
    bne noop

    ldy MapVar1
    cpy #$40
    bne doInc

    
    lda #$36
    sta Map2Dli0+7
    sta MapVar2
   
    jsr PlaySfxEntrance

noop:
	rts

doInc:
    iny
    sty MapVar1
    rts