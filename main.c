#include "lista.h"
#include <stdio.h>

int main (void){
	// COMPLETAR AQUI EL CODIGO

	printf( "la longitud de ’hola’ es = %d \n", palabraLongitud( "hola" ) );


	if( palabraMenor( "merced", "mercurio" ) )
		printf( "TRUE\n" ); else printf( "FALSE\n" );



	nodo *miNodo = nodoCrear( palabraCopiar( "algunaPalabra" ) );

	nodoBorrar( miNodo );	
	

	return 0;
}
