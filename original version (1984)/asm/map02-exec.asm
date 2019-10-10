        lda CastleOpenFlag	;This copies Blank spaces to wall section
        bne return
		
        lda MapVar2			;Load location
        bmi @+				;If already set skip next section
		
        dec MapVar2			;Set to negative for all subsequent passes
        jsr PlaySfxEntrance
        lda #$1A
        ldx #$0B
        ldy #$25
        jsr PlotChars		;This copies Blank spaces to wall section
        lda #$07
        ldx #$0C
        ldy #$25
        jsr PlotChars		;This copies Blank spaces to wall section
		
@	  	lda MapSomething
        bne return
		
        dec MapVar3
        bpl return
        lda MapVar1
        bne @+
		
        ldy #$0A
        jsr PlaySfx			;Play cow moo sound for screen 
        lda #$1D
        ldx #$09
        ldy #$21
        jsr PlotChars		;Animate cow screen 2
        inc MapVar1
        bne return
		
@		lda #$1E
        ldx #$09
        ldy #$21
        jsr PlotChars		;Animate cow screen 2	
        dec MapVar1
        lda #$05
        sta MapVar3
		
return	rts
