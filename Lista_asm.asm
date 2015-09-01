EXTERN 		malloc
EXTERN 		free
EXTERN 		printf
EXTERN 		fprintf
EXTERN 		palabraLongitud


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
	%define NULL 			0
	%define TRUE 			1
	%define FALSE 			0

	%define LISTA_SIZE 	    	 8
	%define OFFSET_PRIMERO 		 0

	%define NODO_SIZE     		 16
	%define OFFSET_SIGUIENTE   	 0
	%define OFFSET_PALABRA 		 8

	%define OFFSET_CHAR		1


section .rodata


section .data

	string: 	db "%s", 10, 0


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
		mov 	r8b, byte [rdi]
		mov 	r9b, byte [rsi]

		cmp 	r8b, r9b
		jl 		.finTrue 					;prim_letra(p1) < prim_letra(p2) ? then True

		jne 	.finFalse					;prim_letra(p1) != prim_letra(p2) ? then False

		cmp 	r9b, 0
		je 		.finFalse					;prim_letra(p2) == 0 ? then False
;		cmp 	r8b, 0						;prim_letra(p1) == 0 ? then True
;		je 		.finTrue

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

		push 	rbp
		mov  	rbp, rsp

		call 	rsi

		pop 	rbp
		ret

	; void palabraImprimir( char *p, FILE *file ); [15]
	palabraImprimir:
		; COMPLETAR AQUI EL CODIGO

		push 	rbp
		mov 	rbp, rsp
		push 	rbx
		sub 	rsp, 8


		mov 	r8, rdi
		mov 	rdi, rsi
		mov 	rsi, string
		mov 	rbx, r8

		call 	fprintf

		add 	rsp, 8
		pop 	rbx
		pop 	rbp
		ret



	; char *palabraCopiar( char *p ); [25]
	palabraCopiar:
		; COMPLETAR AQUI EL CODIGO


		push 	rbp
		mov 	rbp, rsp
		push 	r8
		push 	rcx
		
		xor 	r12, r12

		mov 	r12, rdi

		call 	palabraLongitud

		mov 	r15b, byte [rax]				;Guardo la longitud en r15b(No se modifica)
;		mov 	cl, r15b							

		call 	malloc

		mov 	cl, r15b						;Guardo la longitud en cl(para el loop)
		mov 	r8, rax							;Preservo el puntero que voy a devolver

	.ciclo:
		mov 	r13b, [r12]						;Guardo la letra
		mov 	[r8], r13b						;Copio la letra a destino
		inc 	r8								;Incremento ambos punteros
		inc 	r12
;		inc 	r14b
;		lea 	r12, [r12 + OFFSET_CHAR]
		loop

		pop 	rcx
		pop 	r8
		pop 	rbp
		ret






;/** FUNCIONES DE LISTA Y NODO **/
;-----------------------------------------------------------

	; nodo *nodoCrear( char *palabra ); [15]
	nodoCrear:
		; COMPLETAR AQUI EL CODIGO

		push 	rbp
		mov 	rbp, rsp
		push 	r12
		sub 	rsp, 8

		mov 	r12, rdi
		mov 	rdi, NODO_SIZE

		call 	malloc

		mov 	[rax + OFFSET_SIGUIENTE], NULL
		mov 	[rax + OFFSET_PALABRA], r12

		add 	rsp, 8
		pop 	r12
		pop 	rbp
		ret


	; void nodoBorrar( nodo *n ); [15]
	nodoBorrar:
		; COMPLETAR AQUI EL CODIGO

		push 	rbp
		mov 	rbp, rsp

		call 	free

		pop 	rbp
		ret


	; lista *oracionCrear( void ); [10]
	oracionCrear:
		; COMPLETAR AQUI EL CODIGO

		push 	rbp
		mov 	rbp, rsp

		mov 	rdi, LISTA_SIZE
		call 	malloc

		mov 	[rax + OFFSET_LISTA], NULL

		pop 	rbp
		ret
		

	; void oracionBorrar( lista *l ); [20]
	oracionBorrar:
		; COMPLETAR AQUI EL CODIGO

		;Chequear tamaño de registros y si se preservan

		push 	rbp
		mov 	rbp, rsp
		push 	r11
		push 	r10

		mov 	r12, rdi			;Guarda el puntero a l
		cmp 	[r12 + OFFSET_PRIMERO], NULL
		je 		
		mov 	r13, [r12 + OFFSET_PRIMERO]

	.ciclo

		cmp 	[r13 + OFFSET_SIGUIENTE], NULL
		je 	fin2 	
		mov 	r14, r13
		mov 	[r13 + OFFSET_SIGUIENTE], r13
		mov 	rdi, r14
		call 	nodoBorrar
		jmp 	.ciclo

	.fin2 
		mod 	rdi, r13
		call 	nodoBorrar

	.fin	
		mov 	rdi, r10
		call 	free

		pop 	r10
		pop 	r11
		pop 	rbp	
		ret

	; void oracionImprimir( lista *l, char *archivo, void (*funcImprimirPalabra)(char*,FILE*) ); [35]
	oracionImprimir:
		; COMPLETAR AQUI EL CODIGO


;/** FUNCIONES AVANZADAS **/
;-----------------------------------------------------------

	; float longitudMedia( lista *l ); [30]
	longitudMedia:
		; COMPLETAR AQUI EL CODIGO
		push 	rbp
		mov 	rbp, rsp
		push 	rbx
		sub 	rsp, 8
		
		mov 	rdi, rbx
		
		xor 	r12, r12	;en r12 vamos a guardar la longitudMedia, tengo q ver q el call no la cambie
		xor 	xmm0, xmm0
		xor 	xmm1, xmm1
		xor 	xmm2, xmm2
		
		cmp 	[rbx + OFFSET_PRIMERO], NULL
		je	fin
		
		lea 	rbx, [rbx + OFFSET_PRIMERO]

	.ciclo:
		inc 	r12				;Contador de cantidad de palabras
		mov 	rdi, [rbx + OFFSET_PALABRA]
		call 	palabraLongitud
		
		cvtsi2ss xmm1, rax
		add 	xmm0, xmm1
		
		cmp 	[rbx + OFFSET_SIGUIENTE], 0
		je	fin
		
		lea 	rbx, [rbx + OFFSET_SIGUIENTE]
		jmp 	ciclo
		
	.fin:	
		cvtsi2ss xmm2, r12
		divpd 	xmm0, xmm2
		add 	rsp, 8
		pop 	rbx
		pop 	rbp
		ret

	; void insertarOrdenado( lista *l, char *palabra, bool (*funcCompararPalabra)(char*,char*) ); [35]
	insertarOrdenado:
		; COMPLETAR AQUI EL CODIGO
		
		push 	rbp
		mov 	rbp, rsp
		
		cmp 	[rdi + OFFSET_LISTA], NULL
		je	insertarNull
		lea 	rbx, [rdi + OFFSET_LISTA]
		
	.ciclo
		;Uso la funcion para comparar
		
		cmp 	rax, TRUE
		je 	insertar
		
		cmp	[rdi + OFFSET_SIGUIETE], NULL
		je 	insertarNull
		lea 	rbx, [rbx + OFFSET_SIGUIENTE]		;itero la lista
		jmp 	ciclo
		
		
	.insertar
		mov 	rdi, rsi		;deberia ir arriba de todo o chequear siguiente = null ?
		call 	nodoCrear		;deberia ir arriba de todo o chequear sig = null ?
		
		
		cmp	[rbx + OFFSET_SIGUINTE], NULL ; fijarme si el siguiente del que inserto es NULL
		je 	fin1
		mov 	r12, [rbx + OFFSET_SIGUIENTE]
		mov 	[rax + OFFSET_SIGUIENTE], r12
		jmp 	fin2
		
	.fin1
		mov 	[rax + OFFSET_SIGUIENTE], NULL
		
	.fin2
		mov 	[rbx + OFFSET_SIGUIENTE], rax
		
		pop	rbp
		ret
	
	
	; void filtrarAltaLista( lista *l, bool (*funcCompararPalabra)(char*,char*), char *palabraCmp ); [35]
	filtrarPalabra:
		; COMPLETAR AQUI EL CODIGO
		
		push 	rbp
		mov 	rbp, rsp
		
		cmp 	[rdi + OFFSET_LISTA], NULL
		je	fin
		lea 	rbx, [rdi + OFFSET_LISTA]
		
	.ciclo
		
		;Uso la funcion para comparar
		
		cmp 	rax, TRUE		;Si da True tengo q eliminar
		jne 	iterar
	.eliminar
		
		
		call 	nodoBorrar		;primero chequear si era null y guardar siguiente.
		
		
	.iterar
		cmp 	[rbx + OFFSET_SIGUIENTE], NULL
		jmp	fin
		lea 	rbx, [rbx + OFFSET_SIGUIENTE]
		jmp 	ciclo
		
		
	.fin
		pop 	rbp
		ret
		

	; void descifrarMensajeDiabolico( lista *l, char *archivo, void (*funcImpPbr)(char*,FILE* ) ); [45]
	descifrarMensajeDiabolico:
		; COMPLETAR AQUI EL CODIGO
