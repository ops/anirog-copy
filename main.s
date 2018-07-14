;;; anirog-copy for VIC-20
;;;
;;; July 2018 by ops

        .setcpu "6502"

        .segment "LOADADDR"
        .export  __LOADADDR__: absolute = 1
        .addr *+2

        .segment "CODE"
        .import anirog_load

        .include "cbm_kernal.inc"

        jsr     anirog_load
        lda     #$01
        ldx     $BA             ; current device number
        ldy     #$01
        jsr     SETLFS
        lda     #(data_end - data)
        ldx     #<data
        ldy     #>data
        jsr     SETNAM
        lda     #$2B
        ldx     $2D
        ldy     $2E
        jmp     SAVE

data:   .byte "data.prg"
data_end:
