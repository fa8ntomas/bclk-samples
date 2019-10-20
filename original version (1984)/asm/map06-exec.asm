			; Map 06 exec
									
Map6Exec:   lda CastleOpenFlag	
			bne L30D9
			
            lda MapVar1
            bmi L30D9
 
			dec MapVar1
			
            lda #$05
            ldy #$01
            jsr PlotL31C0
			
L30D9:      jsr UpdateTrees
  
			jmp UpdateVines
