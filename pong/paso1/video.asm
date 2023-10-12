;;WWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWW
;;nextscan
;;obtiene la posicion de memoria correspondiente al scanline
;;siguiente al inducado.
;;010T TSSS LLLC CCCC
;;entrasa: HL como scanline actual
;;salida: HL como scanline siguiente
;;altera AF,HL
;;MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM

nextscan:
    inc h       ;;incrementa H para incrementar el scanline
    ld a,H      ;;carga el valor en A
    and $07     ;;se queda con los bits del scanline
        ret nz  ;;si el valor es 0, fin de la rutina
;;calcula la siguiente linea
    ld a,l
    add a,$20   ;;añadew 1 a la linea (%0010 0000)
    ld l,A      ;;
        ret c   ;;si hay acarreom ha cambiado de tercio, ya viene ajustado de
                ;;arriba. Fin de la rutina
;;si llega aquim no ha cambiado de tercio y hay que ajustar ya que el
;;primer INC H lo incremento
    ld a,h 
    sub $08
    ld h,a 
ret
;;WWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWW
;;previous scan
;;obtiene la posicion de memoria correspondiente al scanline
;;anterior al inducado.
;;010T TSSS LLLC CCCC
;;entrasa: HL como scanline actual
;;salida: HL como scanline siguiente
;;altera AF,HL
;;MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
previous_scan:
    ld a,h 
    dec h 
    and $07
        ret nz 
;;calcula la linea anterior
    ld a,l 
    sub $20
    ld l,a 
        ret c 
;;si llega aquim ha pasasdo al scamline 7 de la linea anterior
;;y ha restado un tercio, que volvemos a sumar
    ld a,h 
    add a,$08
    ld h,a 
ret
