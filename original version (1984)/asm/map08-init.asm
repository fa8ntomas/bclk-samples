			; Map 08 Init
			; Fires
			
Map8Init:   lda #$06
            sta BITMSK
            lda #$1B
            sta SHFAMT
            lda #$05
            sta ROWAC+1
            sta COLAC
            lda #$FF
            sta ENDPT
            lda #$F2
            sta ENDPT+1
            rts
