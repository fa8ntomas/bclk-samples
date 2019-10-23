			; Map 05 Init
			; Fire stuff here too
            
Map5Init:   lda #$1B
            sta Fire1X
            sta Fire2X
            lda #$01
            sta Fire3X
            lda #$09
            sta Fire1Y
            lda #$0A
            sta Fire2Y
            lda #$05
            sta Fire3Y
            lda #$FF
            sta ENDPT
            lda #$FC
            sta ENDPT+1
            lda #$F8
            sta DELTAR
            rts
			