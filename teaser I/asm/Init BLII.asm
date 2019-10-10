; Map 'BLII' Init
    
    .local

    ; Restore DLI colors .... Hum
    lda #$82
    sta Map1Dli5+5
    
    lda #$8
    sta Map1Dli5+7


    mwa #text1 TmpWord2
    ldx #8
    ldy #$F
    jsr NewPlotChars
    
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

	rts

text1
    .byte $0, $0,$86

text2
    .byte $CB, $CB,$CB,$CB,$CB,$CB,$86

text3
    .byte $da, $e3, $86

text4
    .byte $0, $0, $86

    .endl