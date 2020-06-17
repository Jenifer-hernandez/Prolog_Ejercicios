% Hernandez Silverio Jenifer
% Mauricio Trejo Cecilia

% Desarrollo una gramatica bnf (como la del video) para validar una
% direccion ipv4 asi como una mascara de red.
% https://es.wikipedia.org/wiki/M%C3%A1scara_de_red#Tabla_de_m%C3%A1scaras_de_red
% Realice la implementacion de dicha gramatica en prolog donde
% se pueda validar la cadena donde esta esa ip o mascara ejemplo

% ip("192.168.1.1").
% true.
% ip("256.168.1.1").
% false.
% maskR("255.255.255.0").
% true.
% maskR("255.255.255.1").
% false.

latom_lstring([], []).
latom_lstring([F|C],R) :- latom_lstring(C,S), atom_string(F,SF), append([SF],S,R).
preparar_string(Term, LS) :-
		atom(Term),
		atom_string(Term,Str),
		preparar_string(Str,LS).

preparar_string(Str,LS) :-
		string(Str),
		string_chars(Str,LAC),
		latom_lstring(LAC, LS).

% Numeros decimales validos para las mascaras de red
mask(N) :-
		N == "128"; N == "192"; N == "224";
		N == "240"; N == "248"; N == "252";
		N == "254"; N == "255".

mask1(N) :-    N == "0".
% Digitos para direccion ip
num_ip(N) :-
		N == "0"; N == "1"; N == "2";
		N == "3"; N == "4"; N == "5";
		N == "6"; N == "7"; N == "8"; N == "9".

div_mask([F|[]]) :- mask1(F).
div_mask([F|C]) :- mask1(F), div_mask(C).

divide_mask([F|[]]) :-
		mask(F);
		 mask1(F).


divide_mask([F|C]) :-
		 mask(F), divide_mask(C);
		 mask1(F), div_mask(C).
		

ip_address([B|[]]) :- num_ip(B).
ip_address([B|C]) :- num_ip(B),ip_address(C).

divide_ip([F|[]]) :-  number_codes(N, F), N < 256, preparar_string(F,LS), ip_address(LS).

divide_ip([F|A]) :- number_codes(N, F), N < 256, preparar_string(F,LS),ip_address(LS), divide_ip(A).

ip(IP) :- split_string(IP, ".", ".", D), divide_ip(D).
maskR(M) :- split_string(M, ".", ",", L), divide_mask(L).