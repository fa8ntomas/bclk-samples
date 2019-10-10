			; Map 01

Map1Exec:   lda MapSomething
            bne L2D9E
			
            lda MapVar1
            bmi L2D9E
            
			lda CastleOpenFlag		;Load lamp count from screen 6
            beq L2D9E				;Don't open floor again if screen 6 already clear
            
			lda PlayerMap0LampsCounts				;Load lamp count screen 0
            ora PlayerMap1LampsCounts				;Load lamp count screen 1
            ora PlayerMap2LampsCounts				;Load lamp count screen 2
            bne L2D9E				;Load lamp count screen 2
            
			dec MapVar1
            
			lda MapVar1
            cmp #$02
            bne L2D94				;Skip sound if not first time through
            
			jsr PlaySfxEntrance		;Play open floor sound

L2D94:      clc
            adc #$10
            ldx #$0C
            ldy #$11
            jmp PlotChars			;This draws hole in floor over 4 seperate frames
L2D9E:      rts
