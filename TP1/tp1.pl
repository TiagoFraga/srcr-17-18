%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% SIST. REPR. CONHECIMENTO E RACIOCINIO - MiEI/3

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% TP1

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% SICStus PROLOG: Declaracoes iniciais

:- set_prolog_flag( discontiguous_warnings,off ).
:- set_prolog_flag( single_var_warnings,off ).
:- set_prolog_flag( unknown,fail ).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% SICStus PROLOG: definicoes iniciais

:- op( 900,xfy,'::' ).
:- dynamic utente/4.
:- dynamic prestador/4.
:- dynamic cuidado/5.
solucoes(T,Q,S) :- findall(T,Q,S).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado utente: IdUt, Nome, Idade, Morada -> {V,F}


%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado prestador: IdPrest, Nome, Espcialidade, Instituição -> {V,F}


%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado cuidado: Data, IdUt, IdPrest, Descrição, Custo -> {V,F}









%--------------------------------- - - - - - - - - - -  -  -  -  -   -
%--------------------------------- - - - - - - - - - -  -  -  -  -   -
%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Primeiro ponto
%--------------------------------- - - - - - - - - - -  -  -  -  -   -
%--------------------------------- - - - - - - - - - -  -  -  -  -   -
%--------------------------------- - - - - - - - - - -  -  -  -  -   -



% Invariante Estrutural:  nao permitir a insercao de conhecimento repetido
% Pode estar repetido de duas formas :
%								1- Pelo ID.
%								2- Pelo Nome.


+utente(ID,N,I,M) :: (solucoes( (ID), (utente(ID,Ns,Is,Ms)),S), comprimento(S,N), N==1).
+utente(ID,N,I,M) :: (solucoes( (N),(utente(IDs,N,Is,Ms)),S), comprimento(S,N),N==1).


% Invariante Estrutural:  nao permitir a insercao de conhecimento repetido
% Pode estar repetido de duas formas :
%								1- Pelo ID.
%								2- Pelo Nome.

+prestador(ID,N,E,I) :: (solucoes( (ID), (prestador(ID,Ns,Es,Is)), S),comprimento(S,N),N==1).
+prestador(ID,N,E,I) :: (solucoes( (N), (prestador(IDs,N,Es,Is)), S),comprimento(S,N),N==1).

% Invariante Estrutural:  nao permitir a insercao de conhecimento repetido
% Pode estar repetido, quando se verifica em simultaneo igualdades na:
%								1- Data
%								2- Id utente
%								3- Id Prestador

+cuidado(Dt,IDU,IDP,D,C) :: (solucoes( (Dt,IDU,IDP),(cuidado(Dt,IDU,IDP,Ds,Cs)),S),comprimento(S,N),N==1).

% Invareiante Referencial: nao permitir a insercao de conhecimento, por falta de conhecimento.
% Nao se insere o conhecimento quando nao há conhecimento de:
%								1- Utente;
%								2- Prestador;

+cuidado(Dt,IDU,IDP,D,C) :: (solucoes( (IDU),(utente(IDU,Ns,Is,Ms)),S)),comprimento(S,N),N==0).
+cuidado(Dt,IDU,IDP,D,C) :: (solucoes( (IDP),(prestador(IDP,Ns,Es,Is)),S)),comprimento(S,N),N==0).

%---------------------------------

insercao(T) :- assert(T).
insercao(T) :- retract(T),!,fail.

teste([]).
teste([I|L]) :- I, teste(L).

comprimento([],0).
comprimento([X|L],R) :- comprimento(L,N) , R is 1+N.

registar( Termo ) :-
	solucoes( Invariante,+Termo::Invariante,Lista), 
				insercao(Termo), 
					teste(Lista).







%--------------------------------- - - - - - - - - - -  -  -  -  -   -
%--------------------------------- - - - - - - - - - -  -  -  -  -   -
%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Segundo ponto
%--------------------------------- - - - - - - - - - -  -  -  -  -   -
%--------------------------------- - - - - - - - - - -  -  -  -  -   -
%--------------------------------- - - - - - - - - - -  -  -  -  -   -

% Invariante Estrutural:  nao permitir a remoção de conhecimento
% Nao se pode remover conhecimento de utente quando:
%						1- Ha conhecimento de utente nos cuidados.

-utente(ID,N,I,M) :: (solucoes( (ID), (cuidado(Dts,ID,IDPs,Ds,Cs)) , S),comprimento(S,N),N>0).

% Invariante Estrutural:  nao permitir a remoção de conhecimento
% Nao se pode remover conhecimento de prestador quando:
%						1- Ha conhecimento de prestador nos cuidados.

-prestador(ID,N,E,I) :: (solucoes( (ID), (cuidado(Dts,IDUs,ID,Ds,Cs)), S),comprimento(S,N),N==0).

% Invariante Estrutural:  nao permitir a remoção de conhecimento
% Nao se pode remover conhecimento de cuidado quando:
%						1- Nao ha esse conhecimento de cuidado

-cuidado(Dt,IDU,IDP,D,C) :: (solucoes( (Dt,IDU,IDP,D,C), (cuidado(Dt,IDU,IDP,D,C)) ,S),comprimento(S,N), N==0).


%---------------------------------

remocao(T) :- retract(T).
remocao(T) :- assert(T),!,fail.

remover( Termo ) :-
	solucoes( Invariante,+Termo::Invariante,Lista), 
				remocao(Termo), 
					teste(Lista).





%--------------------------------- - - - - - - - - - -  -  -  -  -   -
%--------------------------------- - - - - - - - - - -  -  -  -  -   -
%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Terceiro ponto
%--------------------------------- - - - - - - - - - -  -  -  -  -   -
%--------------------------------- - - - - - - - - - -  -  -  -  -   -
%--------------------------------- - - - - - - - - - -  -  -  -  -   -

selecionar(ids,R) :- solucoes((ID),utente(IDs,Ns,Is,Ms),R).
selecionar(nomes,R) :- solucoes((N),utente(IDs,N,Is,Ms),R).
selecionar(idades,R) :- solucoes((I),utente(IDs,Ns,I,Ms),R).
selecionar(moradas,R) :- solucoes((M),utente(IDs,Ns,Is,M),R).


%--------------------------------- - - - - - - - - - -  -  -  -  -   -
%--------------------------------- - - - - - - - - - -  -  -  -  -   -
%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Quarto ponto
%--------------------------------- - - - - - - - - - -  -  -  -  -   -
%--------------------------------- - - - - - - - - - -  -  -  -  -   -
%--------------------------------- - - - - - - - - - -  -  -  -  -   -


instituicoes(inst,R) :- (solucoes((I),prestador(IDs,Ns,Es,Is),R).


%--------------------------------- - - - - - - - - - -  -  -  -  -   -
%--------------------------------- - - - - - - - - - -  -  -  -  -   -
%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Quinto ponto
%--------------------------------- - - - - - - - - - -  -  -  -  -   -
%--------------------------------- - - - - - - - - - -  -  -  -  -   -
%--------------------------------- - - - - - - - - - -  -  -  -  -   -





%--------------------------------- - - - - - - - - - -  -  -  -  -   -
%--------------------------------- - - - - - - - - - -  -  -  -  -   -
%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Sexto ponto
%--------------------------------- - - - - - - - - - -  -  -  -  -   -
%--------------------------------- - - - - - - - - - -  -  -  -  -   -
%--------------------------------- - - - - - - - - - -  -  -  -  -   -



%--------------------------------- - - - - - - - - - -  -  -  -  -   -
%--------------------------------- - - - - - - - - - -  -  -  -  -   -
%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Setimo ponto
%--------------------------------- - - - - - - - - - -  -  -  -  -   -
%--------------------------------- - - - - - - - - - -  -  -  -  -   -
%--------------------------------- - - - - - - - - - -  -  -  -  -   -



%--------------------------------- - - - - - - - - - -  -  -  -  -   -
%--------------------------------- - - - - - - - - - -  -  -  -  -   -
%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Oitavo ponto
%--------------------------------- - - - - - - - - - -  -  -  -  -   -
%--------------------------------- - - - - - - - - - -  -  -  -  -   -
%--------------------------------- - - - - - - - - - -  -  -  -  -   -


%--------------------------------- - - - - - - - - - -  -  -  -  -   -
%--------------------------------- - - - - - - - - - -  -  -  -  -   -
%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Nono ponto
%--------------------------------- - - - - - - - - - -  -  -  -  -   -
%--------------------------------- - - - - - - - - - -  -  -  -  -   -
%--------------------------------- - - - - - - - - - -  -  -  -  -   -


























