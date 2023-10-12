org $8000
   ld hl,msg
   bucle:
    ld a,(hl)
    or a
        jr z,fin
    rst $10
    inc hl
    jr bucle
fin:
ret
    msg: defm 'Hola mundo',$00
end $8000
