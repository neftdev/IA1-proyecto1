%Hechos

%ABUELOS
pareja(lamar,analucia).
pareja(analucia,lamar).

pareja(feliciano,ruth).
pareja(ruth,feliciano).

pareja(diana,pedro).
pareja(pedro,diana).

pareja(jonas,soledad).
pareja(soledad,jonas).

%PADRES
padre(lamar,pedro).
padre(lamar,ruth).
padre(feliciano,ines).
padre(feliciano,manuel).
padre(pedro,jonas).
padre(jonas,daniel).
padre(jonas,constancia).

madre(analucia,pedro).
madre(analucia,ruth).
madre(ruth,ines).
madre(ruth,manuel).
madre(diana,jonas).
madre(soledad,daniel).
madre(soledad,constancia).


%HIJOS
hijo(pedro,lamar).
hijo(pedro,analucia).
hijo(ruth,lamar).
hijo(ruth,analucia).

hijo(ines,feliciano).
hijo(manuel,feliciano).
hijo(ines,ruth).
hijo(manuel,ruth).

hijo(jonas,pedro).
hijo(jonas,diana).

hijo(daniel,jonas).
hijo(constancia,jonas).
hijo(daniel,soledad).
hijo(constancia,soledad).

%HIJOS PARA IMPRIMIR EN ARBOL
hijo([pedro,ruth],lamar).
hijo([pedro,ruth],analucia).

hijo([ines,manuel],feliciano).
hijo([ines,manuel],ruth).

hijo([jonas],pedro).
hijo([jonas],diana).

hijo([daniel,constancia],jonas).
hijo([daniel,constancia],soledad).

%HEMANOS
hermano(pedro,ruth).
hermano(manuel,ines).
hermano(daniel,constancia).

hermana(ruth,pedro).
hermana(ines,manuel).
hermana(constancia,daniel).

%REGLAS
es_tio(A, C):- (hermano(A, B);hermana(A, B)), hijo(C, B).

es_primo(A, B):- (hermano(C, D); hermano(D, C); hermana(C, D); hermana(D, C)), hijo(A, C), hijo(B, D).

es_sobrino(A, B):- es_tio(B, A).

%reglas_de_imprimir_arbol
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
imprimir_arbol(_):- imprimir_arbol(lamar).
