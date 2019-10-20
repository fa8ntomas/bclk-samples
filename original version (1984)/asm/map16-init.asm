			
			; Map 16 init
			; got an extra life here
            
            ldx CurrentPlayer
            lda MaxExtraLives1,X
            bne @+

            jsr L27D6

@           rts
