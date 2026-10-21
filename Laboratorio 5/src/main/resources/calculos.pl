% Reglas de suma y resta en Prolog
suma(A, B, R) :-
    number(A), number(B),
    R is A + B.

resta(A, B, R) :-
    number(A), number(B),
    R is A - B.
