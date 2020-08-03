%#|---------------------------------------------------------------------------------------------|#
%#|-----------------------------------TDA REPOSITORIOS------------------------------------------|#
%#|---------------------------------------------------------------------------------------------|#
%;.......................................Representacion........................................
% repositorio(fecha,nombreRepositorio,autor,workspace,index,localRepository,remoteRepository)

%;........................................Constructores........................................
%gitInit(NombreRepo,Autor,RepoOutput)

%;.........................................Selectores..........................................

%;.........................................Modificadores..........................................
%agregarArchivoW(RepoInput,Archivo,RepoOutput)
%gitAdd(RepoInput, Archivos, RepoOutput)
%gitCommit(RepoInput, Mensaje, RepoOutput)
%gitPush(RepoInput, RepoOutput)
% #|---------------------------------------------------------------------------------------------|#

%Dominios
%Predicados

%Metas
%Primarias
%Secundarias

%Hechos
workspace([]).
indexGit([]).
localRepository([]).
remoteRepository([]).

%reglas
%MANEJO DE LISTAS
add_Elemento(X,[],[X]).
add_Elemento(X,[H|T],[H|Tn]):-add_Elemento(X,T,Tn).

concatenar([],L,L).
concatenar([X|L1],L2,[X|L3]):-concatenar(L1,L2,L3).

%PROGRAMA
agregarArchivoW([Fecha,NombreRepo,Autor,W,I,LR,RR],Archivo,[Fecha,NombreRepo,Autor,NW,I,LR,RR]):-string(Archivo),
                                                          add_Elemento(Archivo,W,NW).

gitInit(NombreRepo, Autor, [Fecha, NombreRepo, Autor, W, I, LR, RR]):- get_time(X), convert_time(X,Fecha),string(NombreRepo),string(Autor),
                                                                   workspace(W),
                                                                  indexGit(I),
                                                                  localRepository(LR),
                                                                  remoteRepository(RR).
coincidencias([],[_|_],[]).
coincidencias([_|_],[],[]).
coincidencias([Cabeza|Cola], L, L1):- member(Cabeza,L),coincidencias(Cola, L, L2), add_Elemento(Cabeza, L2, L1).
coincidencias([Cabeza|Cola], L, L1):- not(member(Cabeza,L)),coincidencias(Cola, L, L1).

gitAdd([Fecha,NombreRepo,Autor,W,I,LR,RR],ListaArchivos,[Fecha,NombreRepo,Autor,W,NI,LR,RR]):-coincidencias(ListaArchivos,W,ListaCoincidencias),
                                                                                              concatenar(ListaCoincidencias,I,NI).




