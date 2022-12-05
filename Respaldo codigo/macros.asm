cls macro
    mov ax, 03h
    int 10h
endm

printc macro txt, color
    ; carga en memoria las variables del semento de datos
    mov ax, @data
    mov ds, ax

    ; impresion por pantalla
    mov ah, 09h
    mov bl, color
    mov cx, lengthof txt - 1
    int 10h
    lea dx, txt
    int 21h
endm

printn macro n
    mov ax, 0
    mov al, n
    div baux

    mov naux[0], al
    mov naux[1], ah

    add naux[0], 48
    add naux[1], 48

    lea dx, naux
    mov ah, 09h
    int 21h
endm

print macro txt
    ; carga en memoria las variables del semento de datos
    mov ax, @data
    mov ds, ax

    ; impresion por pantalla
    mov ah, 09h
    lea dx, txt
    int 21h
endm

getch macro
    mov ah, 01h
    int 21h
endm

printIntro macro
    cls
    printc ln, 0d
    printc intro0, 10d
    printc ln, 0d
    printc intro1, 10d
    printc ln, 0d
    printc intro2, 10d
    printc ln, 0d
    printc intro3, 10d
    printc ln, 0d
    printc intro4, 10d
    printc ln, 0d
    printc intro5, 10d
    printc ln, 0d
    printc intro6, 10d
endm

printMenu macro
    cls
    printc ln, 0d
    printc msgMenu, 4d
    printc ln, 0d
    printc ln, 0d
    printc op1, 9d
    printc ln, 0d
    printc op2, 9d
    printc ln, 0d
    printc op3, 9d
    printc ln, 0d
    printc ln, 0d
    printc mayor, 10d
endm

printCalculadora macro
    print msgCalculadora
    print separador
    print mayor
endm

getText macro variable
    LOCAL continue, salir
    mov lenEntrada, 0
    limpiarCadeaEntrada
    xor si,si
    continue:
        getch
        cmp al,0dh
        je salir
        mov variable[si],al
        inc lenEntrada
        inc si
        jmp continue

    salir:
        mov variable[si],'$'
        dec lenEntrada
endm

interpretar macro variable
    LOCAL n4, n5, n6, salir
    cmp lenEntrada, 4
    jz n4
    cmp lenEntrada, 5
    jz n5
    cmp lenEntrada, 6
    jz n6
    jmp salir
    
    n4:
        print num4
        jmp salir
    n5:
        print num5
        jmp salir
    n6: 
        print num6
        jmp salir
    salir:
        
endm

verificarComando macro txt
    LOCAL salida, iguales, no_iguales, iguales2, no_iguales2, iguales3, no_iguales3, iguales4, no_iguales4, iguales5, no_iguales5, iguales6, no_iguales6, iguales7, no_iguales7, iguales8, no_iguales8, iguales9, no_iguales9, iguales10
    ; llenarComandos
    mov ax,@data
    mov ds,ax
    mov es,ax

    lea si,txt
    lea di,comando1
    mov cx,100
    
    repe cmpsb      ; repeat equals compare substring (tambien podemos usar repz (repeat if zero)
    je iguales      ; si fueron iguales todos los caracteres ira a esta etiqueta
    jne no_iguales  ; en caso contrario a esta
    
    iguales:
        mov tipoDeComnado, 1
        jmp salida

    no_iguales:
        lea si,txt
        lea di,comando2
        mov cx,100
        repe cmpsb      
        je iguales2     
        jne no_iguales2
    
    iguales2:
        mov tipoDeComnado, 2
        jmp salida
    
    no_iguales2:
        lea si,txt
        lea di,comando3
        mov cx,100
        repe cmpsb      
        je iguales3     
        jne no_iguales3
    
    iguales3:
        mov tipoDeComnado, 3
        jmp salida
    
    no_iguales3:
        lea si,txt
        lea di,comando4
        mov cx,100
        repe cmpsb      
        je iguales4     
        jne no_iguales4
    
    iguales4:
        mov tipoDeComnado, 4
        jmp salida
    
    no_iguales4:
        lea si,txt
        lea di,comando5
        mov cx,100
        repe cmpsb      
        je iguales5     
        jne no_iguales5
    
    iguales5:
        mov tipoDeComnado, 5
        jmp salida
    
    no_iguales5:
        lea si,txt
        lea di,comando6
        mov cx,100
        repe cmpsb      
        je iguales6   
        jne no_iguales6
    
    iguales6:
        mov tipoDeComnado, 6
        jmp salida
    
    no_iguales6:
        lea si,txt
        lea di,comando7
        mov cx,100
        repe cmpsb      
        je iguales7   
        jne no_iguales7
    
    iguales7:
        mov tipoDeComnado, 7
        jmp salida
    
    no_iguales7:
        lea si,txt
        lea di,comando8
        mov cx,100
        repe cmpsb      
        je iguales8   
        jne no_iguales8
    
    iguales8:
        mov tipoDeComnado, 8
        jmp salida
    
    no_iguales8:
        lea si,txt
        lea di,comando9
        mov cx,100
        repe cmpsb      
        je iguales9   
        jne no_iguales9
    
    iguales9:
        mov tipoDeComnado, 9
        jmp salida
    
    no_iguales9:
        lea si,txt
        lea di,comando10
        mov cx,4
        repe cmpsb      
        je iguales10   
        jne salida
    
    iguales10:
        mov tipoDeComnado, 10
        jmp salida
    
    salida:
endm

llenarComandos macro
    mov comando1[0], 'R'
    mov comando1[1], 'E'
    mov comando1[2], 'S'
    mov comando1[3], 'E'
    mov comando1[4], 'T'

    mov comando2[0], 'M'
    mov comando2[1], 'O'
    mov comando2[2], 'S'
    mov comando2[3], 'T'
    mov comando2[4], 'R'
    mov comando2[5], 'A'
    mov comando2[6], 'R'
    mov comando2[7], ' '
    mov comando2[8], 'M'
    mov comando2[9], 'E'
    mov comando2[10], 'D'
    mov comando2[11], 'I'
    mov comando2[12], 'A'

    mov comando3[0], 'M'
    mov comando3[1], 'O'
    mov comando3[2], 'S'
    mov comando3[3], 'T'
    mov comando3[4], 'R'
    mov comando3[5], 'A'
    mov comando3[6], 'R'
    mov comando3[7], ' '
    mov comando3[8], 'M'
    mov comando3[9], 'O'
    mov comando3[10], 'D'
    mov comando3[11], 'A'

    mov comando4[0], 'M'
    mov comando4[1], 'O'
    mov comando4[2], 'S'
    mov comando4[3], 'T'
    mov comando4[4], 'R'
    mov comando4[5], 'A'
    mov comando4[6], 'R'
    mov comando4[7], ' '
    mov comando4[8], 'M'
    mov comando4[9], 'E'
    mov comando4[10], 'D'
    mov comando4[11], 'I'
    mov comando4[12], 'A'
    mov comando4[13], 'N'
    mov comando4[14], 'A'

    mov comando5[0], 'M'
    mov comando5[1], 'O'
    mov comando5[2], 'S'
    mov comando5[3], 'T'
    mov comando5[4], 'R'
    mov comando5[5], 'A'
    mov comando5[6], 'R'
    mov comando5[7], ' '
    mov comando5[8], 'I'
    mov comando5[9], 'M'
    mov comando5[10], 'P'
    mov comando5[11], 'A'
    mov comando5[12], 'R'
    mov comando5[13], 'E'
    mov comando5[14], 'S'

    mov comando6[0], 'M'
    mov comando6[1], 'O'
    mov comando6[2], 'S'
    mov comando6[3], 'T'
    mov comando6[4], 'R'
    mov comando6[5], 'A'
    mov comando6[6], 'R'
    mov comando6[7], ' '
    mov comando6[8], 'P'
    mov comando6[9], 'A'
    mov comando6[10], 'R'
    mov comando6[11], 'E'
    mov comando6[12], 'S'

    mov comando7[0], 'M'
    mov comando7[1], 'O'
    mov comando7[2], 'S'
    mov comando7[3], 'T'
    mov comando7[4], 'R'
    mov comando7[5], 'A'
    mov comando7[6], 'R'
    mov comando7[7], ' '
    mov comando7[8], 'F'
    mov comando7[9], 'I'
    mov comando7[10], 'B'
    mov comando7[11], 'O'
    mov comando7[12], 'N'
    mov comando7[13], 'A'
    mov comando7[14], 'C'
    mov comando7[15], 'C'
    mov comando7[16], 'I'

    mov comando8[0], 'M'
    mov comando8[1], 'O'
    mov comando8[2], 'S'
    mov comando8[3], 'T'
    mov comando8[4], 'R'
    mov comando8[5], 'A'
    mov comando8[6], 'R'
    mov comando8[7], ' '
    mov comando8[8], 'L'
    mov comando8[9], 'U'
    mov comando8[10], 'C'
    mov comando8[11], 'A'
    mov comando8[12], 'S'

    mov comando9[0], 'S'
    mov comando9[1], 'A'
    mov comando9[2], 'L'
    mov comando9[3], 'I'
    mov comando9[4], 'R'

    mov comando10[0], 'E'
    mov comando10[1], 'X'
    mov comando10[2], 'E'
    mov comando10[3], 'C'

endm

limpiarCadeaEntrada macro
    LOCAL repetir, salir
    xor di, di
    mov cx, 100
    repetir:
        mov entrada[di], '$'
        inc di
    loop repetir
endm

limpiarCadeaEntradaAux macro
    LOCAL repetir, salir
    xor di, di
    mov cx, 100
    repetir:
        mov entradaAux[di], '$'
        inc di
    loop repetir
endm


preProcesarCadena macro
    LOCAL repetir, salir, copiar, evaluar, espacio, evaluarM, evaluarM1, evaluarM2, evaluarE, evaluarP, evaluarP1, evaluarP2

    limpiarCadeaEntradaAux
    xor si, si
    xor di, di
    mov lengthEntradaAux, 0
    
    repetir:
        verificarTipoCaracter entrada[si]
        cmp si, lenEntrada
        jg salir
        cmp tipoCaracter, 1
        je copiar
        cmp tipoCaracter, 2
        je espacio
        cmp tipoCaracter, 3
        je copiar
        cmp tipoCaracter, 4
        je evaluar
    
    copiar:
        mov dh, entrada[si]
        mov entradaAux[di], dh
        inc si
        inc di
        inc lengthEntradaAux
        jmp repetir
    
    espacio:
        inc si
        jmp repetir

    evaluar:
        cmp entrada[si], 'm'
        je evaluarM
        cmp entrada[si], 'e'
        je evaluarE
        cmp entrada[si], 'p'
        je evaluarP
        
    evaluarM:
        inc si
        cmp entrada[si], 'a'
        je evaluarM1
        cmp entrada[si], 'e'
        je evaluarM2
    
    evaluarM1:
        mov entradaAux[di], '+'
        inc di
        inc si
        inc si
        inc lengthEntradaAux
        jmp repetir
    
    evaluarM2:
        inc si
        mov entradaAux[di], '-'
        inc di
        inc si
        inc si
        inc si
        inc lengthEntradaAux
        jmp repetir
    
    evaluarE:
        mov entradaAux[di], '/'
        inc di
        inc si
        inc si
        inc si
        inc si
        inc si
        inc lengthEntradaAux
        jmp repetir
    
    evaluarP:
        inc si
        inc si
        cmp entrada[si], 'r'
        je evaluarP1
        cmp entrada[si], 't'
        je evaluarP2
    
    evaluarP1:
        mov entradaAux[di], '*'
        inc di
        inc si
        inc lengthEntradaAux
        jmp repetir
    
    evaluarP2:
        mov entradaAux[di], '^'
        inc di
        inc si
        inc si
        inc si
        inc si
        inc si
        inc si
        inc lengthEntradaAux
        jmp repetir

    
    salir:

endm

verificarTipoCaracter macro caracter
    LOCAL numero, espacio, operador, letra, salir

    cmp caracter, '0'
    je numero
    cmp caracter, '1'
    je numero
    cmp caracter, '2'
    je numero
    cmp caracter, '3'
    je numero
    cmp caracter, '4'
    je numero
    cmp caracter, '5'
    je numero
    cmp caracter, '6'
    je numero
    cmp caracter, '7'
    je numero
    cmp caracter, '8'
    je numero
    cmp caracter, '9'
    je numero
    cmp caracter, ' '
    je espacio
    cmp caracter, '('
    je espacio
    cmp caracter, ')'
    je espacio
    cmp caracter, '+'
    je operador
    cmp caracter, '-'
    je operador
    cmp caracter, '*'
    je operador
    cmp caracter, '/'
    je operador
    cmp caracter, '^'
    je operador
    jmp letra

    numero:
        mov tipoCaracter, 1
        jmp salir
    
    espacio:
        mov tipoCaracter, 2
        jmp salir
    
    operador:
        mov tipoCaracter, 3
        jmp salir
    
    letra:
        mov tipoCaracter, 4
        jmp salir

    salir:
endm

leerArchivo macro rruta, msgError
    LOCAL abrir, error, leer, salir, limpiar

    abrir:
        mov ah, 3dh
        mov al, 0
        mov dx, offset rruta
        int 21h
        jc error
        mov handler, ax

    leer:
        mov ah, 3fh
        mov bx, handler
        mov dx, offset entradatxt
        mov cx, 10
        int 21h
        jc error
        cmp ax, 0
        jz salir
        print entradatxt
        
    limpiar:
        mov si, offset limpiartxt
        mov di, offset entradatxt
        mov cx, 10
        rep movsb
        jmp leer

    error:
        print msgError

    salir:
        mov ah, 3eh
        mov bx, handler
        int 21h
        
endm

getText2 macro variable
    LOCAL continue, salir

    ; limpiarRuta
    xor si,si

    continue:
        getch
        cmp al,0dh
        je salir
        mov variable[si],al
        inc si
        jmp continue

    salir:
        mov variable[si],0
endm

limpiarRuta macro
    mov si, offset ruta
    mov di, offset lRuta
    mov cx, 40
    rep movsb
endm

generarReporte macro
    abrirArchivo
    escribirEnArchivo abreReporte
    escribirEnArchivo abreDatos
    escribirEnArchivo rNombre
    escribirEnArchivo rCarnet
    escribirEnArchivo rCurso
    escribirEnArchivo rSeccion
    escribirEnArchivo cierraDatos
    escribirEnArchivo abreFecha
    escribirEnArchivo abreDia
    generarFecha
    escribirEnArchivo dia
    escribirEnArchivo cierraDia
    escribirEnArchivo abreMes
    escribirEnArchivo mes
    escribirEnArchivo cierraMes
    escribirEnArchivo abreAnio
    escribirEnArchivo cierraAnio
    escribirEnArchivo cierraFecha
    escribirEnArchivo abreTiempo
    generarHora
    escribirEnArchivo abreHora
    escribirEnArchivo hora
    escribirEnArchivo cierraHora
    escribirEnArchivo abreMinuto
    escribirEnArchivo minuto
    escribirEnArchivo cierraMinuto
    escribirEnArchivo abreSegundo
    escribirEnArchivo segundo
    escribirEnArchivo cierraSegundo
    escribirEnArchivo cierraTiempo
    escribirEnArchivo abreEstadisticos
    escribirEnArchivo abreMedia
    convertirAReporte mediaa, numMedia
    escribirEnArchivo numMedia
    escribirEnArchivo cierraMedia
    escribirEnArchivo abreMediana
    convertirAReporte contNumeros, numMediana
    escribirEnArchivo cierraMediana
    escribirEnArchivo abreModa
    convertirAReporte moda, numModa
    escribirEnArchivo numModa
    escribirEnArchivo cierraModa
    escribirEnArchivo abrePares
    convertirAReporte numerosPares, numPares
    escribirEnArchivo numPares
    escribirEnArchivo cierraPares
    escribirEnArchivo abreImpares
    convertirAReporte numerosImpares, numImpares
    escribirEnArchivo numImpares
    escribirEnArchivo cierraImpares
    escribirEnArchivo abreFibonacci
    convertirAReporte contFibonacci, numFibonacci
    escribirEnArchivo numFibonacci
    escribirEnArchivo cierraFibonacci
    escribirEnArchivo abreLucas
    convertirAReporte contLucas, numLucas
    escribirEnArchivo numLucas
    escribirEnArchivo cierraLucas
    escribirEnArchivo cierraEstadisticos
    escribirEnArchivo abreOperaciones
    escribirEnArchivo pruebaXML
    escribirEnArchivo cierraOperaciones
    escribirEnArchivo cierraReporte
    cerrarArchivo
endm

abrirArchivo macro
    LOCAL error, salir

    mov ah, 3dh
    mov al, 10b
    mov dx, offset nombreReporte
    int 21h
    jc error
    mov handler2, ax
    jmp salir

    error:
        print msgError2
    
    salir:
endm

cerrarArchivo macro
    mov ah,3eh
    mov handler2, bx
    int 21h
endm

escribirEnArchivo macro texto
    mov ah, 40h
    mov bx, handler2
    mov cx, sizeof texto
    mov dx, offset texto
    int 21h
endm

convertirACadena macro buffer     
    push dx
    xor dx,dx
    mov dl,al
    xor ax,ax
    mov bl,0ah
    mov al,dl
    div bl
    push ax
    add al,30h
    mov buffer[0], al        
    inc di
    pop ax
    add ah,30h
    mov buffer[1], ah
    inc di
    pop dx
endm

generarFecha macro
    xor ax, ax
    xor bx, bx
    mov ah, 2ah             
    int 21h
    mov di,0
    mov al,dl
    convertirACadena dia
    inc di           
    mov al, dh
    convertirACadena mes
endm

generarHora macro
    xor     ax, ax
    xor     bx, bx
    mov     ah, 2ch
    int     21h
    mov     di,0
    mov     al, ch
    convertirACadena hora
    inc     di  
    mov     al, cl
    convertirACadena minuto
    inc     di
    mov     al, dh
    convertirACadena segundo
endm

printn3 macro n
    ;! asdfa
    mov naux3[0], '0'
    mov naux3[1], '0'
    mov naux3[2], '0'

    mov ax, 0
    mov al, n
    mov cl, 0ah
    div cl
    add ah, 30h

    mov naux3[2], ah

    mov ah, 0
    div cl
    add ah, 30h
    mov naux3[1], ah
    add al, 30h
    mov naux3[0], al

    print naux3
endm

operarA macro
    LOCAL iterar, convertirNumero, salir, verificarOperador, operarSuma, operarResta, operarMultiplicacion, operarDivision, operarPotencia, operar, ciclo
    xor di, di
    xor ax, ax
    xor bx, bx

    iterar:
        cmp di, lengthEntradaAux
        je operar
        verificarTipoCaracter entradaAux[di]
        cmp tipoCaracter, 1
        je convertirNumero
        cmp tipoCaracter, 3
        je verificarOperador
    
    convertirNumero:
        mov bl, 0ah
        mul bl

        mov bh, entradaAux[di]
        sub bh, 30h

        add al, bh

        inc di

        jmp iterar
    
    verificarOperador:
        mov resultado, al
        mov numAux, al
        mov moda, al
        add sumaNumeros, al
        verificarNumeroPar numAux
        calcularFibonacci numAux
        calcularLucas numAux
        inc contNumeros
        xor ax, ax
        xor bx, bx
        verificarTipoOperador entradaAux[di]
        inc di
        jmp iterar
    
    operar:
        mov numAux, al
        cmp tipoOperador, 1
        je operarSuma
        cmp tipoOperador, 2
        je operarResta
        cmp tipoOperador, 3
        je operarMultiplicacion
        cmp tipoOperador, 4
        je operarDivision
        cmp tipoOperador, 5
        je operarPotencia

    operarSuma:
        add sumaNumeros, al
        add resultado, al
        jmp salir
        

    operarResta:
        add sumaNumeros, al
        sub resultado, al
        jmp salir

    operarMultiplicacion:
        add sumaNumeros, al
        mul resultado
        mov resultado, al
        jmp salir

    operarDivision:
        add sumaNumeros, al
        mov bl, al
        mov al, resultado
        div bl
        mov resultado, al
        jmp salir

    operarPotencia:
        add sumaNumeros, al
        mov cl, al
        dec cl
        mov ch, 0
        xor bx, bx
        mov bl, resultado
        jmp ciclo

        ciclo:
            cmp cl, ch
            je salir
            inc ch
            mov al, resultado
            mul bl
            mov resultado, al
            jmp ciclo


    salir:
        verificarNumeroPar numAux
        calcularFibonacci numAux
        calcularLucas numAux
        inc contNumeros
        mov al, sumaNumeros
        div contNumeros
        mov mediaa, al
        printCalculadora
        printn3 resultado
        print ln
        print ln

endm

verificarTipoOperador macro op
    LOCAL operadorSuma, operadorResta, operadorMultiplicacion, operadorDivision, operadorPotencia, salir
    cmp op, '+'
    je operadorSuma
    cmp op, '-'
    je operadorResta
    cmp op, '*'
    je operadorMultiplicacion
    cmp op, '/'
    je operadorDivision
    cmp op, '^'
    je operadorPotencia

    operadorSuma:
        mov tipoOperador, 1
        jmp salir
    operadorResta:
        mov tipoOperador, 2
        jmp salir
    operadorMultiplicacion:
        mov tipoOperador, 3
        jmp salir
    operadorDivision:
        mov tipoOperador, 4
        jmp salir
    operadorPotencia:
        mov tipoOperador, 5
        jmp salir

    salir:

endm

verificarNumeroPar macro n
    LOCAL salir, esPar, noEsPar
    mov al, n
    mov bl, 2
    div bl
    cmp ah, 0
    je esPar
    jmp noEsPar

    esPar:
        inc numerosPares
        jmp salir
    noEsPar:
        inc numerosImpares
        jmp salir

    salir:

endm

convertirAReporte macro n, var
    ;! asdfa
    mov var[0], '0'
    mov var[1], '0'
    mov var[2], '0'

    mov ax, 0
    mov al, n
    mov cl, 0ah
    div cl
    add ah, 30h

    mov var[2], ah

    mov ah, 0
    div cl
    add ah, 30h
    mov var[1], ah
    add al, 30h
    mov var[0], al
endm

calcularFibonacci macro n
    LOCAL salir, ciclo, incrementar
    xor si, si
    mov numAnterior, 1
    mov resultadoF, 0
    ciclo:
        cmp si, 13
        je salir
        mov ch, numAnterior
        mov cl, resultadoF
        mov numAnterior, cl
        add resultadoF, ch
        mov dh, resultadoF
        cmp n, dh
        je incrementar
        inc si
        jmp ciclo
    
    incrementar:
        inc contFibonacci
        jmp salir

    salir:
endm

calcularLucas macro n
    LOCAL salir, ciclo, incrementar
    xor si, si
    mov numAnterior2, 1
    mov resultado2, 3

    cmp n, 1
    je incrementar
    cmp n, 2
    je incrementar
    cmp n, 3
    je incrementar
    jmp ciclo

    ciclo:
        cmp si, 9
        je salir
        mov ch, numAnterior2
        mov cl, resultado2
        mov numAnterior2, cl
        add resultado2, ch
        mov dh, resultado2
        cmp n, dh
        je incrementar
        inc si
        jmp ciclo
    
    incrementar:
        inc contLucas
        jmp salir

    salir:
endm