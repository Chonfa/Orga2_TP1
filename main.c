#include "lista.h"
#include <stdio.h>

void f( char* s ){}

int main (void){
	// COMPLETAR AQUI EL CODIGO

	//Calcular la longitud de una palabra
	printf( "la longitud de 'hola' es = %d \n", palabraLongitud( "hola" ) );

/*
	//Comparar una palabra con otra
	if( palabraMenor( "merced", "mercurio" ) )
		printf( "TRUE\n" ); else printf( "FALSE\n" );


	//Aplicarle formato a una palabra

	char unaPalabra[] = "hola";
	palabraFormatear( unaPalabra, f );

	//Imprimir una Palabra
	palabraImprimir( unaPalabra, stdout );
*/

	//Copiar una palabra

	char *unaPalabra = palabraCopiar( "hola" );
	char *otraPalabra = palabraCopiar( unaPalabra );
	unaPalabra[1] = 'X';
	palabraImprimir( unaPalabra, stdout );
	palabraImprimir( otraPalabra, stdout );
	free( unaPalabra );
	free( otraPalabra );



	//Crear un nodo y borrarlo
	nodo *miNodo = nodoCrear( palabraCopiar( "algunaPalabra" ) );
	nodoBorrar( miNodo );	
	printf( "Palabra del Nodo: %s\n", miNodo->palabra );

	lista *miLista = oracionCrear();
	insertarAtras( miLista, palabraCopiar( "palabra1" ) );
	oracionImprimir( miLista, "salida.txt", palabraImprimir );		//NO TERMINADO
	oracionBorrar( miLista );

//	lista *miLista = oracionCrear();
//	insertarAtras( miLista, palabraCopiar( "palabra1" ) );
//	printf( "LongMedia = %2.5f\n", longitudMedia( miLista ) );


//	lista *miLista = oracionCrear();
//	insertarOrdenado( miLista, palabraCopiar( "palabra1" ), palabraMenor );
//	oracionImprimir( miLista, "salida.txt", palabraImprimir );





	return 0;

}
