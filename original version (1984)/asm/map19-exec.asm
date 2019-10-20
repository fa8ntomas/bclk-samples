        ; Map 19 exec
        ; CONGRATULATIONS!
        
        lda Timer1
        ora Timer2
        bne L396A
        
        ; Wait timer finished, ready for next round
        
        inc FTYPE

        lda CurrentPlayer
        asl
        asl
        tax
        ldy #$03
        lda #$01
L3948   sta L013C,X
        inx
        dey
        bpl L3948
        
        jsr ResetLampsLeft
        
        jsr ResetLampsAll
        
        jsr ResetRoomsVisited
        
        ; Update DList
        lda #BLANK3
        sta DisplayList1+3
        sta DisplayList1+4
        lda #BLANK2
        sta DisplayList1+5
        
        ldx #$00
        jmp GetMapStartPos
        
        ; Flashing fires I guess
        
L396A   lda RANDOM
        sta DLCOLOR+7
        lda RANDOM
        sta DLCOLOR+9
        
        ; Update DList
        lda #LMS+MODE2
        sta DisplayList1+3
        lda #$A5
        sta DisplayList1+4
        lda #$78			
        sta DisplayList1+5	
                            ;Changes colors on last screen - $13
        lda #$04			;Gold room
        ldx #$00			;
        ldy #$0A			;
        jmp PlotChars		;---------------------------------------