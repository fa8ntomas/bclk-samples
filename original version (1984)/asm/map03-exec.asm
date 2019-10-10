		; Map 03 exec
		; The switching bridges

		lda MapSomething
		bne L2E17
		
		lda MapVar1
		bmi L2E17
		
		lda PlayerMap3LampsCounts
		bne L2E17
		
		dec MapVar1
		lda MapVar1
		cmp #$02
		bne @+
		
		jsr PlaySfxEntrance	;Play open floorsound screen 3
		
@		clc
		adc #$10
		ldx #$0C
		ldy #$1D
		jsr PlotChars		;Open floor location on screen 3
		
L2E17	dec MapVar3
		bmi bridge1
		rts
		
		; bridge 1

bridge1	lda #$30
		sta MapVar3
		lda MapVar2
		beq bridge2
		dec MapVar2
		lda #$06
		ldx #$06
		ldy #$09
		jsr PlotChars		;Erase and draw left moving platform
		lda #$60
		ldx #$06
		ldy #$15
		jmp PlotChars		;Erase and draw left moving platform

		; bridge 2

bridge2	inc MapVar2		
		lda #$60
		ldx #$06
		ldy #$09
		jsr PlotChars		;Erase and draw right moving platform
		lda #$06
		ldx #$06
		ldy #$15
		jmp PlotChars		;Erase and draw right moving platform
