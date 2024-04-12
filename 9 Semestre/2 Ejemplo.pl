aplanar([], []).
aplanar([X|Xs], Zs) :-
    aplanar(X, Y),
    aplanar(Xs, Ys),
    append(Y, Ys, Zs).
aplanar(X, [X]) :-
    \+ is_list(X).
