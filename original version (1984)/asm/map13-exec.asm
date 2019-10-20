			; Map 13 exec
			; All the rats!

Map13Exec:  lda CurrentPlayer
            asl
            asl
            tax
            lda ActY
            cmp #$64
            bcc L35AC
            cmp #$8A
            bcs L3586
            lda L013C,X
            beq L35AC
            dec L013C,X
            jmp L359F
            
L3586:      inx
            cmp #$B6
            bcs L3596
            lda L013C,X
            beq L35AC
            dec L013C,X
            jmp L359F
            
L3596:      inx
            lda L013C,X
            beq L35AC
            dec L013C,X
L359F:      lda #$01
            tax
            jsr AddScoreX
            lda #$F4
            ldx #$02
            jmp AddScoreX
            
L35AC:      lda MapSomething
            bne L35B3
            jsr UpdateMap13Rats
L35B3:      rts

UpdateMap13Rats:      ldx #$08
L0C4A:      lda L0100,X
            beq L0CAE
            txa
            pha
            lda L010A,X
            sta L011E,X
            sta BUFSTR+1
            lda L0114,X
            sta BUFSTR
            lda L0100,X
            bmi L0C8C
            dec L010A,X
            lda L010A,X
            cmp L0128,X
            bcs L0C74
            lda L0132,X
            sta L010A,X
L0C74:      sta BUFCNT
            lda BUFSTR
            cmp #$05
            beq L0C86
            cmp #$0A
            beq L0C86
            jsr UpdateRat1
            jmp L0CAC
L0C86:      jsr UpdateRat2
            jmp L0CAC
L0C8C:      inc L010A,X
            lda L010A,X
            cmp L0132,X
            bcc L0C9D
            lda L0128,X
            sta L010A,X
L0C9D:      sta BUFCNT
            lda BUFSTR
            cmp #$05
            beq L0C86
            cmp #$0A
            beq L0C86
            jsr UpdateRat1
L0CAC:      pla
            tax
L0CAE:      dex
            bpl L0C4A
            rts
