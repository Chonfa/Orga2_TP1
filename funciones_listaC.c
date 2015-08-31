nodo *nodoCrear( char *palabra ){
    res = malloc(size_nodo);
    return res;
}


void  nodoBorrar( nodo *nodo ) {
  free nodo;
}

lista *oracionCrear( void ){
  res = malloc(size_lista);
  return res;
}

void oracioBorrar( lista *l ){
  int a = 0;
  if(l.primero != NULL){
    while (l->primero != NULL ) {
      if(l->primero.siguiente != NULL ){
        a = l.primero;
        l.primero = l->primero.siguiente
        free(a);
      }else{
        free(l.primero);
      }
    }
  }else{
    free(l);
  }
}

void oracionImprimir( lista *l, char *archivo, void (*funcImprimirPalabra) (char*, file*)){

}


float longitudMedia( lista *l){
  in a = 0;
  float prom = 0;
  if(primero != NULL){
    a = l.primero;
    while(a != NULL){
      prom += palabraLongitud(a);
    }
  }
  return prom;
}

void insertarOrdenado( lista *l, char *palabra, bool (*funcCompararPalabra)(char*, char*)){
  int a = l.primero;
  nodo nuevo = nodoCrear(palabra);
  if (l.primero != NULL){
    if (funcCompararPalabra(a.palabra, palabra)){
      l.primero = nuevo;
      nuevo.siguiente = a;
    }else{
      while () {

      }

    }
  }
}

void filtrarPalabra( lista *l, bool (*funcCompararPalabra)(char*, char*), char *palabraCmp){
  if(l.primero != NULL){
    int a = l.primero;
    while(a != NULL){
      if(funcImpPbr(a.palabra, palabraCmp)){
        b = a;
        nodoBorrar(b);
      }
      a = a->siguiente;
    }
  }
}

void descifrarMensajeDiabolico( lista *l, char *archivo, void (*funcImpPbr)(char*, FILE*)){


}
