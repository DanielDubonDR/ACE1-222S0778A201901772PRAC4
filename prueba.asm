; Comparar 2 cadenas con ExtraSegment y 
; cmpsb (CompareSubString)
; repe  (Repeat equals) repite si es igual a 0 si da 1 se rompe 
; y se activa la ZF=1
; ingresamos 2 cadenas y las compara con SI y DI 
.model small
.stack 
.data
    letrero1 db 10,13,'Ingresa una palabra $'
    letrero3 db 10,13,'Son iguales $'
    letrero2 db 10,13,'No son iguales $'   
    cadena1 db 100 dup (' '),'$'
    cadena2 db 100 dup (' '),'$'  
.code
    main proc far
        mov ax,@data
        mov ds,ax
        mov es,ax
        ;cmpsb
        mov cadena1[0],'h'
        mov cadena1[1],'o'
        mov cadena1[2],'l'
        mov cadena1[3],'a'

        mov cadena2[0],'h'
        mov cadena2[1],'o'
        mov cadena2[2],'l'
        mov cadena2[3],'['
        
        ; llamamos a hacer el desplzamiento en cada cadena
        lea si,cadena1
        lea di,cadena2
        mov cx,100
        
        repe cmpsb      ; repeat equals compare substring (tambien podemos usar repz (repeat if zero)
        je iguales      ; si fueron iguales todos los caracteres ira a esta etiqueta
        jne no_iguales  ; en caso contrario a esta
        
        iguales:
            mov ah,09h
            lea dx,letrero3
            int 21h
            jmp salida
        no_iguales:
            mov ah,09h
            lea dx,letrero2
            int 21h
            jmp salida
           
        
        salida:
        mov ah,4ch
        int 21h
.exit
main endp
end main
;------------------------------------DirtyCode 2021-----------------------------------------