; Map 'BLII' Tile Collision

    .local

    cpx #0
    bne notbruce

    cmp #$f0
    beq showladder

    cmp #$f1
    bne notbruce

showladder
   
    mwa #text2 TmpWord2
    ldx #9
    ldy #$E
    jsr NewPlotChars
    
    mwa #text3 TmpWord2
    ldx #$A
    ldy #$F
    jsr NewPlotChars
  
    mwa #text4 TmpWord2
    ldx #$B
    ldy #$F
    jsr NewPlotChars

    lda #$86
    sta Map1Dli5+5
    
    lda #$E
    sta Map1Dli5+7

    jsr PlaySfxEntrance

notbruce
	rts


text2
    .byte $D1,$52,$53,$D4,$86

text3
    .byte $65,$66, $86
text4
    .byte $76,$76, $86


    .endl

