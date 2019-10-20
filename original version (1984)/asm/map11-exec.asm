			; Map 11 exec

Map11Exec:  lda MapVar1
            bmi L33F8
            lda Map11Lamps+2*4
            bne L33F8
            dec MapVar1
			
            lda #VINE_UP  ;=0
            sta VineDir
            
			lda #$07
            sta VineSpeed
			
L33F8:      jsr UpdateTrees

            jmp UpdateVines
