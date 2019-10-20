
			; Map 15 exec

Map15Exec:  lda MapVar1
            bmi L35F0
            lda Map15Lamps+0*4
            bne L35F0
            lda #$57
            ldx #$03
            ldy #$11
            jsr PlotChars			;Erases wall on screen $0F
            lda #$58
            ldx #$04
            ldy #$11
            jsr PlotChars			;Erases wall on screen $0F
            dec MapVar1
            jsr PlaySfxEntrance
L35F0:      lda MapVar2
            bmi L3618
            lda Map15Lamps+1*4
            ora Map15Lamps+2*4
            ora Map15Lamps+4*4
            bne L3618
            lda #$57
            ldx #$03
            ldy #$17
            jsr PlotChars			;Erases wall on screen $0F
            lda #$58
            ldx #$04
            ldy #$17
            jsr PlotChars			;Erases wall on screen $0F
            dec MapVar2
            jsr PlaySfxEntrance
L3618:      lda MapVar3
            bmi L3642
            lda PlayerMap15LampsCount
            bne L3642
            lda #$59
            ldx #$09
            ldy #$25
            jsr PlotChars			;Erases wall on screen $0F
            lda #$5A
            ldx #$08
            ldy #$25
            jsr PlotChars			;Erases wall on screen $0F
            lda #$5B
            ldx #$07
            ldy #$25
            jsr PlotChars			;Erases wall on screen $0F
            jsr PlaySfxEntrance
            dec MapVar3
L3642:      rts
