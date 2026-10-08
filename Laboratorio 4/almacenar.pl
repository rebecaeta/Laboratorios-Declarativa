%Caso base
almacenar(0, []).

%Caso recursivo
almacenar(N, [X|Y]) :-
    N > 0,
    X is N mod 10,
    N1 is N // 10,
    almacenar(N1, Y).
