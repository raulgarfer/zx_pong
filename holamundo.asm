org $8000




    ld a,$0e
    ld hl,ATTR_T
    ld (hl),a
    ld hl,ATTR_S
    ld (hl),a

    ld a,$01
    out ($fe),a
    
    call CLS

    ld b,$18-$0a
    ld c,$21-$02
    call LOCATE

    ld hl,msg

bucle:
    ld a,(hl)
    or a
    jr z,fin
    rst $10
    inc hl
    jr bucle

fin:
    jr fin
msg:    defm 'Hola mundo',$00
ATTR_S: equ $5c8d
ATTR_T: equ $5c8f
LOCATE: equ $0dd9
CLS:    equ $0daf
end $8000
