			; Map 09 init
			; Ratfuckery here
			; and some fires
            
Map9Init:   lda #$04
            sta BUFCNT
            sta BUFSTR+1
            lda #$0C
            sta BUFSTR
            lda #$10
            sta Fire1X
            sta Fire2X
            lda #$05
            sta Fire1Y
            lda #$06
            sta Fire2Y
            lda #$FC
            sta ENDPT
            lda #$FF
            sta ENDPT+1
            rts
