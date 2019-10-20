			; Map 14 exec

Map14Exec:  lda MapVar1
            bmi L35CB
            lda Map14Lamps+0*4
            ora Map14Lamps+1*4
            bne L35CB
            dec MapVar1
            lda #$04
            ldy #$26
            jsr EntranceL31D4
L35CB:      jmp UpdateTrees