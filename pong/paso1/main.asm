org $8000
    ld hl,$4000         ;;HL= scanline 9,lindea 0,tercio 0 columna 0
    ld b,$c0            ;;B=192, scanlines que tiene la pantalla
loop:
    ld (hl),$3c         ;;pinta en la pantalla 001111000
    call nextscan
    ;;halt  ;;quitar para ver como se pinta lentamente
    djnz loop
    
    ld hl,$57ff
    ld b,$c0 

loop_up:
    ld (hl),$3c
    call previous_scan
    ;;halt
    djnz loop_up
ret
include "video.asm"
end $8000
