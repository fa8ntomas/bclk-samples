			; Map 05 exec
			; The blinking lamps

Map5Exec:   lda Map5Lamps+8*4; 			; lamp check
            bne L2FC3
            lda MapVar3
            bmi L2FC3
            dec MapVar3
            lda #$0A
            ldy #$19
            jsr Entrance31aa	;Opens first door on screen 5
            lda #$0A
            ldy #$1A
            jsr Entrance31aa	;Opens first door on screen 5
            lda #$06
            jsr PlotFire2
			
L2FC3:      lda Map5Lamps+6*4			; lamp
            bne L2FE0
            lda MapVar4
            bmi L2FE0
            dec MapVar4
            lda #$0A
            ldy #$00
            jsr Entrance31aa	;Opens second door on screen 5
            lda #$15
            ldx #$0B
            ldy #$00
            jsr PlotChars		;Opens second door on screen 5, possibly a wall too?
			
L2FE0:      lda CastleOpenFlag	;Load lamp count on screen 6
            ora Map5Lamps+2*4
            beq L2FEE
            lda CastleOpenFlag
            ora Map5Lamps+4*4
            bne L300D
L2FEE:      lda MapVar5
            bmi L300D
            dec MapVar5
            lda #$19
            ldx #$02
            ldy #$22
            jsr PlotChars		;Opens walls on screen 5
            lda #$03
            ldy #$1E
            jsr Entrance31aa
            lda #$06
            ldy #$20
            jsr Entrance31aa
			
			; fire
L300D:      lda MapSomething
            beq L3014
            jmp L30A6
			
L3014:      inc ENDPT
            bmi L3043
            lda ENDPT
            cmp #$03
            beq L3028
            cmp #$07
            beq L303B
L3022:      jsr PlotFire1
            jmp L3043
			
L3028:      ldx Fire1X
            cpx #$1C
            bcs L3022
            lda #$06
            jsr PlotFire1
            inc Fire1X
            lda #$02
            sta ENDPT
            bne L3022
L303B:      lda #$F0
            sta ENDPT
            lda #$1B
            sta Fire1X
L3043:      lda Map5Lamps+8*4
            beq L3077
            inc ENDPT+1
            bmi L3077
            lda ENDPT+1
            cmp #$03
            beq L305C
            cmp #$07
            beq L306F
L3056:      jsr PlotFire2
            jmp L3077
			
L305C:      ldx Fire2X
            cpx #$1C
            bcs L3056
            lda #$06
            jsr PlotFire2
            inc Fire2X
            lda #$02
            sta ENDPT+1
            bne L3056
L306F:      lda #$F0
            sta ENDPT+1
            lda #$1B
            sta Fire2X
L3077:      inc DELTAR
            bmi L30A6
            lda DELTAR
            cmp #$03
            beq L308B
            cmp #$07
            beq L309E
L3085:      jsr PlotFire3_7
            jmp L30A6
			
L308B:      ldx Fire3X
            cpx #$02
            bcs L3085
            lda #$06
            jsr PlotFire3_7
            inc Fire3X
            lda #$02
            sta DELTAR
            bne L3085
L309E:      lda #$F2
            sta DELTAR
            lda #$01
            sta Fire3X
L30A6:      jmp UpdateVines
