reverso(Lista, Resultado) :-
  reverso(Lista, [], Resultado).

reverso([], ListaInvertida, ListaInvertida).

reverso([Cabeza|Cola], RestoCola, ListaInvertida) :-
  reverso(Cola, [Cabeza|RestoCola], ListaInvertida).


es_palindroma(Lista) :-
  reverso(Lista, Lista).


duplicar([],[]).
duplicar([Cabeza|Cola],[Concat|ColaResultado]) :-
  atom_concat(Cabeza, Cabeza, Concat),
  duplicar(Cola,ColaResultado).


dividir([], [], []).
dividir([X], [X], []).
dividir([X, Y|RestoLista], [X|ListaPrimeraMitad], [Y|ListaSegundaMitad]) :-
  dividir(RestoLista, ListaPrimeraMitad, ListaSegundaMitad).

insertar([], ElementoNuevo, [ElementoNuevo]).
insertar([Cabeza|RestoLista], ElementoNuevo, [ElementoNuevo, Cabeza|RestoLista]) :-
  ElementoNuevo @< Cabeza, !.
insertar([Cabeza|RestoLista1], ElementoNuevo, [Cabeza|RestoLista2]) :-
  insertar(RestoLista1, ElementoNuevo, RestoLista2).
