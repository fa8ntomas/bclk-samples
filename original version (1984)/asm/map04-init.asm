        ; Map 04 Init
        ; You need to replace these zp vars for more sense

        lda #$1F
        sta MapVar4
        lda #$01
        sta Fire1X				; Fire 1 X
        lda #$0B
        sta Fire1Y				; Fire 1 Y
        lda #$0B
        sta Fire2X				; Fire 2 X
        lda #$07
        sta Fire2Y				; Fire 2 Y
        sta Fire3Y				; Fire 3 Y
        lda #$1A
        sta Fire3X				; Fire 3 X
        lda #$FF
        sta ENDPT				; Fire stuff
        sta ENDPT+1				; Fire
        lda #$F4
        sta DELTAR
        rts