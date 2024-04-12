% Definición de platos
plato(entrada, guacamole).
plato(entrada, ensalada).
plato(entrada, consome).
plato(entrada, tostadas_caprese).

plato(carne, filete_de_cerdo).
plato(carne, pollo_al_horno).
plato(carne, carne_en_salsa).

plato(pescado, tilapia).
plato(pescado, salmon).
plato(pescado, trucha).

plato(postre, flan).
plato(postre, nueces_con_miel).
plato(postre, naranja_confitada).
plato(postre, flan_de_coco).

% Calorías de los platos
calorias(guacamole, 120).
calorias(ensalada, 90).
calorias(consome, 70).
calorias(tostadas_caprese, 110).

calorias(filete_de_cerdo, 250).
calorias(pollo_al_horno, 200).
calorias(carne_en_salsa, 220).

calorias(tilapia, 180).
calorias(salmon, 230).
calorias(trucha, 190).

calorias(flan, 150).
calorias(nueces_con_miel, 200).
calorias(naranja_confitada, 120).
calorias(flan_de_coco, 180).

% Reglas para platos principales y comidas completas
plato_principal(Plato) :- plato(carne, Plato).
plato_principal(Plato) :- plato(pescado, Plato).

comida_completa(Entrada, PlatoPrincipal, Postre) :-
    plato(entrada, Entrada),
    plato_principal(PlatoPrincipal),
    plato(postre, Postre).
