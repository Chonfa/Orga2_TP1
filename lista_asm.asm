
; PALABRA
	global palabraLongitud
	global palabraMenor
	global palabraFormatear
	global palabraImprimir
	global palabraCopiar
	
; LISTA y NODO
	global nodoCrear
	global nodoBorrar
	global oracionCrear
	global oracionBorrar
	global oracionImprimir

; AVANZADAS
	global longitudMedia
	global insertarOrdenado
	global filtrarPalabra
	global descifrarMensajeDiabolico

; YA IMPLEMENTADAS EN C
	extern palabraIgual
	extern insertarAtras

; /** DEFINES **/    >> SE RECOMIENDA COMPLETAR LOS DEFINES CON LOS VALORES CORRECTOS
	%define NULL 		0
	%define TRUE 		1
	%define FALSE 		0

	%define LISTA_SIZE 	    	 8
	%define OFFSET_PRIMERO 		 0

	%define NODO_SIZE     		 16
	%define OFFSET_SIGUIENTE   	 0
	%define OFFSET_PALABRA 		 8

	%define OFFSET_CHAR			1


section .rodata


section .data


section .text


;/** FUNCIONES DE PALABRAS **/
;-----------------------------------------------------------

	; unsigned char palabraLongitud( char *p ); [15]
	palabraLongitud:

		push	rbp
		mov		rbp, rsp
		xor 	al, al			 ;al parte baja rax
		mov 	r14b, byte [rdi] ;byte me dice el tamaño de lo que leo 
		cmp 	r14b, NULL		 ;dil parte rdi
		je 		.fin
	
	.ciclo:
		inc 	al
		lea 	rdi, [rdi + OFFSET_CHAR]
		mov 	r14b, byte [rdi] ;byte me dice el tamaño de lo que leo 
		cmp 	r14b, NULL
		jne 	.ciclo

	.fin:
		pop 	rbp
		ret


	; bool palabraMenor( char *p1, char *p2 ); [30]
	palabraMenor:
		; COMPLETAR AQUI EL CODIGO

		push 	rbp
		mov 	rbp, rsp 
		xor 	al, al
.ciclo:
		mov 	r14b, byte [rdi]
		mov 	r15b, byte [rsi]

		cmp 	r14b, r15b
		jl 		.finTrue 					;prim_letra(p1) < prim_letra(p2) ? then True

		jne 	.finFalse					;prim_letra(p1) != prim_letra(p2) ? then False

		cmp 	r14b, 0
		je 		.finFalse					;prim_letra(p1) == 0 ? then False


		lea 	rdi, [rdi + OFFSET_CHAR]
		lea 	rsi, [rsi + OFFSET_CHAR]
;		mov 	r14b, byte [rdi]
;		mov 	r15b, byte [rsi]
;		cmp 	r14b, r15b
;		jl 		.fin
		jmp 	.ciclo

	.finTrue:
		mov 	al, 1
	.finFalse:
		pop 	rbp
		ret


	; void palabraFormatear( char *p, void (*funcModificarString)(char*) ); [5]
	palabraFormatear:
		; COMPLETAR AQUI EL CODIGO

	; void palabraImprimir( char *p, FILE *file ); [15]
	palabraImprimir:
		; COMPLETAR AQUI EL CODIGO

	; char *palabraCopiar( char *p ); [25]
	palabraCopiar:
		; COMPLETAR AQUI EL CODIGO


;/** FUNCIONES DE LISTA Y NODO **/
;-----------------------------------------------------------

	; nodo *nodoCrear( char *palabra ); [15]
	nodoCrear:
		; COMPLETAR AQUI EL CODIGO

	; void nodoBorrar( nodo *n ); [15]
	nodoBorrar:
		; COMPLETAR AQUI EL CODIGO

	; lista *oracionCrear( void ); [10]
	oracionCrear:
		; COMPLETAR AQUI EL CODIGO

	; void oracionBorrar( lista *l ); [20]
	oracionBorrar:
		; COMPLETAR AQUI EL CODIGO

	; void oracionImprimir( lista *l, char *archivo, void (*funcImprimirPalabra)(char*,FILE*) ); [35]
	oracionImprimir:
		; COMPLETAR AQUI EL CODIGO


;/** FUNCIONES AVANZADAS **/
;-----------------------------------------------------------

	; float longitudMedia( lista *l ); [30]
	longitudMedia:
		; COMPLETAR AQUI EL CODIGO

	; void insertarOrdenado( lista *l, char *palabra, bool (*funcCompararPalabra)(char*,char*) ); [35]
	insertarOrdenado:
		; COMPLETAR AQUI EL CODIGO

	; void filtrarAltaLista( lista *l, bool (*funcCompararPalabra)(char*,char*), char *palabraCmp ); [35]
	filtrarPalabra:
		; COMPLETAR AQUI EL CODIGO

	; void descifrarMensajeDiabolico( lista *l, char *archivo, void (*funcImpPbr)(char*,FILE* ) ); [45]
	descifrarMensajeDiabolico:
		; COMPLETAR AQUI EL CODIGO
