:- consult('hechos.pl').

% ----------------------------------------------------------------------
% Una zona tiene enemigos si aparece alguno ahí o su nivel es alto/medio
% ----------------------------------------------------------------------
zona_con_enemigos(Zona, Momento) :-
    ( enemigo(_, Zona)
    ; nivel_peligro(Zona, Momento, alto)
    ; nivel_peligro(Zona, Momento, medio)
    ).

% ------------------------------------------------------------------
% Zona segura si no tiene enemigos y su nivel no es alto ni medio
% ------------------------------------------------------------------
zona_segura(Zona, Momento) :-
    not(enemigo(_, Zona)),
    not(nivel_peligro(Zona, Momento, alto)),
    not(nivel_peligro(Zona, Momento, medio)).

% ------------------------------------------------------------------
% Zona recomendable si es segura y tiene materiales
% ------------------------------------------------------------------
zona_recomendada(Zona, Momento) :-
    zona_segura(Zona, Momento),
    material_en(_, Zona).

% ------------------------------------------------------------------
% Eric sobrevive si tiene hacha, encendedor y cubre sus necesidades
% ------------------------------------------------------------------
eric_sobrevive :-
    tiene(eric, hacha),
    tiene(eric, encendedor),
    necesita(eric, refugio),
    necesita(eric, comida),
    necesita(eric, agua).

% ------------------------------------------------------------------------
% Un personaje puede construir si es Eric (con hacha) o Kelvin (si se le
% ordena)
% -----------------------------------------------------------------------
%
%

puede_construir(Personaje) :-
    personaje(Personaje),
    ( Personaje = eric, tiene(eric, hacha)
    ; Personaje = kelvin, construye_si_se_ordena(kelvin)
    ).
