			; Map 17 init
			; Some fires

            lda #$01
            sta MapVar1
            sta MapVar2
            lda #$08
            sta BITMSK
            sta SHFAMT
            sta ROWAC
            lda #$03
            sta ROWAC+1
            lda #$05
            sta BUFSTR
            lda #$07
            sta COLAC
            lda #$09
            sta COLAC+1
            lda #$0B
            sta BUFCNT
            lda #$F8
            sta ENDPT
            lda #$F1
            sta ENDPT+1
            lda #$EA
            sta DELTAR
            rts
