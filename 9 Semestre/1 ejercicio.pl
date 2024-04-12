% Caso base: Una lista vacía siempre es subconjunto de cualquier lista.
sub_conjunto([], _).

% Verifica si todos los elementos de la lista L1 están en la lista L2.
sub_conjunto([X|L1], L2) :-
    member(X, L2), % Comprueba si X está en L2
    sub_conjunto(L1, L2). % Verifica el resto de elementos de L1

% Ejemplos de uso
:- initialization(main).

main :-
    sub_conjunto([], [1, 2, 3, 4, 5]),
    sub_conjunto([1, 2, 3], [1, 2, 3, 4, 5]),
    sub_conjunto([1, 2, 6], [1, 2, 3, 4, 5]),
    halt.
