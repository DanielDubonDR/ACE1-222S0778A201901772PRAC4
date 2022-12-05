include macros.asm

.model small

;*---------------------------------> SEGMENTO DE PILA
.stack

;*---------------------------------> SEGMENTO DE DATOS
.data
;?---------------------------------> Variables de texto

ln                  db 0ah, '$'
intro0              db 'Universidad de San Carlos de Guatemala','$'
intro1              db 'Facultad de Ingenieria','$'
intro2              db 'Escuela de Ciencias y Sistemas','$'
intro3              db 'Arquitectura de Computadores y Ensambladores 1','$'
intro4              db 'Seccion A','$'
intro5              db 'Daniel Reginaldo Dubon Rodriguez','$'
intro6              db '201901772','$'

msgMenu             db '          MENU', '$'
op1                 db '-> 1. Calculadora', '$'
op2                 db '-> 2. Archivo', '$'
op3                 db '-> 3. Salir', '$'
op                  db 'Ingrese una opcion: $'
mayor               db '   >  $'
comando1            db 100 dup('$')
comando2            db 100 dup('$')
comando3            db 100 dup('$')
comando4            db 100 dup('$')
comando5            db 100 dup('$')
comando6            db 100 dup('$')
comando7            db 100 dup('$')
comando8            db 100 dup('$')
comando9            db 100 dup('$')
comando10           db 100 dup('$')

ig                  db 'Los numeros son iguales', '$'
noig                db 'Los numeros no son iguales', '$'

reset               db 'Se han restablecido los valores', '$'
mostrarMedia        db 'Mostrar Media : 3', '$'
mostrarMediana      db 'Mostrar Mediana: 2', '$'
mostrarModa         db 'Mostrar Moda :2', '$'
mostrarImpares      db 'Mostrar Impares: 4', '$'
mostrarPares        db 'Mostrar Pares: 6', '$'
mostrarFibonacci    db 'Mostrar Fibonacci: 2', '$'
mostrarLucas        db 'Mostrar Lucas: 1', '$'
mostrarExec         db 'Mostrar Exec: ', '$'

msgPrueba           db 'Sale en semestre', '$'

Merror              db 0ah,0dh,'Error en leer archivo $'

msgCalculadora      db 0ah,0dh,' CALCULADORA',0ah,0dh, '$'
separador           db ' ==============================',0ah,0dh, '$'

msgCargar           db 'Ingrese ruta del archivo: ', '$'

num4                db '4',0ah,0dh,'$'
num5                db '5',0ah,0dh,'$'
num6                db '6',0ah,0dh,'$'

abreReporte         db '<reporte>',0dh
cierraReporte       db '</reporte>',0dh
abreDatos           db '    <datos>',0dh
cierraDatos         db '    </datos>',0dh
rNombre             db '        <nombre>Daniel Reginaldo Dubon Rodriguez<nombre>',0dh
rCarnet             db '        <carnet>201901772<carnet>',0dh
rCurso              db '        <curso>Arquitectura de Computadores y Ensambladores 1<curso>',0dh
rSeccion            db '        <seccion>A<seccion>',0dh
abreFecha           db '    <fecha>',0dh
cierraFecha         db '    </fecha>',0dh
abreDia             db '        <dia>'
cierraDia           db '</dia>',0dh
abreMes             db '        <mes>'
cierraMes           db '</mes>',0dh
abreAnio            db '        <anio>20'
cierraAnio          db '22</anio>',0dh
abreTiempo          db '    <tiempo>',0dh
cierraTiempo        db '    </tiempo>',0dh
abreHora            db '        <hora>'
cierraHora          db '</hora>',0dh
abreMinuto          db '        <minuto>'
cierraMinuto        db '</minuto>',0dh
abreSegundo         db '        <segundo>'
cierraSegundo       db '</segundo>',0dh
abreEstadisticos    db '    <estadisticos>',0dh
cierraEstadisticos  db '    </estadisticos>',0dh
abreMedia           db '        <media>'
cierraMedia         db '</media>',0dh
abreMediana         db '        <mediana>'
cierraMediana       db '</mediana>',0dh
abreModa            db '        <moda>'
cierraModa          db '</moda>',0dh
abrePares          db '        <pares>'
cierraPares        db '</pares>',0dh
abreImpares         db '        <impares>'
cierraImpares       db '</impares>',0dh
abreFibonacci       db '        <fibonacci>'
cierraFibonacci     db '</fibonacci>',0dh
abreLucas           db '        <lucas>'
cierraLucas         db '</lucas>',0dh
abreOperaciones     db '    <operaciones>',0dh
cierraOperaciones   db '    </operaciones>',0dh
pruebaXML           db '        <oper1>33</oper1>',0dh

msgError2           db 0ah,0dh,'Error al escribir reporte','$'


;?---------------------------------> Variables de de datos
entrada             db 100 dup('$')
entradaAux          db 100 dup('$')
lenEntrada          dw 0
naux                db 2 dup('0'), '$'
baux                db 10
tipoDeComnado       db 0
tipoCaracter        db 0

ruta                db 40 dup(0),0
lRuta               db 40 dup(0),0
handler             dw ?
entradatxt          db 11 dup('$')
limpiartxt          db 11 dup('$')

nombreReporte       db 'reporte.xml',0
handler2            dw ?

dia                 db 2 dup('0')
mes                 db 2 dup('0')
hora                db 2 dup('0')
minuto              db 2 dup('0')
segundo             db 2 dup('0')

lengthEntradaAux    dw 0
naux3               db 3 dup('0'), '$'

numa                db 5

resultado           db 0
tipoOperador        db 0
numAux              db 0

numerosPares        db 0
numerosImpares      db 0
sumaNumeros         db 0
contNumeros         db 0
mediaa              db 0
listMediana         db 50 dup(0)
contMediana         dw 0
mediana             db 0
moda                db 0

numPares            db 3 dup('0')
numImpares          db 3 dup('0')
numMedia            db 3 dup('0')
numMediana          db 3 dup('0')
numModa             db 3 dup('0')

numFibonacci        db 3 dup('0')
numLucas            db 3 dup('0')
contFibonacci       db 0
contLucas           db 0

numAnterior         db 1
resultadoF          db 0

numAnterior2        db 1
resultado2          db 3

;*---------------------------------> SEGMENTO DE CODIGO
.code
    main PROC
    INTRODUCCION:
        printIntro
        llenarComandos
        getch
        cmp al, 0dh
        je MENU
        jne INTRODUCCION


    MENU:
        printMenu
        getch
        cmp al, '1'
        je INTROCALCULADORA
        cmp al, '2'
        je ARCHIVO
        cmp al, '3'
        je SALIR
        jmp MENU
    
    INTROCALCULADORA:
        cls
        jmp CALCULADORA
    
    CALCULADORA:
        printCalculadora
        getText entrada
        ; print ln
        ; print entrada
        verificarComando entrada
        cmp tipoDeComnado, 1
        je COM1
        cmp tipoDeComnado, 2
        je COM2
        cmp tipoDeComnado, 3
        je COM3
        cmp tipoDeComnado, 4
        je COM4
        cmp tipoDeComnado, 5
        je COM5
        cmp tipoDeComnado, 6
        je COM6
        cmp tipoDeComnado, 7
        je COM7
        cmp tipoDeComnado, 8
        je COM8
        cmp tipoDeComnado, 9
        je MENU
        cmp tipoDeComnado, 10
        je COM10
        ; print msgPrueba
        preProcesarCadena entrada
        ; !----------------------------
        ; print mayor
        ; print entradaAux
        ; print ln
        ; printn lengthEntradaAux
        ; print ln
        ; printn3 numa
        ; print ln
        print ln
        operarA
        jmp CALCULADORA
    
    COM1:
        mov numerosPares,0
        mov numerosImpares,0
        mov sumaNumeros, 0
        mov contNumeros, 0
        mov mediaa, 0
        mov contFibonacci, 0
        mov contLucas, 0
        mov numAux, 0     
        print mayor
        print reset
        mov tipoDeComnado, 0
        print ln
        print ln
        jmp CALCULADORA
    
    COM2:
        print mayor
        printn3 mediaa
        mov tipoDeComnado, 0
        print ln
        print ln
        jmp CALCULADORA
    
    COM3:
        print mayor
        printn3 moda
        mov tipoDeComnado, 0
        print ln
        print ln
        jmp CALCULADORA
    
    COM4:
        print mayor
        printn3 contNumeros
        mov tipoDeComnado, 0
        print ln
        print ln
        jmp CALCULADORA
    
    COM5:
        print mayor
        printn3 numerosImpares
        mov tipoDeComnado, 0
        limpiarCadeaEntrada
        print ln
        print ln
        jmp CALCULADORA
    
    COM6:
        print mayor
        printn3 numerosPares
        mov tipoDeComnado, 0
        limpiarCadeaEntrada
        print ln
        print ln
        jmp CALCULADORA
    
    COM7:
        print mayor
        printn3 contFibonacci
        mov tipoDeComnado, 0
        print ln
        print ln
        jmp CALCULADORA

    COM8:
        print mayor
        printn3 contLucas
        mov tipoDeComnado, 0
        print ln
        print ln
        jmp CALCULADORA
    
    COM10:
        print mostrarExec
        getch
        jmp CALCULADORA
    
    ARCHIVO:
        cls
        print ln
        print msgCargar
        getText2 ruta
        leerArchivo ruta, Merror
        getch
        jmp MENU

    
    SALIR:
        generarReporte
        .exit

    main ENDP

END main
