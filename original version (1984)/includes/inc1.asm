PlotFire1:      clc
            adc #$1F
            ldx ROWAC+1
            ldy BITMSK
            jmp PlotChars			;Animates playfield things that scroll across screen
            
PlotFire2:      clc
            adc #$1F
            ldx COLAC
            ldy SHFAMT
            jmp PlotChars			;Animates playfield things that scroll across screen
            
L3782:      clc
            adc #$1F
            ldx COLAC+1
            ldy ROWAC
            jmp PlotChars			;Animates playfield things that scroll across screen
            
PlotFireL378C:      clc
            adc #$07
            jmp PlotFire1
            
            bne PlotFire1
PlotFireL3794:      clc
            adc #$07
            jmp PlotFire2
            
            bne PlotFire2
PlotFire3_7:      clc
            adc #$07
            jmp L3782
            
            bne L3782

Entrance31aa:      jsr PlaySfxEntrance
            sta SAVADR+1
            sty RAMTOP
            lda #$13
            jsr PlotL31EA
            lda #$13
            jsr PlotL31EA
            lda #$14
            jmp PlotL31EA
PlotL31C0:      jsr Entrance31aa
            dec SAVADR+1
            lda #$17
            jmp PlotL31EA
PlotL31CA:      jsr Entrance31aa
            dec SAVADR+1
            lda #$2D
            jmp PlotL31EA
EntranceL31D4:      jsr PlaySfxEntrance
            sta SAVADR+1
            sty RAMTOP
            lda #$63
            jsr PlotL31EA
            lda #$63
            jsr PlotL31EA
            lda #$64
            jmp PlotL31EA
PlotL31EA:      ldx SAVADR+1
            ldy RAMTOP
            jsr PlotChars
            inc SAVADR+1
            rts

;Updates screen 7 and 9 moving thing at bottom              
UpdateRat1:      jsr PlaySfxRat		;Play moving thing sound
            lda #$1C
            ldx BUFSTR
            ldy BUFSTR+1
            jsr PlotChars			;draws moving thing at bottom of screen 7 and 9
            lda #$1B
            ldx BUFSTR
            ldy BUFCNT
            jmp PlotChars			;draws moving thing at bottom of screen 7 and 9
			
UpdateRat2:      jsr PlaySfxRat		;Play moving thing sound
            lda #$55
            ldx BUFSTR
            ldy BUFSTR+1
            jsr PlotChars
            lda #$54
            ldx BUFSTR
            ldy BUFCNT
            jmp PlotChars
			
PlaySfxRat: 
			ldy #$0B				;Moving thing sound
            jmp PlaySfx				;Store in memory
