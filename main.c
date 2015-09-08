#include "lista.h"
#include <stdio.h>

//void f( char* s ){}

int main (void){
	// COMPLETAR AQUI EL CODIGO

	//Calcular la longitud de una palabra
/*
	printf( "la longitud de 'hola' es = %d \n", palabraLongitud( "hola" ) );

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
/*
	char *unaPalabra = palabraCopiar( "hola" );
	char *otraPalabra = palabraCopiar( unaPalabra );
	unaPalabra[1] = 'X';
	palabraImprimir( unaPalabra, stdout );
	palabraImprimir( otraPalabra, stdout );
	free( unaPalabra );
	free( otraPalabra );
*/


	//Crear un nodo y borrarlo
/*
	nodo *miNodo = nodoCrear( palabraCopiar( "algunaPalabra" ) );
	nodoBorrar( miNodo );	
	printf( "Palabra del Nodo: %s\n", miNodo->palabra );
	lista *miLista = oracionCrear();
	insertarAtras( miLista, palabraCopiar( "pala" ) );
	insertarAtras( miLista, palabraCopiar( "palaa1" ) );
	insertarAtras( miLista, palabraCopiar( "pala" ) );
	insertarAtras( miLista, palabraCopiar( "palara1" ) );
	oracionImprimir( miLista, "salida.txt", palabraImprimir );		
	printf( "LongMedia = %2.5f\n", longitudMedia( miLista ) );
	oracionBorrar( miLista );
	lista *miLista = oracionCrear();
	insertarAtras( miLista, palabraCopiar( "palabra1" ) );
	printf( "LongMedia = %2.5f\n", longitudMedia( miLista ) );
	lista *miLista = oracionCrear();
	char* p= palabraCopiar ( "palabra1" );
	insertarOrdenado( miLista, p, palabraMenor );
	oracionImprimir( miLista, "salida.txt", palabraImprimir );
	oracionBorrar( miLista );

	lista *miLista = oracionCrear();
	oracionImprimir( miLista, "salida.txt", palabraImprimir );
	descifrarMensajeDiabolico( miLista, "salida.txt", palabraImprimir );

	insertarOrdenado( miLista, palabraCopiar( "z" ), palabraMenor );


	insertarOrdenado( miLista, palabraCopiar( "palabra1" ), palabraMenor );
	insertarOrdenado( miLista, palabraCopiar( "pala" ), palabraMenor );
	insertarOrdenado( miLista, palabraCopiar( "palaa1" ), palabraMenor );
	insertarOrdenado( miLista, palabraCopiar( "pala" ), palabraMenor );
	insertarOrdenado( miLista, palabraCopiar( "palara1" ), palabraMenor );
	oracionImprimir( miLista, "salida.txt", palabraImprimir );

	descifrarMensajeDiabolico( miLista, "salida.txt", palabraImprimir );

*/

	lista *miLista = oracionCrear();
	insertarOrdenado( miLista, palabraCopiar( "palabra1" ), palabraMenor );
//	insertarOrdenado( miLista, palabraCopiar( "palabra2" ), palabraMenor );
//	insertarOrdenado( miLista, palabraCopiar( "palabra3" ), palabraMenor );
	oracionImprimir( miLista, "salida.txt", palabraImprimir );
	filtrarPalabra( miLista, palabraMenor, "a" );
	oracionImprimir( miLista, "salida.txt", palabraImprimir );

/*
	oracionImprimir( miLista, "salida.txt", palabraImprimir );
	filtrarPalabra( miLista, palabraIgual, "palabra1" );
	oracionImprimir( miLista, "salida.txt", palabraImprimir );

	printf( "LongMedia = %2.5f\n", longitudMedia( miLista ) );
	
	filtrarPalabra( miLista, palabraMenor, "y" );
	oracionImprimir( miLista, "salida.txt", palabraImprimir );
*/

	return 0;
}
