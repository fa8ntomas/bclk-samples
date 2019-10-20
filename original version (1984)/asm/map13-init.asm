			; Map 13
			; The one with all the rats!!
			; All these $100+ are rat vars

Map13Init:  ldx #$04
L2BF7:      lda #$02
            sta L0100,X
            lda #$82
            sta L0105,X
            dex
            bpl L2BF7
            lda #$00
            sta L0109
            sta L0103
            lda #$06
            sta L0129
            sta L010F
            sta L0123
            sta L012D
            sta L012E
            lda #$02
            sta L010C
            sta L0120
            sta L012A
            sta L012C
            ldx FTYPE
            bne L2C31
            lda #$06
L2C31:      sta L0111
            sta L0125
            sta L012F
            lda #$12
            ldx FTYPE
            bne L2C42
            lda #$14
L2C42:      sta L0128
            sta L0139
            lda #$15
            ldx FTYPE
            bne L2C50
            lda #$13
L2C50:      sta L010B
            sta L011F
            sta L0133
            lda #$16
            sta L0110
            sta L0124
            sta L010E
            sta L0122
            ldx FTYPE
            bne L2C6D
            lda #$14
L2C6D:      sta L0112
            sta L0126
            sta L0130
            lda #$21
            sta L010A
            sta L011E
            sta L0132
            ldx FTYPE
            beq L2C87
            lda #$25
L2C87:      sta L0134
            sta L0136
            lda #$26
            ldx FTYPE
            bne L2C95
            lda #$22
L2C95:      sta L0137
            sta L0138
            sta L013A
            lda #$05
            sta L0119
            sta L011A
            lda #$07
            sta L0114
            sta L011B
            lda #$0A
            sta L0115
            sta L011C
            lda #$0C
            sta L0116
            sta L0118
            rts
