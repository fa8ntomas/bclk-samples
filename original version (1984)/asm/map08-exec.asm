			; Map 08 exec
            
Map8Exec:   lda PlayerMap7LampsCount
            ora Map8Lamps+2*4
            bne L320A
            lda MapVar3
            bmi L320A
            dec MapVar3
            lda #$07
            ldy #$0E
            jsr Entrance31aa
L320A:      lda Map8Lamps+0*4			
            ora Map8Lamps+1*4
            bne L322F
			
            lda MapVar4
            bmi L322F
            dec MapVar4
            lda Map8Lamps+3*4
            beq L3228
            
			lda #VINE_DN   
            sta VineDir
			
            lda #$07
            sta VineSpeed
L3228:      lda #$07
            ldy #$19
            jsr Entrance31aa
L322F:      lda PlayerMap8LampsCount
            ora Map9Lamps+2*4
            ora Map9Lamps+3*4
            bne L3248
            lda MapVar5
            bmi L3248
            dec MapVar5
            lda #$02
            ldy #$26
            jsr PlotL31CA
L3248:      lda Map8Lamps+2*4
            bne L325C
            lda MapVar1
            bmi L325C
            dec MapVar1
            lda #$0A
            ldy #$01
            jsr Entrance31aa
L325C:      lda PlayerMap7LampsCount
            ora PlayerMap8LampsCount
            bne L3271
            lda MapVar2
            bmi L3271
            dec MapVar2
            lda #$0A
            ldy #$26
            jsr Entrance31aa
L3271:      lda MapSomething
            beq L3276
            rts
            
L3276:      inc ENDPT
            bmi L32A5
            lda ENDPT
            cmp #$03
            beq L328A
            cmp #$07
            beq L329D
L3284:      jsr PlotFire1
            jmp L32A5
            
L328A:      ldx BITMSK
            cpx #$0B
            bcs L3284
            lda #$06
            jsr PlotFire1
            inc BITMSK
            lda #$02
            sta ENDPT
            bne L3284
L329D:      lda #$06
            sta BITMSK
            lda #$F2
            sta ENDPT
L32A5:      inc ENDPT+1
            bmi L32D4
            lda ENDPT+1
            cmp #$03
            beq L32B9
            cmp #$07
            beq L32CC
L32B3:      jsr PlotFire2
            jmp L32D4
            
L32B9:      ldx SHFAMT
            cpx #$20
            bcs L32B3
            lda #$06
            jsr PlotFire2
            inc SHFAMT
            lda #$02
            sta ENDPT+1
            bne L32B3
L32CC:      lda #$1B
            sta SHFAMT
            lda #$F2
            sta ENDPT+1
L32D4:      jmp UpdateVines
