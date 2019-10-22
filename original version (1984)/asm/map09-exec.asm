			; Map 09 exec

Map9Exec:   lda MapVar3
            bmi L32ED

            lda Map9Lamps+0*4
            bne L32ED

            dec MapVar3

            lda #VINE_DN  ;=1
            sta VineDir

            lda #$07
            sta VineSpeed

L32ED:      lda Map9Lamps+1*4
            bne L330A

            lda MapVar1
            bmi L330A

            dec MapVar1

            lda #$07
            ldy #$17
            jsr Entrance31aa

            lda #VINE_UP  ;=0
            sta VineDir

            lda #$07
            sta VineSpeed
			
L330A:      lda PlayerMap9LampsCount
            bne L332B
            lda MapVar2
            bmi L332B
            dec MapVar2
			
            lda #VINE_UP 
            sta VineDir
            
			lda #$07
            sta VineSpeed
			
            jsr PlaySfxEntrance
            lda #$18		;----------------------------------
            ldx #$02		;Removes spikes at the top of the
            ldy #$23		;Moving vines on screen 9
            jsr PlotChars	;----------------------------------
L332B:      dec MapVar4
            beq L3360
            bpl L3337
            lda #$01
            sta MapVar4
L3337:      lda Map9Lamps+2*4
            ora Map9Lamps+3*4
            bne L334F
            lda BUFCNT
            sta BUFSTR+1
            dec BUFCNT
            cmp #$05
            bcs L335D
            lda #$18
            sta BUFCNT
            bne L335D
L334F:      lda BUFCNT
            sta BUFSTR+1
            inc BUFCNT
            cmp #$18
            bcc L335D
            lda #$04
            sta BUFCNT
L335D:      jsr UpdateRat1
L3360:      lda MapSomething
            beq L3367
            jmp L33C5
            
L3367:      inc ENDPT
            bmi L3396
            lda ENDPT
            cmp #$03
            beq L337B
            cmp #$07
            beq L338E
L3375:      jsr PlotFireL378C
            jmp L3396
            
L337B:      ldx Fire1X
            cpx #$14
            bcs L3375
            lda #$06
            jsr PlotFireL378C
            inc Fire1X
            lda #$02
            sta ENDPT
            bne L3375
L338E:      lda #$10
            sta Fire1X
            lda #$D0
            sta ENDPT
L3396:      inc ENDPT+1
            bmi L33C5
            lda ENDPT+1
            cmp #$03
            beq L33AA
            cmp #$07
            beq L33BD
L33A4:      jsr PlotFireL3794
            jmp L33C5
            
L33AA:      ldx Fire2X
            cpx #$14
            bcs L33A4
            lda #$06
            jsr PlotFireL3794
            inc Fire2X
            lda #$02
            sta ENDPT+1
            bne L33A4
L33BD:      lda #$10
            sta Fire2X
            lda #$D0
            sta ENDPT+1
L33C5:      jmp UpdateVines
