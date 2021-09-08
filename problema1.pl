%hechos

pareja(marta,bruce).
pareja(bruce,marta).
pareja(barry,pepper).
pareja(pepper,barry).
pareja(rachel,enrique).
pareja(enrique,rachel).
pareja(diana,peter).
pareja(peter,diana).
pareja(may,ben).
pareja(ben,may).

padre(bruce, barry).
padre(bruce, rachel).
padre(bruce, diana).
padre(bruce, may).
padre(barry, lara).
padre(barry, tony).
padre(enrique, clark).
padre(enrique, lois).
padre(peter, mary).
padre(peter, harry).
padre(ben, ezio).
padre(ben, lorenzo).
padre(ben, sergio).

madre(marta, barry).
madre(marta, rachel).
madre(marta, diana).
madre(marta, may).
madre(pepper, lara).
madre(pepper, tony).
madre(rachel, clark).
madre(rachel, lois).
madre(diana, mary).
madre(diana, harry).
madre(may, ezio).
madre(may, lorenzo).
madre(may, sergio).

hijo(barry, marta).
hijo(rachel,  marta).
hijo(diana, marta).
hijo(may, marta).
hijo([barry, rachel, diana, may], marta).
hijo(barry, bruce).
hijo(rachel,bruce).
hijo(diana, bruce).
hijo(may, bruce).
hijo([barry, rachel, diana, may], bruce).
hijo(lara, barry).
hijo(tony, barry).
hijo([lara, tony], barry).
hijo([lara, tony], barry).
hijo(lara, pepper).
hijo(tony, pepper).
hijo([lara, tony], pepper).
hijo(clark, rachel).
hijo(lois, rachel).
hijo([clark, lois], rachel).
hijo(clark, enrique).
hijo(lois, enrique).
hijo([clark, lois], enrique).
hijo(mary, diana).
hijo(harry, diana).
hijo([mary, harry], diana).
hijo(mary, peter).
hijo(harry, peter).
hijo([mary, harry], peter).
hijo(ezio, may).
hijo(lorenzo, may).
hijo(sergio, may).
hijo([ezio, lorenzo, sergio], may).
hijo(ezio, ben).
hijo(lorenzo, ben).
hijo(sergio, ben).
hijo([ezio, lorenzo, sergio], ben).

hermano(barry, rachel).
hermano(barry, diana).
hermano(barry, may).
hermano(tony, lara).
hermano(clark, lois).
hermano(harry, mary).
hermano(ezio, lorenzo).
hermano(ezio, sergio).
hermano(lorenzo, ezio).
hermano(lorenzo, sergio).
hermano(sergio, ezio).
hermano(sergio, lorenzo).

hermana(lara, tony).
hermana(lois, clark).
hermana(mary, harry).
hermana(rachel, barry).
hermana(rachel, diana).
hermana(rachel, may).
hermana(diana, barry).
hermana(diana, rachel).
hermana(diana, may).
hermana(may, barry).
hermana(may, rachel).
hermana(may, diana).

%reglas
es_tio(A, C):- (hermano(A, B);hermana(A, B)), hijo(C, B).

es_primo(A, B):- (hermano(C, D); hermano(D, C); hermana(C, D); hermana(D, C)), hijo(A, C), hijo(B, D).

es_sobrino(A, B):- es_tio(B, A).

es_culpable(A):- hermana(C, A), pareja(marta, bruce), es_primo(C, clark), es_tio(barry, C).

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
imprimir_arbol(_):- imprimir_arbol(bruce).
