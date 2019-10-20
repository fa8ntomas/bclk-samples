			; Map 18 exec
			; THE EMPEROR!
			
Map18Exec:  lda MapVar1
            bne L3406
            jmp UpdateEmperor
L3406:      lda Map18Lamps+0*4
            bne L3437
            sta MapVar1
            jsr L38FF
            lda #$61			;--------------------------
            ldx #$0B			;Animates dragon guy dying
            ldy #$00			;
            jsr PlotChars		;---------------------------
            lda #$B8
            ldx #$02
            jsr AddScoreX
            lda #$0B
            ldx #$01
            jsr AddScoreX
            ldx #$01
            lda #$00
            sta MapVar4
            lda #$50
            sta MapVar2
            jmp L3463
            
L3437:      jsr UpdateEmpSpit
            lda MLTTMP
            ora MLTTMP+1
            and #$03
            beq L344D
            ldx #$00
            lda ActState
            cmp #$19			; DEAD?
            beq L344D
            jsr SetDeadFrame
L344D:      dec MapVar2
            bne L3495
            lda #$08
            sta MapVar2
            lda ActX
            ldx #$02
L345B:      cmp L3E67,X
            bcs L3463
            dex
            bne L345B
			
L3463:      stx MapVar3
            lda #$38
            clc
            adc MapVar3
            ldx #$02
            ldy #$10
            jsr PlotChars			;Animates fireballs dragon/emporer shoots
            lda MapVar4
            bne L3488
            inc MapVar4
            lda #$06
            jsr PlotL3496
            lda #$06
            jsr PlotL34A3
            jmp L3495
            
L3488:      dec MapVar4
            lda #$00
            jsr PlotL3496
            lda #$00
            jsr PlotL34A3
L3495:      rts

PlotL3496:      clc
            adc #$3B
            adc MapVar3
            ldx #$03
            ldy #$12
            jmp PlotChars			;Animates fireballs dragon/emporer shoots
            
PlotL34A3:      clc
            adc #$3E
            adc MapVar3
            ldx #$04
            ldy #$12
            jmp PlotChars			;Animates fireballs dragon/emporer shoots
            
PlotL34B0:      lda #$00
            sta AUDC1
            sta AUDF1
            lda #$5E
            ldx #$0B
            ldy #$25
            jsr PlotChars			;Erases dragon guy from screen after he dies
            
            lda #$5F
            ldx #$0C
            ldy #$26
            jmp PlotChars			;Erases dragon guy from screen after he dies
            
UpdateEmperor:
			lda MapVar2
            beq PlotL34B0
            tax
            lda RANDOM
            and #$0F
            ora #$80
            sta AUDC1
            lda RANDOM
            sta AUDF1
            sta DLCOLOR+1
            cpx #$10
            bcs L34EA
            
			stx DLCOLOR+1
			
L34EA:      dec MapVar2
            
			lda #>Font3
            sta MapFont
            
			cpx #$11
            bcc L3500
			
            lda RANDOM
            cmp #$10
            bcs L3500
			
            lda #>Font2
            sta MapFont
			
L3500:      lda MapVar4
            eor #$01
            sta MapVar4
            
			lda #$47
            clc
            adc MapVar4
            ldx #$03
            ldy #$0C
            jsr PlotChars			;Animates dragon guy dying
            
			lda #$49
            clc
            adc MapVar4
            ldx #$03
            ldy #$19
            jsr PlotChars			;Animates dragon guy dying
            
			lda #$4B
            clc
            adc MapVar4
            ldx #$06
            ldy #$0E
            jsr PlotChars			;Animates dragon guy dying
            lda #$4D
            clc
            adc MapVar4
            ldx #$06
            ldy #$17
            jmp PlotChars			;Animates dragon guy dying

			; Afaic the emperor spits!

UpdateEmpSpit:
			ldx #$03
L37FF:      lda RANDOM
            and L39C3,X
            sta L39C7,X
            lda RANDOM
            and L39C3,X
            sta L39CB,X
            dex
            bpl L37FF
            jsr L38FF
            lda L39CF
            bne L382A
            lda L39D1
            bne L3827
            jsr L38DB
            jmp L383D
            
L3827:      dec L39D1
L382A:      lda L39D0
            bne L383D
            lda L39D2
            bne L383A
            jsr L38ED
            jmp L383D
            
L383A:      dec L39D2
L383D:      ldx #$01
L383F:      lda L39CF,X
            beq L385B
            lda L39D5,X
            clc
            adc #$03
            sta L39D5,X
            cmp #$E0
            bcc L385B
            lda #$00
            sta L39CF,X
            lda #$02
            sta L39D1,X
L385B:      dex
            bpl L383F
            lda L39CF
            beq L3881
            lda #$C7
            sta L1F72+1
            lda #$39
            sta L1F72+2
            lda L39D5
            sta L1F75+1
            lda L39D7
            clc
            adc #$78
            sta L1F75+2
            ldy #$03
            jsr L1F72			;Draws
L3881:      lda L39D0
            beq L38A4
            lda #$CB
            sta L1F72+1
            lda #$39
            sta L1F72+2
            lda L39D6
            sta L1F75+1
            lda L39D8
            clc
            adc #$78
            sta L1F75+2
            ldy #$03
            jsr L1F72			;Draws
L38A4:      ldx #$01
L38A6:      lda L39CF,X
            beq L38D7
            ldy #$00
            lda L39D5,X
            cmp #$98
            bcs L38B5
            iny
L38B5:      lda L39D3,X
            cmp ActX
            bcs L38C1
            inc L39D3,X
            bne L38C6
L38C1:      beq L38C6
            dec L39D3,X
L38C6:      dey
            bpl L38B5
            lda L39D3,X
            sta HPOSP2,X
            lda RANDOM
            ora #$0A
            sta COLPM2,X
L38D7:      dex
            bpl L38A6
            rts
            
L38DB:      lda #$01
            sta L39CF
            lda #$77
            sta L39D3
            lda #$3C
            sta L39D5
            jmp PlaySfxHit
            
L38ED:      lda #$01
            sta L39D0
            lda #$81
            sta L39D4
            lda #$3C
            sta L39D6
            jmp PlaySfxHit
            
L38FF:      ldx #$01
L3901:      lda L39CF,X
            beq L391A
            lda L39D5,X
            sta L1F7E+1
            lda L39D7,X
            clc
            adc #$78
            sta L1F7E+2
            ldy #$03
            jsr L1F7C
L391A:      dex
            bpl L3901
            rts
