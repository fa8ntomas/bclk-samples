PlotFire1:      clc
            adc #$1F
            ldx Fire1Y
            ldy Fire1X
            jmp PlotChars			;Animates playfield things that scroll across screen
            
PlotFire2:      clc
            adc #$1F
            ldx Fire2Y
            ldy Fire2X
            jmp PlotChars			;Animates playfield things that scroll across screen
            
PlotFire3:      clc
            adc #$1F
            ldx Fire3Y
            ldy Fire3X
            jmp PlotChars			;Animates playfield things that scroll across screen
            
PlotFireL378C:      clc
            adc #$07
            jmp PlotFire1
            
            bne PlotFire1
PlotFireL3794:      clc
            adc #$07
            jmp PlotFire2
            
            bne PlotFire2
PlotFire3_7:      clc
            adc #$07
            jmp PlotFire3
            
            bne PlotFire3

Entrance31aa:      jsr PlaySfxEntrance
            sta SAVADR+1
            sty RAMTOP
            lda #$13
            jsr PlotL31EA

            lda #$13
            jsr PlotL31EA
            lda #$14
            jmp PlotL31EA
PlotL31C0:      jsr Entrance31aa
            dec SAVADR+1
            lda #$17
            jmp PlotL31EA
PlotL31CA:      jsr Entrance31aa
            dec SAVADR+1
            lda #$2D
            jmp PlotL31EA
EntranceL31D4:      jsr PlaySfxEntrance
            sta SAVADR+1
            sty RAMTOP
            lda #$63
            jsr PlotL31EA
            lda #$63
            jsr PlotL31EA
            lda #$64
            jmp PlotL31EA
            
PlotL31EA:      ldx SAVADR+1
            ldy RAMTOP
            jsr PlotChars
            inc SAVADR+1
            rts

;Updates screen 7 and 9 moving thing at bottom              
UpdateRat1:      jsr PlaySfxRat		;Play moving thing sound
            lda #$1C
            ldx BUFSTR
            ldy BUFSTR+1
            jsr PlotChars			;draws moving thing at bottom of screen 7 and 9
            lda #$1B
            ldx BUFSTR
            ldy BUFCNT
            jmp PlotChars			;draws moving thing at bottom of screen 7 and 9
			
UpdateRat2:      jsr PlaySfxRat		;Play moving thing sound
            lda #$55
            ldx BUFSTR
            ldy BUFSTR+1
            jsr PlotChars
            lda #$54
            ldx BUFSTR
            ldy BUFCNT
            jmp PlotChars
			
PlaySfxRat: 
			ldy #$0B				;Moving thing sound
            jmp PlaySfx				;Store in memory

UpdateVines:      lda OLDCOL
            bmi L247B
            dec OLDCOL
            beq L2494
            rts
            
L247B:      and #$7F
            sec
            sbc #$01
            beq L2487
            ora #$80
            sta OLDCOL
            rts
            
L2487:      ldx VineSpeed
            lda VineSpeedTable,X
            sta OLDCOL
            dec LOGCOL
            bmi L24B6
            rts
            
L2494:      lda #<L3992
            sta L007A
            lda #>L3992
            sta SWPFLG
			
            lda CurrentMap
            cmp #$0A
            bcc L24AA
			
			; other type of vines from 10-19
			
            lda #<L39AA
            sta L007A
            lda #>L39AA
            sta SWPFLG
			
L24AA:      ldx VineSpeed
            lda VineSpeedTable,X
            sta OLDCOL
            dec LOGCOL
            bpl L24D2
L24B6:      dec VineSpeed
            bpl L24C6
            ldx #$07
            stx VineSpeed

            lda VineDir
            eor #$01
            sta VineDir
			
L24C6:      ldx VineSpeed
            lda VineSpeedTable,X
            sta OLDCOL
            lda #$10
            sta LOGCOL
L24D2:      lda VineDir
            bne L24E0
            inc OLDADR+1
            lda OLDADR+1
            cmp #$08
            bcc L24EB
            bcs L24E7		; jumps into BIT instruction, effectively LDA #0
L24E0:      dec OLDADR+1
            bpl L24EB
            lda #$07
			
			; BIT trick for LDA #0
            ;bit $00A9 - Doesn't assemble correctly - Had to use line below
            .byte $2C
L24E7		.byte $A9,$00
            sta OLDADR+1
			
			; Update Actors positions when on vines
			; watch out for self-mod
			
L24EB:      ldx #$02
L24ED:      stx CurrentT
            
			txa
            asl
            asl
            asl
            
			clc
            adc L007A
            sta L251B+1
			
            lda SWPFLG
            adc #$00
            sta L251B+2
            txa
            clc
            adc #$61
            sta L3A2B
            jsr L12F9
            lda L3A2B
            sta TmpWord2
            lda L3A2A
            clc
            adc MapFont
            sta TmpWord2+1
            ldy #$00
            ldx OLDADR+1
L251B:      lda $E000,X
            sta (TmpWord2),Y
            iny
            inx
            cpx #$08
            bne L2528
            ldx #$00
L2528:      cpy #$08
            bne L251B
            ldx CurrentT
            dex
            bpl L24ED
            rts
 
TestColision 	cmp #TILE_FATAL_1
            beq L26F5
            
			cmp #TILE_FATAL_2
            beq FatalOnMap10			; Fatal if < Map 10
            
			cmp #TILE_FATAL_3
            beq L26F5
            
			cmp #TILE_FATAL_4
            beq L26F5
            
			cmp #TILE_FATAL_5
            beq L26D1
            
			cmp #$D4
            bcc L26DD_
			
            cmp #$DB
            bcc L26F5
			
L26D1:      cmp #$F1
            bcc L26D9
            
			cmp #$FD
            bcc L26F5
			
L26D9:      cmp #TILE_TREE	
            beq L26EB
			
L26DD_:      rts


L26EB:      jmp TriggerTree

FatalOnMap10:      
            lda CurrentMap
            cmp #10
            bcs L26F5
            rts
            
L26F5:      jmp HitFatal

FatalOnMap16:      
			lda CurrentMap
            cmp #16
            beq L26E5
            rts
            
L26E5:      jmp L27BD
