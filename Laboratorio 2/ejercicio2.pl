%Ejercicio2 Dado un numero N, sumar N con todos los numeros anteriores
% hasta llegar a 1

%Caso base
sumar_anterior(1,1).

%Caso recursivo
sumar_anterior(X,Y) :-
    X > 1,
    N is X - 1,
    sumar_anterior(N,Y1),
    Y is X + Y1.

