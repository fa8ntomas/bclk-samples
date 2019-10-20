			; Map 17 exec

Map17Exec:  dec MapVar4
            beq L3676
            bpl L3665
            lda #$01
            sta MapVar4
L3665:      lda BUFCNT
            sta BUFSTR+1
            inc BUFCNT
            cmp #$1B
            bcc L3673
            lda #$0B
            sta BUFCNT
L3673:      jsr UpdateRat1
L3676:      lda MapVar1
            beq L368C
            lda Map17Lamps+0*4
            bne L368C
            dec MapVar1
            lda #$5D
            ldx #$0A
            ldy #$25
            jsr PlotChars			;Adds ladder part to screen $11
L368C:      lda MapVar2
            beq L36A2
            lda Map17Lamps+1*4
            bne L36A2
            dec MapVar2
            lda #$5C
            ldx #$0A
            ldy #$18
            jsr PlotChars			;Adds ladder part to screen $11
L36A2:      jsr UpdateTrees
            lda MapSomething
            beq L36AA
            rts
            
L36AA:      dec MapVar3
            bpl L36C0
            lda #$04
            sta MapVar3
            lda #$2C
            cmp DLCOLOR+2
            bne L36BD
            lda #$2A
L36BD:      sta DLCOLOR+2
L36C0:      lda #$02
            sta Tmp1
L36C4:      ldx Tmp1
            inc ENDPT,X
            bmi L3731
            lda ENDPT,X
            cmp #$03
            beq L36EE
            cmp #$07
            beq L3721
L36D4:      cpx #$00
            bne L36DE
            jsr PlotFire1
            jmp L3731
            
L36DE:      cpx #$01
            bne L36E8
            jsr PlotFire2
            jmp L3731
            
L36E8:      jsr L3782
            jmp L3731
            
L36EE:      ldy BITMSK,X
            cpx #$00
            bne L36FA
            cpy #$23
            bcs L36D4
            bcc L36FE
L36FA:      cpy #$25
            bcs L36D4
L36FE:      lda #$06
            cpx #$00
            bne L370A
            jsr PlotFire1
            jmp L3717
			
L370A:      cpx #$01
            bne L3714
            jsr PlotFire2
            jmp L3717
            
L3714:      jsr L3782
L3717:      ldx Tmp1
            inc BITMSK,X
            lda #$02
            sta ENDPT,X
            bne L36D4
L3721:      lda #$EA
            sta ENDPT,X
            lda #$08
            sta BITMSK,X
            cpx #$00
            bne L3731
            lda #$E8
            sta ENDPT,X
L3731:      dec Tmp1
            bpl L36C4
            rts
