% hechos
numero(1).
numero(2).
numero(3).
numero(4).

% solicitar entrada

sudoku :- write('Ingrese sudoku: '),
  read(S), nl, resolver_sudoku(S).

% Column - C, Row - R
resolver_sudoku([
  [R1C1, R1C2, R1C3, R1C4],
  [R2C1, R2C2, R2C3, R2C4],
  [R3C1, R3C2, R3C3, R3C4],
  [R4C1, R4C2, R4C3, R4C4]
]) :-
  resolver(
    R1C1, R1C2, R1C3, R1C4,
    R2C1, R2C2, R2C3, R2C4,
    R3C1, R3C2, R3C3, R3C4,
    R4C1, R4C2, R4C3, R4C4
  ),
  write('--------------'), nl,
  imprimir_fila(R1C1, R1C2, R1C3, R1C4),
  imprimir_fila(R2C1, R2C2, R2C3, R2C4),
  write('--------------'), nl,
  imprimir_fila(R3C1, R3C2, R3C3, R3C4),
  imprimir_fila(R4C1, R4C2, R4C3, R4C4),
  write('--------------')
  .

imprimir_fila(X, W, Z, Y)
  :- write('|'), write(X),
  write('|'), write(W),
  write('||'), write(Z),
  write('|'), write(Y), write('|'),nl
  .

resolver(
  R1C1, R1C2, R1C3, R1C4,
  R2C1, R2C2, R2C3, R2C4,
  R3C1, R3C2, R3C3, R3C4,
  R4C1, R4C2, R4C3, R4C4
) :-
  diferente(R1C1, R1C2, R1C3, R1C4), % primera fila
  diferente(R2C1, R2C2, R2C3, R2C4), % segunda fila
  diferente(R3C1, R3C2, R3C3, R3C4), % tercera fila
  diferente(R4C1, R4C2, R4C3, R4C4), % cuarta fila
  diferente(R1C1, R2C1, R3C1, R4C1), % primera columna
  diferente(R1C2, R2C2, R3C2, R4C2), % segunda columna
  diferente(R1C3, R2C3, R3C3, R4C3), % tercera columna
  diferente(R1C4, R2C4, R3C4, R4C4), % cuarta columna
  diferente(R1C1, R1C2, R2C1, R2C2), % primer cuadrante
  diferente(R1C3, R1C4, R2C3, R2C4), % segundo cuadrante
  diferente(R3C1, R3C2, R4C1, R4C2), % tercer cuadrante
  diferente(R3C3, R3C4, R4C3, R4C4). % cuarto cuadrante

% verifica que todos los numeros sean diferentes o iguales (\=)
diferente(X, W, Z, Y)
  :-
    numero(X), numero(W), numero(Z), numero(Y),
    X\=W, X\=Z, X\=Y, W\=Z, W\=Y, Z\=Y.
