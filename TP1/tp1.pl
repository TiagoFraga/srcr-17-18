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

utente(1,Tiago,23,Esposende).
utente(2,Cesario,21,Valenca).
utente(3,Luis,22,Viana).
utente(4,Gomes,21,VilaReal).
utente(5,Reis,21,PonteLima).
utente(6,Chavez,22,Viana).
utente(7,Neves,22,Viana).
utente(8,Marcos,22,Viana).
utente(9,Sunga,22,Viana).
utente(10,Marcos,22,Viana).
utente(11,Pedro,22,Viana).
utente(12,Rua,22,Montalegre).
utente(13,Antonio,23,Esposende).
utente(14,Pedro,23,Esposende).
utente(15,Miguel,23,Esposende).
utente(16,Brahimi,23,Olival).
utente(17,Marega,23,Olival).
utente(18,Soares,23,Olival).
utente(19,Danilo,23,Olival).
utente(20,Aboubakar,23,Olival).


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

+cuidado(Dt,IDU,IDP,D,C) :: (solucoes( (IDU),(utente(IDU,Ns,Is,Ms)),S),comprimento(S,N),N==0).
+cuidado(Dt,IDU,IDP,D,C) :: (solucoes( (IDP),(prestador(IDP,Ns,Es,Is)),S),comprimento(S,N),N==0).

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

ponto_tres(ids,R) :- solucoes((ID),utente(ID,Ns,Is,Ms),R).
ponto_tres(nomes,R) :- solucoes((N),utente(IDs,N,Is,Ms),R).
ponto_tres(idades,R) :- solucoes((I),utente(IDs,Ns,I,Ms),R).
ponto_tres(moradas,R) :- solucoes((M),utente(IDs,Ns,Is,M),R).




%--------------------------------- - - - - - - - - - -  -  -  -  -   -
%--------------------------------- - - - - - - - - - -  -  -  -  -   -
%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Quarto ponto
%--------------------------------- - - - - - - - - - -  -  -  -  -   -
%--------------------------------- - - - - - - - - - -  -  -  -  -   -
%--------------------------------- - - - - - - - - - -  -  -  -  -   -


ponto_quatro(R) :- solucoes( (I), prestador(IDP,N,E,I) , R).


%--------------------------------- - - - - - - - - - -  -  -  -  -   -
%--------------------------------- - - - - - - - - - -  -  -  -  -   -
%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Quinto ponto
%--------------------------------- - - - - - - - - - -  -  -  -  -   -
%--------------------------------- - - - - - - - - - -  -  -  -  -   -
%--------------------------------- - - - - - - - - - -  -  -  -  -   -

ordena_cuidados_Inst([],[]).
ordena_cuidados_Inst([IDP|T],R) :- solucoes( (Dt,IDU,IDP,D,C) , cuidados(Dt,IDU,IDP,D,C), S),
										S==[],
										ordena_cuidados_Inst(T,R).
ordena_cuidados_Inst([IDP|T],[S|R]) :- solucoes( (Dt,IDU,IDP,D,C) , cuidados(Dt,IDU,IDP,D,C), S),
										S\=[],
										ordena_cuidados_Inst(T,R).


ponto_cinco(inst,X,R) :- solucoes( (IDP), prestador(IDP,N,E,X), S),
							ordena_cuidados_Inst(S,R).


%--------------------------------- 



ordena_cuidados_Cidade([],[]).
ordena_cuidados_Cidade([IDU|T],R) :- solucoes( (Dt,IDU,IDP,D,C) , cuidados(Dt,IDU,IDP,D,C), S),
										S==[],
										ordena_cuidados_Cidade(T,R).
ordena_cuidados_Cidade([IDU|T],[S|R]) :- solucoes( (Dt,IDU,IDP,D,C) , cuidados(Dt,IDU,IDP,D,C), S),
										S\=[],
										ordena_cuidados_Cidade(T,R).


ponto_cinco(cidade,X,R) :- solucoes( (IDU), utente(IDU,N,I,X) , S),
							ordena_cuidados_Cidade(S,R).   


%--------------------------------- 


ponto_cinco(data,X,R) :- solucoes( (X,IDU,IDP,D,C) , cuidado(X,IDU,IDP,D,C) , R).







%--------------------------------- - - - - - - - - - -  -  -  -  -   -
%--------------------------------- - - - - - - - - - -  -  -  -  -   -
%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Sexto ponto
%--------------------------------- - - - - - - - - - -  -  -  -  -   -
%--------------------------------- - - - - - - - - - -  -  -  -  -   -
%--------------------------------- - - - - - - - - - -  -  -  -  -   -





ponto_seis(prest,X,R) :- solucoes( (IDU), cuidado(Dt,IDU,X,D,C) , R).

%--------------------------------- 

ordena_cuidados_Utente([],[]).
ordena_cuidados_Utente([IDP|T],R) :- solucoes( (IDU) , cuidados(Dt,IDU,IDP,D,C), S),
										S==[],
										ordena_cuidados_Utente(T,R).
ordena_cuidados_Utente([IDP|T],[S|R]) :- solucoes( (IDU) , cuidados(Dt,IDU,IDP,D,C), S),
										S\=[],
										ordena_cuidados_Utente(T,R).


ponto_seis(esp,X,R) :- solucoes( (IDP), prestador(IDP,N,X,I) , S),
						ordena_cuidados_Utente(S,R).


%--------------------------------- 


ponto_seis(inst,X,R) :- solucoes( (IDP), prestador(IDP,N,E,X) , S),
						ordena_cuidados_Utente(S,R).





%--------------------------------- - - - - - - - - - -  -  -  -  -   -
%--------------------------------- - - - - - - - - - -  -  -  -  -   -
%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Setimo ponto
%--------------------------------- - - - - - - - - - -  -  -  -  -   -
%--------------------------------- - - - - - - - - - -  -  -  -  -   -
%--------------------------------- - - - - - - - - - -  -  -  -  -   -



ponto_sete(utente,X,R) :- solucoes( (Dt,X,IDP,D,C) , cuidado(Dt,X,IDP,D,C) ,R).

%--------------------------------- 


ponto_sete(inst,X,R) :- solucoes( (IDP), prestador(IDP,N,E,X), S),
						ordena_cuidados_Inst(S,R).


%--------------------------------- 


ponto_sete(prest,X,R) :- solucoes( (Dt,IDU,X,D,C), cuidado(Dt,IDU,X,D,C), R).



%--------------------------------- - - - - - - - - - -  -  -  -  -   -
%--------------------------------- - - - - - - - - - -  -  -  -  -   -
%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Oitavo ponto
%--------------------------------- - - - - - - - - - -  -  -  -  -   -
%--------------------------------- - - - - - - - - - -  -  -  -  -   -
%--------------------------------- - - - - - - - - - -  -  -  -  -   -


idpToInst(X,[(IDP,I)|T],I) :- X==IDP.
idpToInst(X,[(IDP,I)|T],R) :- X\=IDP, idpToInst(X,T,R).


altera_prestadores_IDP_INST([],L,[]).
altera_prestadores_IDP_INST([IDP|T],L,[S|R]) :- idpToInst(IDP,L,S), altera_prestadores_IDP_INST(T,L,R). 



ponto_oito(inst,X,R) :- solucoes( (IDP) , cuidado(Dt,X,IDP,D,C), S),
						solucoes( (IDP2,Inst) , prestador(IDP2,N,E,Inst), S2),
						altera_prestadores_IDP_INST(S,S2,R).




%--------------------------------- 

ponto_oito(pres,X,R) :- solucoes( (IDP) , cuidado(Dt,X,IDP,D,C), R).





%--------------------------------- - - - - - - - - - -  -  -  -  -   -
%--------------------------------- - - - - - - - - - -  -  -  -  -   -
%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Nono ponto
%--------------------------------- - - - - - - - - - -  -  -  -  -   -
%--------------------------------- - - - - - - - - - -  -  -  -  -   -
%--------------------------------- - - - - - - - - - -  -  -  -  -   -



somaTotal( [],0 ).
somaTotal( [X],X ).
somaTotal( [X|L],R ) :- somaL( L,R1 ), R is X+R1.



ponto_nove(utente,X,R) :- solucoes( (C), cuidado(Dt,X,IDP,D,C), S),
							somaTotal(S,R).


%--------------------------------- 


idpToInst(X,[(IDP,C)|T],C) :- X==IDP.
idpToInst(X,[(IDP,C)|T],R) :- X\=IDP, idpToInst(X,T,R).


altera_cuidados_IDP_CUSTO([],L,[]).
altera_cuidados_IDP_CUSTO([IDP|T],L,[S|R]) :- idpToCusto(IDP,L,S), altera_cuidados_IDP_CUSTO(T,L,R). 


ponto_nove(esp,X,R) :- solucoes( (IDP), prestador(IDP,N,X,I),S),
						solucoes( (IDP2,C), cuidado(Dt,IDU,IDP2,D,C), S2),
						altera_cuidados_IDP_CUSTO(S,S2,S3),
						somaTotal(S3,R).



%--------------------------------- 



ponto_nove(prest,X,R) :- solucoes( (C), cuidado(Dt,IDU,X,D,C), S),
							somaTotal(S,R). 


%--------------------------------- 

ponto_nove(data,X,R) :- solucoes( (C), cuidado(X,IDU,IDP,D,C), S),
							somaTotal(S,R).






%--------------------------------- - - - - - - - - - -  -  -  -  -   -
%--------------------------------- - - - - - - - - - -  -  -  -  -   -
%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Geral
%--------------------------------- - - - - - - - - - -  -  -  -  -   -
%--------------------------------- - - - - - - - - - -  -  -  -  -   -
%--------------------------------- - - - - - - - - - -  -  -  -  -   -




















