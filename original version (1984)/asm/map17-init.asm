			; Map 17 init
			; Some fires

            lda #$01
            sta MapVar1
            sta MapVar2
            lda #$08
            sta Fire1X
            sta Fire2X
            sta Fire3X
            lda #$03
            sta Fire1Y
            lda #$05
            sta BUFSTR
            lda #$07
            sta Fire2Y
            lda #$09
            sta Fire3Y
            lda #$0B
            sta BUFCNT
            lda #$F8
            sta ENDPT
            lda #$F1
            sta ENDPT+1
            lda #$EA
            sta DELTAR
            rts
