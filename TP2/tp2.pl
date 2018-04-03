%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% SIST. REPR. CONHECIMENTO E RACIOCINIO - MiEI/3

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% TP2

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

utente(1,'Tiago',23,morada('Rua 1','Esposende')).
utente(2,'Cesario',21,morada('Rua 2','Valença')).
utente(3,'Luis',22,morada('Rua 3','Viana')).
utente(4,'Rui',21,morada('Rua 4','Braga')).
utente(5,'Marega',27,morada('Rua 5','Porto')).
utente(6,'Tiquinho',25,morada('Rua 6','Porto')).
utente(7,'Brahimi',26,morada('Rua 7','Olival')).
utente(8,'Aboubakar',26,morada('Rua 8','Olival')).
utente(9,'Danilo',25,morada('Rua 9','Porto')).
utente(10,'Herrera',25,morada('Rua 10','Porto')).


%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado prestador: IdPrest, Nome, Espcialidade, Instituição -> {V,F}

prestador(1,'Nelon Puga','Desporto',instituicao('Clinica do Dragao', morada('Rua das Antas','Porto'))).
prestador(2,'Joaquim','Cardiologia',instituicao('Clinica do Dragao', morada('Rua das Antas','Porto'))).
prestador(3,'Antonio','Fisioterapia',instituicao('Clinica do Dragao', morada('Rua das Antas','Porto'))).
prestador(4,'Pedro','Radiologia',instituicao('Clinica do Dragao', morada('Rua das Antas','Porto'))).
prestador(5,'Manuel','Oftalmogia',instituicao('Clinica do Dragao', morada('Rua das Antas','Porto'))).

prestador(6,'Ines','Cardiologia',instituicao('Hospital Braga', morada('Rua do Hospital','Braga'))).
prestador(7,'Joana','Cirurgia',instituicao('Hospital Braga', morada('Rua do Hospital','Braga'))).
prestador(8,'Maria','Radiologia',instituicao('Hospital Braga', morada('Rua do Hospital','Braga'))).
prestador(9,'Diana','Oftalmogia',instituicao('Hospital Braga', morada('Rua do Hospital','Braga'))).
prestador(10,'Ana','Fisioterapia',instituicao('Hospital Braga', morada('Rua do Hospital','Braga'))).

prestador(11,'Carlos','Cardiologia',instituicao('Hospital Sao Joao', morada('Rua da Circunvalacao','Porto'))).
prestador(12,'Tomas','Cirurgia',instituicao('Hospital Sao Joao', morada('Rua da Circunvalacao','Porto'))).
prestador(13,'Raquel','Radiologia',instituicao('Hospital Sao Joao', morada('Rua da Circunvalacao','Porto'))).
prestador(14,'Luisa','Oftalmogia',instituicao('Hospital Sao Joao', morada('Rua da Circunvalacao','Porto'))).
prestador(15,'Teresa','Fisioterapia',instituicao('Hospital Sao Joao', morada('Rua da Circunvalacao','Porto'))).


%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado cuidado: Data, IdUt, IdPrest, Descrição, Custo -> {V,F}

cuidado(data(10,02,2018),1,9,'Consulta Rotina',30).
cuidado(data(10,02,2018),2,9,'Consulta Rotina',30).
cuidado(data(10,02,2018),3,9,'Consulta Rotina',30).
cuidado(data(10,02,2018),4,9,'Consulta Rotina',30).
cuidado(data(11,02,2018),5,9,'Consulta Rotina',30).

cuidado(data(15,02,2018),5,1,'Consulta Pos-Match',10).
cuidado(data(15,02,2018),6,1,'Consulta Pos-Match',10).
cuidado(data(15,02,2018),7,1,'Consulta Pos-Match',10).
cuidado(data(15,02,2018),8,1,'Consulta Pos-Match',10).
cuidado(data(15,02,2018),9,1,'Consulta Pos-Match',10).

cuidado(data(16,02,2018),5,11,'Eletrocardiograma',20).
cuidado(data(16,02,2018),6,11,'Eletrocardiograma',20).
cuidado(data(16,02,2018),7,11,'Eletrocardiograma',20).
cuidado(data(17,02,2018),10,15,'Fisio - Coxa Direita',10).
cuidado(data(17,02,2018),8,15,'Fisio - Gemeo Esq',10).

cuidado(data(18,03,2018),10,13,'Raio X',50).
cuidado(data(10,03,2018),5,1,'Consulta Pos-Match',10).
cuidado(data(10,03,2018),7,1,'Consulta Pos-Match',10).
cuidado(data(10,03,2018),8,1,'Consulta Pos-Match',10).
cuidado(data(10,03,2018),9,1,'Consulta Pos-Match',10).

cuidado(data(12,03,2018),6,15,'Fisio - Coxa Esq',10).
cuidado(data(12,03,2018),7,15,'Fisio - Joelho Dir',10).
cuidado(data(12,03,2018),8,15,'Fisio - Costas',10).
cuidado(data(12,03,2018),9,15,'Fisio - Virilha',10).
cuidado(data(12,03,2018),10,15,'Fisio - Coxa Dir',10).

cuidado(data(20,02,2018),1,9,'Consulta',30).
cuidado(data(20,02,2018),2,6,'Eletrocardiograma',25).
cuidado(data(20,02,2018),3,7,'Intervenção',30).
cuidado(data(20,02,2018),4,8,'Consulta Rotina',30).
cuidado(data(20,02,2018),5,5,'Consulta Rotina',30).



% Extensao do predicado data: Dia,Mes,Ano -> {V,F}

data(D, M, A) :- pertence(M, [1,3,5,7,8,10,12]), D >= 1, D =< 31.
data(D, M, A) :- pertence(M, [4,6,9,11]), D >= 1, D =< 30.
data(D, 2, A) :- A mod 4 =\= 0, D >= 1, D =< 28.
data(D, 2, A) :- A mod 4 =:= 0, D >= 1, D =< 29.


%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado instituicao: Nome,Morada -> {V,F}

instituicao('Clinica do Dragao', morada('Rua das Antas','Porto')).
instituicao('Hospital Sao Joao', morada('Rua da Circunvalacao','Porto')).

instituicao('Hospital Braga', morada('Rua do Hospital','Braga')).
instituicao('Centro Saude', morada('Rua Centro','Braga')).

instituicao('Hospital Viana', morada('Rua do Hospital','Viana')).
instituicao('Hospital Esposende', morada('Rua do Hospital', 'Esposende')).



%--------------------------------- - - - - - - - - - -  -  -  -  -   -
%--------------------------------- - - - - - - - - - -  -  -  -  -   -
%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Invariantes
%--------------------------------- - - - - - - - - - -  -  -  -  -   -
%--------------------------------- - - - - - - - - - -  -  -  -  -   -
%--------------------------------- - - - - - - - - - -  -  -  -  -   -

% Invariante Estrutural:  nao permitir a insercao de conhecimento repetido

+utente(ID,_,_,_) :: (solucoes( (ID), (utente(ID,_,_,_)),S), comprimento(S,N), N==1).


% Invariante Estrutural:  nao permitir a insercao de conhecimento repetido


+prestador(ID,_,_,_) :: (solucoes( (ID), (prestador(ID,_,_,_)), S),comprimento(S,N),N==1).

% Invariante Estrutural:  nao permitir a insercao de conhecimento repetido


+cuidado(Dt,IDU,IDP,_,_) :: (solucoes( (Dt,IDU,IDP),(cuidado(Dt,IDU,IDP,_,_)),S),comprimento(S,N),N==1).


% Invareiante Referencial: nao permitir a insercao de conhecimento, por falta de conhecimento.


+cuidado(_,IDU,_,_,_) :: (solucoes( (IDU),(utente(IDU,_,_,_)),S),comprimento(S,N),N==0).
+cuidado(_,_,IDP,_,_) :: (solucoes( (IDP),(prestador(IDP,_,_,_)),S),comprimento(S,N),N==0).


% Invariante Estrutural:  nao permitir a insercao de conhecimento repetido

+instituicao(N,_) :: (solucoes( (N), instituicao(N,_) ,S), N==1).


%---------------------------------


% Invariante Estrutural:  nao permitir a remoção de conhecimento


-utente(ID,_,_,_) :: (solucoes( (ID), (cuidado(_,ID,_,_,_)) , S),comprimento(S,N),N==0).

% Invariante Estrutural:  nao permitir a remoção de conhecimento


-prestador(ID,_,_,_) :: (solucoes( (ID), (cuidado(_,_,ID,_,_)), S),comprimento(S,N),N==0).

% Invariante Estrutural:  nao permitir a remoção de conhecimento


-cuidado(Dt,IDU,IDP,D,C) :: (solucoes( (Dt,IDU,IDP,D,C), (cuidado(Dt,IDU,IDP,D,C)) ,S),comprimento(S,N), N==0).


% Invariante Estrutural:  nao permitir a remoção de conhecimento

-instituicao(N,M) :: (solucoes( (N,M), prestador(_,_,_,instituicao(N,M)) , S),comprimento(S,N), N==0).


%--------------------------------- - - - - - - - - - -  -  -  -  -   -
%--------------------------------- - - - - - - - - - -  -  -  -  -   -
%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Evolução do conhecimento
%--------------------------------- - - - - - - - - - -  -  -  -  -   -
%--------------------------------- - - - - - - - - - -  -  -  -  -   -
%--------------------------------- - - - - - - - - - -  -  -  -  -   -


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
% Remoção do conhecimento
%--------------------------------- - - - - - - - - - -  -  -  -  -   -
%--------------------------------- - - - - - - - - - -  -  -  -  -   -
%--------------------------------- - - - - - - - - - -  -  -  -  -   -



remocao(T) :- retract(T).
remocao(T) :- assert(T),!,fail.

remover( Termo ) :-
	Termo,
		solucoes(Invariante, -Termo::Invariante, Lista),
			remocao(Termo),
				teste(Lista).


%--------------------------------- - - - - - - - - - -  -  -  -  -   -
%--------------------------------- - - - - - - - - - -  -  -  -  -   -
%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Geral
%--------------------------------- - - - - - - - - - -  -  -  -  -   -
%--------------------------------- - - - - - - - - - -  -  -  -  -   -
%--------------------------------- - - - - - - - - - -  -  -  -  -   -

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado nao: Q -> {V,F}

nao(Q) :- Q, !, fail.
nao(Q).


%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado pertence: X, L -> {V,F}

pertence(H,[H|T]).
pertence(X,[H|T]) :-
	X \= H,
	pertence(X,T).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado unicos: L, R -> {V,F}

unicos([],[]).
unicos([H|T], R) :-
	pertence(H,T),
	unicos(T,R).
unicos([H|T], [H|R]) :-
	nao(pertence(H,T)),
	unicos(T,R).


%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado somaTotal: Lista,Resultado -> {V,F}

somaTotal( [],0 ).
somaTotal( [X],X ).
somaTotal( [X|L],R ) :- somaTotal( L,R1 ), R is X+R1.



%--------------------------------- - - - - - - - - - -  -  -  -  -   -
%--------------------------------- - - - - - - - - - -  -  -  -  -   -
%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Primeiro Ponto : Representar conhecimento positivo e negativo.
%--------------------------------- - - - - - - - - - -  -  -  -  -   -
%--------------------------------- - - - - - - - - - -  -  -  -  -   -
%--------------------------------- - - - - - - - - - -  -  -  -  -   -


%---------------------------------
% Conhecimento positivo
%---------------------------------






%---------------------------------
% Conhecimento negativo 
%---------------------------------


% Verifica se o utente não existe e se não há exceção.

-utente(ID,N,I,M) :-
    nao(utente(ID,N,I,M)),
    nao(excecao(utente(ID,N,I,M))).

% Verifica se o prestador não existe e se não há exceção.

-prestador(ID,N,E,I) :-
    nao(prestador(ID,N,E,I)),
    nao(excecao(prestador(ID,N,E,I))).

% Verifica se o cuidado não existe e se não há exceção.

-cuidado(Dt,IDU,IDP,D,C) :-
    nao(cuidado(Dt,IDU,IDP,D,C)),
    nao(excecao(cuidado(Dt,IDU,IDP,D,C))).





%--------------------------------- - - - - - - - - - -  -  -  -  -   -
%--------------------------------- - - - - - - - - - -  -  -  -  -   -
%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Segundo Ponto : Representar casos de conhecimento imperfeito, 
% pela utilização de valores nulos de todos os tipos estudados.
%--------------------------------- - - - - - - - - - -  -  -  -  -   -
%--------------------------------- - - - - - - - - - -  -  -  -  -   -
%--------------------------------- - - - - - - - - - -  -  -  -  -   -


%---------------------------------
% Utentes -> Incerto
%---------------------------------

utente(5,'Marega',27,incerto1).
excecao(utente(ID,N,I,M)) :- utente(ID,N,I,incerto1).

utente(4,'Rui',incerto2,morada('Rua 4','Braga')).
excecao(utente(ID,N,I,M)) :- utente(ID,N,incerto2,M).

desc(incerto1).
desc(incerto2).

%---------------------------------
% Utentes -> Impreciso
%---------------------------------

excecao(utente(11,'Renato',20,morada('Rua 11','Lisboa'))).
excecao(utente(11,'Renato',32,morada('Rua 11','Lisboa'))).

%---------------------------------
% Utentes -> Interdito
%---------------------------------

utente(7,'Brahimi',interdito1,morada('Rua 7','Olival')).
excecao(utente(ID,N,I,M)) :- utente(ID,N,interdito1,M).

nulo(interdito1).




%--------------------------------- - - - - - - - - - -  -  -  -  -   -




%---------------------------------
% Prestadores -> Incerto
%---------------------------------

prestador(4,'Pedro','Radiologia',incerto3).
excecao(prestador(ID,N,E,I)) :- excecao(prestador(ID,N,E,incerto3)).

prestador(9,'Diana',incerto4,instituicao('Hospital Braga', morada('Rua do Hospital','Braga'))).
excecao(prestador(ID,N,E,I)) :- excecao(prestador(ID,N,incerto4,I)).

desc(incerto3).
desc(incerto4).

%---------------------------------
% Prestadores -> Impreciso
%---------------------------------

prestador(12,'Tomas','Cirurgia',instituicao('Hospital Sao Joao', morada('Rua da Circunvalacao','Porto'))).
prestador(12,'Tomas','Radiologia',instituicao('Hospital Sao Joao', morada('Rua da Circunvalacao','Porto'))).


%---------------------------------
% Prestadores -> Interdito
%---------------------------------

prestador(15,'Teresa','Fisioterapia',interdito2).
excecao(prestador(ID,N,E,I)) :- excecao(prestador(ID,N,E,interdito2)).

nulo(interdito2).



%--------------------------------- - - - - - - - - - -  -  -  -  -   -



%---------------------------------
% Cuidado -> Incerto
%---------------------------------

cuidado(data(10,03,2018),9,1,'Consulta Pos-Match',incerto5).
excecao(cuidado(Dt,IDU,IDP,D,C)) :- cuidado(Dt,IDU,IDP,D,incerto5).

cuidado(data(18,03,2018),10,13,incerto6,50).
excecao(cuidado(Dt,IDU,IDP,D,C)) :- cuidado(Dt,IDU,IDP,incerto6,C).

desc(incerto5).
desc(incerto6).


%---------------------------------
% Cuidado -> Impreciso
%---------------------------------


excecao(cuidado(data(20,02,2018),10,6,'Eletrocardiograma',27)).
excecao(cuidado(data(20,02,2018),10,6,'Eletrocardiograma',38)).



%---------------------------------
% Cuidado -> Interdito
%---------------------------------


cuidado(interdito3,9,15,'Fisio - Virilha',10).
excecao(cuidado(Dt,IDU,IDP,D,C)) :- cuidado(interdito3,IDU,IDP,D,C).

nulo(interdito3).



%--------------------------------- - - - - - - - - - -  -  -  -  -   -


%---------------------------------
% Instituição -> Incerto
%---------------------------------





%---------------------------------
% Instituição -> Impreciso
%---------------------------------




%---------------------------------
% Instituição -> Interdito
%---------------------------------






%--------------------------------- - - - - - - - - - -  -  -  -  -   -
%--------------------------------- - - - - - - - - - -  -  -  -  -   -
%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Terceiro Ponto : Manipular invariantes que designem restrições à 
% inserção e à remoção de conhecimento do sistema.
%--------------------------------- - - - - - - - - - -  -  -  -  -   -
%--------------------------------- - - - - - - - - - -  -  -  -  -   -
%--------------------------------- - - - - - - - - - -  -  -  -  -   -


% Invariantes para não existir evolução de conhecimento imperfeito incerto.

+utente(ID,N,I,M) :: (solucoes((ID,N,I,M),(utente(ID,N,I,M),nao(desc(ID)),nao(desc(N)),nao(desc(I)),nao(desc(M))),S),
                     comprimento(S,N),
                     N == 0).



+prestador(ID,N,E,I) :: (solucoes((ID,N,E,I),(prestador(ID,N,E,I),nao(desc(ID)),nao(desc(N)),nao(desc(E)),nao(desc(I))),S),
                                   comprimento(S,N),
                                   N == 0).



+cuidado(Dt,IDU,IDP,D,C) :: (solucoes((Dt,IDU,IDP,D,C),(cuidado(Dt,IDU,IDP,D,C),nao(desc(Dt)),nao(desc(IDU)),nao(desc(IDP)),nao(desc(D)),nao(desc(C))),S),
                               comprimento(S,N),
                               N == 0).


%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Invariantes para não existir evolução de conhecimento imperfeito impreciso.

+excecao(utente(ID,N,I,M)) :: (solucoes((ID,N,I,M),(utente(ID,N,I,M),nao(excecao(utente(ID,N,I,M)))),S),
                              comprimento(S,N),
                              N == 0). 

+excecao(prestador(ID,N,E,I)) :: (solucoes((ID,N,E,I),(prestador(ID,N,E,I),nao(excecao(prestador(ID,N,E,I)))),S),
                                           comprimento(S,N),
                                           N == 0). 

+excecao(cuidado(Dt,IDU,IDP,D,C)) :: (solucoes((Dt,IDU,IDP,D,C),(cuidado(Dt,IDU,IDP,D,C),nao(excecao(cuidado(Dt,IDU,IDP,D,C)))),S),
                                        comprimento(S,N),
                                        N == 0).


%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Invariantes para não existir evolução de conhecimento imperfeito interdito.

+utente(ID,N,I,M) :: (solucoes((ID,N,I,M),(utente(ID,N,I,M),nao(nulo(ID)),nao(nulo(N)),nao(nulo(I)),nao(nulo(M))),S),
                     comprimento(S,N),
                     N == 0).

+prestador(ID,N,E,I) :: (solucoes((ID,N,E,I),(prestador(ID,N,E,I),nao(nulo(ID)),nao(nulo(N)),nao(nulo(E)),nao(nulo(I))),S),
                                   comprimento(S,N),
                                   N == 0).

+cuidado(Dt,IDU,IDP,D,C) :: (solucoes((Dt,IDU,IDP,D,C),(cuidado(Dt,IDU,IDP,D,C),nao(nulo(Dt)),nao(nulo(IDU)),nao(nulo(IDP)),nao(nulo(D)),nao(nulo(C))),S),
                               comprimento(S,N),
                               N == 0).


%--------------------------------- - - - - - - - - - -  -  -  -  -   -
%--------------------------------- - - - - - - - - - -  -  -  -  -   -
%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Quarto Ponto : Lidar com a problemática da evolução do conhecimento, 
% criando os procedimentos adequados.
%--------------------------------- - - - - - - - - - -  -  -  -  -   -
%--------------------------------- - - - - - - - - - -  -  -  -  -   -
%--------------------------------- - - - - - - - - - -  -  -  -  -   -


%Este ponto está resolvido acima, no campo Evolução/Involução do conhecimento.


%--------------------------------- - - - - - - - - - -  -  -  -  -   -
%--------------------------------- - - - - - - - - - -  -  -  -  -   -
%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Quarto Ponto : Desenvolver um sistema de inferência capaz de 
% implementar os mecanismos de raciocínio inerentes a estes sistemas.
%--------------------------------- - - - - - - - - - -  -  -  -  -   -
%--------------------------------- - - - - - - - - - -  -  -  -  -   -
%--------------------------------- - - - - - - - - - -  -  -  -  -   -

% Extensao do meta-predicado demo: Questao,Resposta -> {V,F,D}

demo(Questao,verdadeiro) :-
    Questao.
demo(Questao,falso) :-
    -Questao.
demo(Questao,desconhecido) :-
    nao(Questao),
    nao(-Questao).









