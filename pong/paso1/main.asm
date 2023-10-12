org $8000
    ld hl,$4000
    ld b,$c0
loop:
    ld (hl),$3c
    call nextscan
    ;;halt  ;;quitar para ver como se pinta lentamente
    djnz loop
ret
include "video.asm"
end $8000
