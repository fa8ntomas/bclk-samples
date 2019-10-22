			; Map 04 exec
			; lots going on here
			
        lda Map4Lamps			; check if lamp 1 taken
            beq L2E7E
            inc MapVar3
            lda MapVar3
            cmp #$20
            bne L2E6C
            lda #$34
            ldx #$04
            ldy #$0B
            jsr PlotChars		;Animate lamps?
            jmp L2E7E
			
L2E6C:      cmp #$40
            bne L2E7E
            lda #$00
            sta MapVar3
            lda #$36
            ldx #$04
            ldy #$0B
            jsr PlotChars		;Animate lamps?
			
L2E7E:      lda Map4Lamps+0*4		; is lamp 1 taken
            bne L2EA5
            lda MapVar1
            bmi L2EA5
            dec MapVar1
            jsr PlaySfxEntrance
            lda #$16
            ldx #$08
            ldy #$0B
            jsr PlotChars		;Opens left floor on screen 4
            lda #$16
            ldx #$09
            ldy #$0B
            jsr PlotChars		;Opens left floor on screen 4
            lda #$06
            jsr PlotFire2
			
L2EA5:      lda Map4Lamps+1*4				; lamp 2
            beq L2ED2
            inc MapVar4
            lda MapVar4
            cmp #$20
            bne L2EC0
            lda #$35
            ldx #$04
            ldy #$1C
            jsr PlotChars		;Animate Lamps?
            jmp L2ED2
L2EC0:      cmp #$40
            bne L2ED2
            lda #$00
            sta MapVar4
            lda #$37
            ldx #$04
            ldy #$1C
            jsr PlotChars		;Animate Lamps?
L2ED2:      lda Map4Lamps+1*4     ; lamp 2
            bne L2F02
            lda MapVar2
            bmi L2F02
            dec MapVar2
			
            lda #VINE_UP; =0
            sta VineDir
			
            lda #$07
            sta VineSpeed
            jsr PlaySfxEntrance
            lda #$16
            ldx #$08
            ldy #$19
            jsr PlotChars		;Opens right floor on screen 4
            lda #$16
            ldx #$09
            ldy #$19
            jsr PlotChars		;Opens right floor on screen 4
            lda #$06
            jsr PlotFire3
L2F02:      lda MapSomething
            beq L2F09
            jmp L2FA0
			
L2F09:      inc ENDPT
            bmi L2F38
            lda ENDPT
            cmp #$03
            beq L2F1D
            cmp #$07
            beq L2F30
L2F17:      jsr PlotFireL378C
            jmp L2F38
			
L2F1D:      ldx Fire1X
            cpx #$03
            bcs L2F17
            lda #$06
            jsr PlotFireL378C
            inc Fire1X
            lda #$02
            sta ENDPT
            bne L2F17
L2F30:      lda #$C0
            sta ENDPT
            lda #$01
            sta Fire1X
L2F38:      lda Map4Lamps
            beq L2F6C
            inc ENDPT+1
            bmi L2F6C
            lda ENDPT+1
            cmp #$03
            beq L2F51
            cmp #$07
            beq L2F64
L2F4B:      jsr PlotFire2
            jmp L2F6C
			
L2F51:      ldx Fire2X
            cpx #$0C
            bcs L2F4B
            lda #$06
            jsr PlotFire2
            inc Fire2X
            lda #$02
            sta ENDPT+1
            bne L2F4B
L2F64:      lda #$F4
            sta ENDPT+1
            lda #$0B
            sta Fire2X
L2F6C:      lda Map4Lamps+4
            beq L2FA0
            inc DELTAR
            bmi L2FA0
            lda DELTAR
            cmp #$03
            beq L2F85
            cmp #$07
            beq L2F98
L2F7F:      jsr PlotFire3
            jmp L2FA0
			
L2F85:      ldx Fire3X
            cpx #$1B
            bcs L2F7F
            lda #$06
            jsr PlotFire3
            inc Fire3X
            lda #$02
            sta DELTAR
            bne L2F7F
L2F98:      lda #$F4
            sta DELTAR
            lda #$1A
            sta Fire3X
			
L2FA0:      jmp UpdateVines
