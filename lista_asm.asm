EXTERN 		malloc
EXTERN 		free
EXTERN 		printf
EXTERN 		fprintf
EXTERN 		fopen
EXTERN 		fclose

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

	string: 		db "%s", 10, 0
	stringVacia: 	db "<oracionVacia>", 10, 0
	stringNull:		db "<sinMensajeDiabolico>", 10, 0 
	app:			db "a", 0 

section .text


;/** FUNCIONES DE PALABRAS **/
;-----------------------------------------------------------

	; unsigned char palabraLongitud( char *p ); [15]
	palabraLongitud:

		push	rbp
		mov		rbp, rsp
		xor 	rax, rax			 ;al parte baja rax
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

		xor 	rcx, rcx
		mov 	r8, rdi
		mov 	rdi, rsi
		mov 	rsi, string
		mov 	rdx, r8

		xor 	rax, rax
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
		push 	r14

		push 	r12
		push 	r13
		sub 	rsp, 8

		xor 	r12, r12
		xor 	r13, r13
		xor 	r14, r14

		mov 	r12, rdi

		call 	palabraLongitud

		mov 	r15b, al						;Guardo la longitud en r15b(No se modifica)	
		xor 	rdi, rdi
		inc 	rax
		mov 	dil, al					

		call 	malloc
		xor 	rcx, rcx

		mov 	cl, r15b						;Guardo la longitud en cl(para el loop)
		inc 	cl								;Incremento en 1 para q copie el "0"	
		mov 	r14, rax						;Preservo el puntero que voy a devolver


	.ciclo:
		mov 	r13b, [r12]						;Guardo la letra
		mov 	[r14], r13b						;Copio la letra a destino
		inc 	r14								;Incremento ambos punteros
		inc 	r12
		loop 	.ciclo


		add 	rsp, 8
		pop 	r13
		pop 	r12

		pop 	r14
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

		mov 	qword [rax + OFFSET_SIGUIENTE], NULL
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


		mov 	rbx, rdi

		mov 	rdi, [rdi + OFFSET_PALABRA]
		call 	free

		mov 	rdi, rbx
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

		mov 	qword [rax + OFFSET_PRIMERO], NULL

		pop 	rbp
		ret
		

	; void oracionBorrar( lista *l ); [20]
	oracionBorrar:
		; COMPLETAR AQUI EL CODIGO

		;Chequear tamaño de registros y si se preservan

		push 	rbp
		mov 	rbp, rsp
		push 	r11
		push 	r12
		push 	r13
		push 	r14
		sub 	rsp, 8

		mov 	r12, rdi			;Guarda el puntero a l
		cmp 	qword [r12 + OFFSET_PRIMERO], NULL
		je 		.fin	
		mov 	r13, [r12 + OFFSET_PRIMERO]

	.ciclo:

		cmp 	qword [r13 + OFFSET_SIGUIENTE], NULL		;lo puedo mover abajo y me ahorro 1 llamado
		je 		.fin2 	
		mov 	r14, r13				;podria ser mov rdi, r13
		mov 	r13, [r13 + OFFSET_SIGUIENTE]
		mov 	rdi, r14				;no seria necesario
		call 	nodoBorrar
		jmp 	.ciclo

	.fin2: 
		mov 	rdi, r13
		call 	nodoBorrar

	.fin:	
		mov 	rdi, r12
		call 	free

		add 	rsp, 8
		pop 	r14
		pop 	r13
		pop 	r12
		pop 	r11
		pop 	rbp	
		ret

	; void oracionImprimir( lista *l, char *archivo, void (*funcImprimirPalabra)(char*,FILE*) ); [35]
	oracionImprimir:

		push 	rbp
		mov 	rbp, rsp
		push 	rbx
		push 	r12
		push 	r13
		push 	r14

		mov 	r12, rdi
		mov 	r13, rsi
		mov 	r14, rdx

		mov 	rdi, r13
		mov 	rsi, app
		call 	fopen
		mov 	rbx, rax

		cmp 	qword [r12 + OFFSET_PRIMERO], NULL
		je		.finNULL

		mov 	r12, [r12 + OFFSET_PRIMERO]

	.ciclo:

		mov 	rdi, [r12 + OFFSET_PALABRA]
		mov 	rsi, rbx

		call 	palabraImprimir

		cmp 	qword [r12 + OFFSET_SIGUIENTE], NULL
		je 		.fin
		mov 	r12, [r12 + OFFSET_SIGUIENTE]
		jne 	.ciclo

	

	.finNULL:

		mov 	rdi, rbx
		mov 	rsi, string
		mov 	rdx, stringVacia

		call 	printf


	.fin:
		mov 	rdi, rbx
		call 	fclose

		pop 	r14
		pop 	r13
		pop 	r12
		pop 	rbx
		pop 	rbp 

		ret





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
		push 	r12
		push 	r13

		mov 	rbx, rdi
		xor 	r12, r12
		xor 	r13, r13		;en r12 vamos a guardar la longitudMedia, tengo q ver q el call no la cambie
		
		cmp 	qword [rbx + OFFSET_PRIMERO], NULL
		je		.fin			;Chequear que devuelva 0 si no hay nada
		
		mov 	rbx, [rbx + OFFSET_PRIMERO]

	.ciclo:
		inc 	r13				;Contador de cantidad de palabras
		mov 	rdi, [rbx + OFFSET_PALABRA]
		call 	palabraLongitud
		
		add 	r12, rax
		
		cmp 	qword [rbx + OFFSET_SIGUIENTE], NULL
		je		.fin
		
		mov 	rbx, [rbx + OFFSET_SIGUIENTE]
		jmp 	.ciclo
		
	.fin:	


		cvtsi2ss xmm0, r12
		cvtsi2ss xmm1, r13
		divps 	xmm0, xmm1

		pop 	r13
		pop 	r12
		add 	rsp, 8
		pop 	rbx
		pop 	rbp
		ret


	; void insertarOrdenado( lista *l, char *palabra, bool (*funcCompararPalabra)(char*,char*) ); [35]
	insertarOrdenado:
		; COMPLETAR AQUI EL CODIGO


		push 	rbp
		mov 	rbp, rsp
		push 	r12
		push 	r13
		push 	r14
		push 	r15


		mov 	r12, rsi
		cmp 	qword [rdi + OFFSET_PRIMERO], NULL
		mov 	rbx, rdi
		je		.insertarAtras

		mov 	r15, rdx
	
		mov 	r13, [rdi + OFFSET_PRIMERO]

		;r13=ant
		;r14=sig

	.comparacionPrimero:

		mov 	rdi, r13
		mov 	rsi, r12
		call 	r15
		cmp 	rax, TRUE 



	.ciclo:
		cmp 	r13, NULL
		je 		.insertar
		
		mov 	r14, [r13 + OFFSET_SIGUIENTE]
		cmp 	r14, NULL
		je 		.insertarAtras

		mov 	rdi, [r14 + OFFSET_PALABRA]
		mov 	rsi, r12
		call 	r15
		
		cmp 	rax, TRUE
		je 		.insertar 
		mov 	r13, [r13 + OFFSET_SIGUIENTE]
		jmp 	.ciclo		



	.insertar:
		mov 	rdi, r12
		call 	nodoCrear
		mov 	[rax + OFFSET_SIGUIENTE], r14
		mov 	[r13 + OFFSET_SIGUIENTE], rax
		jmp     .fin

	.insertarAtras:
		mov 	rdi, rbx
		mov 	rsi, r12
		call 	insertarAtras
		jmp 	.fin

	.insertarAdelante:
		mov 	rdi, r12
		call 	nodoCrear
		mov 	r12, [rbx + OFFSET_PRIMERO]
		mov 	[rax + OFFSET_SIGUIENTE], r12
		mov 	[rbx + OFFSET_PRIMERO], rax

	.fin:
		pop 	r15	
		pop 	r14
		pop 	r13
		pop 	r12
		pop 	rbp
		ret



	; void filtrarAltaLista( lista *l, bool (*funcCompararPalabra)(char*,char*), char *palabraCmp ); [35]
	filtrarPalabra:
		; COMPLETAR AQUI EL CODIGO

		push 	rbp
		mov 	rbp, rsp
		push 	r12
		push 	r13
		push 	r14
		push 	r15


		mov 	r12, rdx
		cmp 	qword [rdi + OFFSET_PRIMERO], NULL
		je		.fin

		mov 	r15, rsi
		mov 	r13, rdi
		mov 	r13, [r13 + OFFSET_PRIMERO]

	.ciclo:
		cmp 	r13, NULL
		je 		.fin
		mov 	rdi, [r13 + OFFSET_PALABRA]
		mov 	rsi, r12
		call 	r15
		mov 	r14, r13
		mov 	r13, [r13 + OFFSET_SIGUIENTE]
		cmp 	rax, TRUE		
		jne 	.ciclo

		mov 	rdi, r14
		call 	nodoBorrar
		jmp 	.ciclo



	.fin:

		pop 	r15
		pop 	r14
		pop 	r13
		pop 	r12
		pop 	rbp
		ret





















	; void descifrarMensajeDiabolico( lista *l, char *archivo, void (*funcImpPbr)(char*,FILE* ) ); [45]
	descifrarMensajeDiabolico:

		push 	rbp
		mov 	rbp, rsp
		xor 	r12, r12

		mov 	rdi, rsi
		call 	fopen
		mov 	r15, rax


		cmp 	qword [rdi + OFFSET_PRIMERO], NULL
		je		.mensajeNULL

		mov 	r8, [rdi + OFFSET_PRIMERO]			



	.guardado:

		mov 	r8, [r8 + OFFSET_PALABRA]
		push 	r8
		inc 	r12
		cmp 	qword [r8 + OFFSET_SIGUIENTE], NULL
		jne		.guardado

	.imprimir:


		mov 	rsi, rdx
		pop 	rdi
		mov 	rsi, r15
		call 	palabraImprimir
		dec 	r12
		cmp 	r12, 0
		jne 	.imprimir
		jmp 	.fin

	.mensajeNULL:

								;pongo el mensajeNULL y lo imprimo
	;	mov 	rdi, 
		mov 	rsi, string
		mov 	rdx, stringNull

		call 	printf

	.fin:


		pop 	rbp
		ret
