# IA1-proyecto1

Primer proyecto del curso de inteligencia artificial 1

## [Problema 1](problema1.pl)

### Hechos

**pareja(persona1, persona2)**: Indica que la persona 1 es pareja de la persona 2.

**padre(persona1, persona2)**: Indica que la persona 1 es padre de la persona 2.

**madre(persona1, persona2)**: Indica que la persona 1 es madre de la persona 2.

**hijo(persona1, persona2)**: Indica que la persona 1 es hijo de la persona 2.

**hermano(persona1, persona2)**: Indica que la persona 1 es hermano de la persona 2.

**hermana(persona1, persona2)**: Indica que la persona 1 es hermana de la persona 2.

### Reglas

**es_tio(persona1, persona2)**: Indica que la persona 1 es tio/tia de la persona 2.

```pl
es_tio(A, C):- (hermano(A, B);hermana(A, B)), hijo(C, B).
```

**es_primo(persona1, persona2)**: Indica que la persona 1 es primo/prima de la persona 2.

```pl
es_primo(A, B):- (hermano(C, D); hermano(D, C); hermana(C, D); hermana(D, C)), hijo(A, C), hijo(B, D).
```

**es_sobrino(persona1, persona2)**: Indica que la persona 1 es sobrino/sobrina de la persona 2.

```pl
es_sobrino(A, B):- es_tio(B, A); es_tia(B, A).
```

**es_culpable(persona)**: Indica el culpable del asesinato de Marta.

```pl
es_culpable(A):- hermana(C, A), pareja(marta, bruce), es_primo(C, clark), es_tio(barry, C).
```

**imprimir_arbol(persona)**: Devuelve el arbol apartir de la persona seleccionada.

```pl
imprimir_hijos([]):- nl.
imprimir_hijos([A|B]):- write(' -> '), write(A), imprimir_hijos(B).

imprimir_descendientes([]):- nl.
imprimir_descendientes([A|B]):- imprimir_arbol(A), imprimir_descendientes(B).

imprimir_arbol(X):-
  (
    pareja(X, Y) ->
    write(X), write(' *--* '), write(Y), nl
    ;
    write(X)
  ),
  (
    hijo([HijoActual|SiguientesHijos], X) ->
    write(X), write(' -> '), write(HijoActual),
    imprimir_hijos(SiguientesHijos),
    nl,
    nl,
    imprimir_arbol(HijoActual),
    imprimir_descendientes(SiguientesHijos),
    nl
    ;
    nl
  ).
imprimir_arbol(_):- imprimir_arbol(bruce).
```

### Modo de uso de reglas

Importar archivo en prolog.
```
consult('problema1.pl').
```

#### imprimir_arbol

```pl
imprimir_arbol(_).
```

**Salida**:

```java
marta *--* bruce // pareja
marta -> barry -> rachel -> diana -> may // madre/padre -> lista de hijos


barry *--* pepper // pareja
barry -> lara -> tony // madre/padre -> lista de hijos


lara // persona, sin pareja e hijos
tony // persona, sin pareja e hijos


rachel *--* enrique // pareja
rachel -> clark -> lois // madre/padre -> lista de hijos


clark // persona, sin pareja e hijos
lois  // persona, sin pareja e hijos


diana *--* peter // pareja
diana -> mary -> harry // madre/padre -> lista de hijos


mary  // persona, sin pareja e hijos
harry // persona, sin pareja e hijos


may *--* ben // pareja
may -> ezio -> lorenzo -> sergio // madre/padre -> lista de hijos


ezio    // persona, sin pareja e hijos
lorenzo // persona, sin pareja e hijos
sergio  // persona, sin pareja e hijos
```

#### es_culpable

```pl
?. es_culpable(X).

X = harry.

```

## [Problema 2](problema2.pl)

```pl

```

## [Problema 3](problema3.pl)

Reglas para realizar operaciones con listas.

### Reglas

**reverso**: Invierte una lista.

```pl
reverso(Lista, Resultado) :-
  reverso(Lista, [], Resultado).

reverso([], ListaInvertida, ListaInvertida).

reverso([Cabeza|Cola], RestoCola, ListaInvertida) :-
  reverso(Cola, [Cabeza|RestoCola], ListaInvertida).
```

**es_palindroma**: Verifica que una lista es palindroma.

```pl
es_palindroma(Lista) :-
  reverso(Lista, Lista).
```

**duplicar**: Duplicar la lista ([a,b,c] ->[aa,bb,cc]).

```pl
duplicar([],[]).
duplicar([Cabeza|Cola],[Concat|ColaResultado]) :-
  atom_concat(Cabeza, Cabeza, Concat),
  duplicar(Cola,ColaResultado).
```

**dividir**: Divide la lista en dos y retornar las dos listas resultantes (Si la lista es par retorna 2 listas de igual tamaño, si no 2 de diferente tamaño).

```pl
dividir([], [], []).
dividir([X], [X], []).
dividir([X, Y|RestoLista], [X|ListaPrimeraMitad], [Y|ListaSegundaMitad]) :-
  dividir(RestoLista, ListaPrimeraMitad, ListaSegundaMitad).
```

**insertar**: Insertar un elemento en una posición X de dicha lista.

```pl
insertar([], ElementoNuevo, [ElementoNuevo]).
insertar([Cabeza|RestoLista], ElementoNuevo, [ElementoNuevo, Cabeza|RestoLista]) :-
  ElementoNuevo @< Cabeza, !.
insertar([Cabeza|RestoLista1], ElementoNuevo, [Cabeza|RestoLista2]) :-
  insertar(RestoLista1, ElementoNuevo, RestoLista2).
```

```pl
consult('problema3.pl').
reverso([1, 2, 3, 4], X).
```

## [Problema 4](problema4.pl)<a name="problema4"></a>

```pl
consult('problema4.pl').
sudoku([[4, _, _, _],[_, 3, _, _],[_, _, 1, _],[_, 1, _, 2]]).
sudoku([[3, _, 4, _],[_, 1, _, 2],[_, 4, _, 3],[2, _, 1, _]]).
```
