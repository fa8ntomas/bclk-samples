; Map 'BLII' Exec


    .local

    lda MapVar1
    bne stillLanterns

    ldx CurrentMap
    lda PlayerMapLampsCounts,x
	and #CONTEXTLAMPCOUNTMASK
    bne stillLanterns

    mwa #text1 TmpWord2
    ldx #8
    ldy #$F
    jsr NewPlotChars
 
    mwa #text2 TmpWord2
    ldx #9
    ldy #$F
    jsr NewPlotChars

    jsr PlaySfxEntrance

    lda #$FF
    sta MapVar1

stillLanterns:
	rts
text1
    .byte $47,$48,$86

text2
    .byte $52,$53,$86

    .endl
