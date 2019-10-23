			; Map 00 Exec
			
            lda CastleOpenFlag
            bne L2D71
            lda MapSomething
            bne L2D71
            dec MapVar1
            bpl L2D71
            lda MapVar2
            bne L2D60
		
            ldy #$0A		;Play cow moo sound screen 0
            jsr PlaySfx

            lda #$1D
            ldx #$09
            ldy #$07
            jsr PlotChars	;Animates cow screen 0

            inc MapVar2
            bne L2D71

L2D60:      lda #$1E
            ldx #$09
            ldy #$07
            jsr PlotChars	;Animates cow screen 0

            dec MapVar2

            lda #$05
            sta MapVar1

L2D71:      rts
