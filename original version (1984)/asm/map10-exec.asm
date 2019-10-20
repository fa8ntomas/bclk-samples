			; Map 10 exec

Map10Exec:  lda MapVar1
            bmi L33DF
            lda Map10Lamps+0*4
            ora Map10Lamps+1*4
            bne L33DF
            dec MapVar1
            lda #$04
            ldy #$26
            jsr EntranceL31D4
L33DF:      jmp UpdateTrees
