			; Map 07 exec
			
Map7Exec:   jsr UpdateTrees

            lda Map7Lamps+0*4	
            ora Map7Lamps+1*4
            ora Map7Lamps+2*4
            ora Map7Lamps+3*4
            ora Map7Lamps+4*4
            bne L3102
			
            lda MapVar1
            bmi L3102
            
			dec MapVar1
            
			lda #$02
            ldy #$21
            jmp PlotL31C0
			
L3102:      lda Map7Lamps+5*4
            ora Map7Lamps+6*4
            ora Map7Lamps+7*4
            ora Map7Lamps+8*4
            ora Map7Lamps+9*4
            ora Map7Lamps+10*4
            bne L3125

            lda MapVar2            
			bmi L3125
			
            dec MapVar2
            
			lda #$05
            ldy #$26
            jmp PlotL31C0

			; fires and rats
            
L3125:      lda MapSomething
            bne L3158
            inc ENDPT
            bmi L3158
            lda ENDPT
            cmp #$03
            beq L313D
            cmp #$07
            beq L3150
L3137:      jsr PlotFireL378C
            jmp L3158
            
L313D:      ldx Fire1X
            cpx #$24
            bcs L3137
            lda #$06
            jsr PlotFireL378C
            inc Fire1X
            lda #$02
            sta ENDPT
            bne L3137
L3150:      lda #$22
            sta Fire1X
            lda #$ED
            sta ENDPT
L3158:      dec MapVar3
            beq L318E
            bpl L3164
            lda #$01
            sta MapVar3
L3164:      lda Map7Lamps+11*4
            ora Map7Lamps+12*4
            beq L317D
            lda BUFCNT
            sta BUFSTR+1
            inc BUFCNT
            cmp #$23
            bcc L317A
            lda #$05
            sta BUFCNT
L317A:      jmp UpdateRat1

L317D:      lda BUFCNT
            sta BUFSTR+1
            dec BUFCNT
            cmp #$06
            bcs L318B
            lda #$24
            sta BUFCNT
L318B:      jmp UpdateRat1

L318E:      rts
