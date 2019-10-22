			; Map 08 Init
			; Fires
			
Map8Init:   lda #$06
            sta Fire1X

            lda #$1B
            sta Fire2X
            
            lda #$05
            sta Fire1Y
            sta Fire2Y
            
            lda #$FF
            sta ENDPT
            
            lda #$F2
            sta ENDPT+1
            
            rts
