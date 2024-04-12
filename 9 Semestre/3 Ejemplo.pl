% Caso base: Si ambas cadenas est�n vac�as, la distancia de Hamming es cero.
distanciaH('', '', 0).

% Si una de las cadenas est� vac�a y la otra no, la distancia de Hamming es la longitud de la cadena no vac�a.
distanciaH('', Cadena2, Largo) :- atom_length(Cadena2, Largo).

distanciaH(Cadena1, '', Largo) :- atom_length(Cadena1, Largo).

% Si ambas cadenas no est�n vac�as, calculamos la distancia de Hamming de forma recursiva.
distanciaH(Cadena1, Cadena2, Distancia) :-
    atom_chars(Cadena1, Lista1), % Convertimos la primera cadena en una lista de caracteres
    atom_chars(Cadena2, Lista2), % Convertimos la segunda cadena en una lista de caracteres
    distanciaH(Lista1, Lista2, Distancia). % Llamada al predicado auxiliar

% Predicado auxiliar que calcula la distancia de Hamming entre dos listas de caracteres
distanciaH([], [], 0). % Caso base: ambas listas son vac�as

distanciaH([X|Xs], [Y|Ys], Distancia) :-
    X \= Y, % Si los caracteres en la misma posici�n son diferentes, sumamos 1 a la distancia
    distanciaH(Xs, Ys, Resto), % Llamada recursiva para el resto de las listas
    Distancia is Resto + 1.

distanciaH([X|Xs], [Y|Ys], Distancia) :-
    X = Y, % Si los caracteres en la misma posici�n son iguales, no incrementamos la distancia
    distanciaH(Xs, Ys, Distancia). % Llamada recursiva para el resto de las listas

% Ejemplos de uso
ejemplo1 :-
    distanciaH("romano", "comino", X),
    writeln(X).

ejemplo2 :-
    distanciaH("romano", "camino", X),
    writeln(X).

ejemplo3 :-
    distanciaH("roma", "comino", X),
    writeln(X).

ejemplo4 :-
    distanciaH("romano", "ron", X),
    writeln(X).

ejemplo5 :-
    distanciaH("romano", "cama", X),
    writeln(X).
