			; Map 12 exec
            
Map12Exec:  lda MapVar1
            bmi L3550
            lda Map12Lamps+2*4
            bne L3550
            dec MapVar1
            lda #$0A
            ldy #$26
            jsr EntranceL31D4
L3550:      lda MapVar2
            bmi L3569
            lda PlayerMap12LampsCount
            ora Map14Lamps+2*4
            ora Map14Lamps+3*4
            bne L3569
            dec MapVar2
            lda #$07
            ldy #$26
            jsr EntranceL31D4
L3569:      jmp UpdateTrees
