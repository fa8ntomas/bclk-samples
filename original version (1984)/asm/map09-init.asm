			; Map 09 init
			; Ratfuckery here
			; and some fires
            
Map9Init:   lda #$04
            sta BUFCNT
            sta BUFSTR+1
            lda #$0C
            sta BUFSTR
            lda #$10
            sta BITMSK
            sta SHFAMT
            lda #$05
            sta ROWAC+1
            lda #$06
            sta COLAC
            lda #$FC
            sta ENDPT
            lda #$FF
            sta ENDPT+1
            rts
