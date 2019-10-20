			; Map 16 exec

Map16Exec:  lda MapVar1
            bmi @+
            lda PlayerMap16LampsCount
            bne @+

            dec MapVar1

            lda #$07
            ldy #$01
            jsr EntranceL31D4

@           jmp UpdateTrees

