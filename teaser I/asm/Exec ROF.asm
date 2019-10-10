; Map 'New Map 0' Exec

            .local

            ldx #$0C
            ldy #0
            jsr GetLinePtrs  ;

            ldx #9
loopWater
            dec waterTimers,X
            beq resetWaterTimers

loopWater2  dex
            bpl loopWater
            bmi XXXXX

resetWaterTimers:
            ldy waterBytes,X
            iny
            cpy #$17      
            bne @+

            ldy #$15

@           tya
            sta waterBytes,X

            stx dd+1
dd          ldy #$FF
            sta (TmpWord1),Y

            lda #$9
            sta waterTimers,X
            bne loopWater2

waterBytes   .byte $16,$15,$16,$16,$15,$16, $15,$15,$16,$16
waterTimers  .byte $1, $4, $3,$1, $2, $5, $3,$3,$6,$1

XXXXX
        
            ldx #0
loop:
            inc eyesTimers,X
            
            lda eyesFlags,X
            beq notset

            lda eyesTimers,X
            cmp eyesCountOff,X
            beq Ok
            
until:      inx
            cpx #(eyesTimers-eyesFlags)
            bne loop
            
            rts

notset      lda eyesTimers,X
            cmp eyesCountOn,X
            beq Ok
            bne until

Ok:         lda #0
            sta eyesTimers,X

            lda eyesRows,X
            sta row

            lda eyesFlags,X
            bne Unset
    
            mwa #Txt0 TmpWord2

            lda #1
            sta eyesFlags,X
            bne Print
           
 Unset:     lda #0
            sta eyesFlags,X
            
            mwa #Txt1 TmpWord2

 Print:     ldy eyesCols,X
            stx savX
            ldx row
            jsr NewPlotChars
          
  
            ldx savX
            bpl until

;           flag    Col  Row
eyesFlags   .byte 0,   0,0,0,0,0
eyesTimers  .byte $5,0,$10,$5,0,$30
eyesCols:    .byte  $14, $B,$11,$1d,$13,$17
eyesRows:    .byte $2,$3,$3,$4,$5,$6
eyesCountOn  .byte $60,$80,$45,$70,$90,$A0
eyesCountOff  .byte $3,$4,$2,$5,$2,$10;

savX:         .byte 0
row:        .byte 0


Txt0:
	.byte $B3,$86
Txt1:
	.byte $C4,$86

            .endl