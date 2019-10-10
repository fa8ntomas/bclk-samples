        ; Map 04 Init
        ; You need to replace these zp vars for more sense

        lda #$1F
        sta MapVar4
        lda #$01
        sta BITMSK				; Fire 1 X
        lda #$0B
        sta ROWAC+1				; Fire 1 Y
        lda #$0B
        sta SHFAMT				; Fire 2 X
        lda #$07
        sta COLAC				; Fire 2 Y
        sta COLAC+1				; Fire 3 Y
        lda #$1A
        sta ROWAC				; Fire 3 X
        lda #$FF
        sta ENDPT				; Fire stuff
        sta ENDPT+1				; Fire
        lda #$F4
        sta DELTAR
        rts