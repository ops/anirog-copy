;;; anirog turboloader
;;; disassembled from Tom Thumb
;;; July 2018 by ops

        .setcpu "6502"
        .segment "CODE"

        .export anirog_load

anirog_load:
L0351:  jsr     L03AF
        cmp     #$00
        beq     L0351
        sta     $AB
        jsr     L03D8
        sta     $C1
        sta     $2B             ; Save SA low byte
        jsr     L03D8
        sta     $C2
        sta     $2C             ; Save SA high byte
        jsr     L03D8
        sta     $2D
        jsr     L03D8
        sta     $2E

L036E:  jsr     L03D8
        sta     ($C1),y
        inc     $C1
        bne     L0379
        inc     $C2
L0379:  lda     $C1
        cmp     $2D
        lda     $C2
        sbc     $2E
        bcc     L036E
        rts

L03A3:  ldy     #$00
        sty     $C0
L03A7:  dex
        bne     L03A7
        dey
        bne     L03A7
        sei
        rts

L03AF:  jsr     L03A3
        lda     #$27
        sta     $9128
        ldx     #$01
L03B9:  jsr     L03E8
        rol     $BD
        lda     $BD
        cmp     #$02
        bne     L03B9
        ldy     #$09
L03C6:  jsr     L03D8
        cmp     #$02
        beq     L03C6
L03CD:  cpy     $BD
        bne     L03B9
        jsr     L03D8
        dey
        bne     L03CD
        rts

L03D8:  lda     #$08
        sta     $A3
L03DC:  jsr     L03E8
        rol     $BD
        dec     $A3
        bne     L03DC
        lda     $BD
        rts

L03E8:  lda     #$02
L03EA:  bit     $912D
        beq     L03EA
        lda     $912D
        stx     $9129
        bit     $9121
        asl     a
        asl     a
        asl     a
        rts
