%#|---------------------------------------------------------------------------------------------|#
%#|-----------------------------------TDA REPOSITORIOS------------------------------------------|#
%#|---------------------------------------------------------------------------------------------|#
%;.......................................Representacion........................................
%repositorio(fecha,nombreRepositorio,autor,workspace,index,localRepository,remoteRepository)
%fecha=String
%nombreRepositorio=String
%Autor=String
%workspace=Lista de String
%index=Lista de String
% Commit es una lista de dos elementos donde el primero es un String y el
% segundo una lista de String
%localRepository=Lista de Commit
%remoteRepository=Lista de Commit

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
%Repositorio
%Archivos
%Nombres
%Autor
%Mensaje

%Predicados
% agregarArchivoW(Repositorio,Archivos,Repositorio) aridad=3
% gitInit(Nombres, Autor, Repositorio) aridad=3
% gitAdd(Repositorio,Archivo,Repositorio) aridad=3
% gitCommit(Repositorio,Mensaje,Repositorio) aridad=3
% gitPush(Repositorio,Repositorio) aridad=2

%Metas
%Primarias
% agregarArchivoW([Fecha,NombreRepo,Autor,W,I,LR,RR],Archivo,[Fecha,NombreRepo,Autor,NW,I,LR,RR])
% gitInit(NombreRepo, Autor, [Fecha, NombreRepo, Autor, W, I, LR, RR])
% gitAdd([Fecha,NombreRepo,Autor,W,I,LR,RR],ListaArchivos,[Fecha,NombreRepo,Autor,W,NI,LR,RR])
% gitCommit([Fecha,NombreRepo,Autor,W,I,LR,RR],Mensaje,[Fecha,NombreRepo,Autor,W,NI,NLR,RR])
% gitPush([Fecha,NombreRepo,Autor,W,I,LR,RR],[Fecha,NombreRepo,Autor,W,I,NLR,NRR])
%
% Secundarias
% add_Elemento(X,[H|T],[H|Tn])
% concatenar([X|L1],L2,[X|L3])
% coincidencias([Cabeza|Cola], L, L1)
% hacerCommit(Mensaje,I,Commit)

%Hechos
workspace([]).
indexGit([]).
localRepository([]).
remoteRepository([]).

%Reglas
%MANEJO DE LISTAS
add_Elemento(X,[],[X]).
add_Elemento(X,[H|T],[H|Tn]):-add_Elemento(X,T,Tn).

concatenar([],L,L).
concatenar([X|L1],L2,[X|L3]):-concatenar(L1,L2,L3).

%PROGRAMA
% Terminos de entrada: Un repositorio, Salida: El mismo repositorio pero
% con el workspace editado.
agregarArchivoW([Fecha,NombreRepo,Autor,W,I,LR,RR],Archivo,[Fecha,NombreRepo,Autor,NW,I,LR,RR]):-string(Archivo),
                                                                                                add_Elemento(Archivo,W,NW).
% Terminos de entrada: String,String, Salida: Un repositorio con
% fecha,nombre y autor.
gitInit(NombreRepo, Autor, [Fecha, NombreRepo, Autor, W, I, LR, RR]):- get_time(X), convert_time(X,Fecha),string(NombreRepo),string(Autor),
                                                                    workspace(W),
                                                                    indexGit(I),
                                                                    localRepository(LR),
                                                                    remoteRepository(RR).
coincidencias([],[_|_],[]).
coincidencias([_|_],[],[]).
coincidencias([Cabeza|Cola], L, L1):- member(Cabeza,L),coincidencias(Cola, L, L2), add_Elemento(Cabeza, L2, L1).
coincidencias([Cabeza|Cola], L, L1):- not(member(Cabeza,L)),coincidencias(Cola, L, L1).

% Terminos de entrada:Repositorio,Lista de String, Salida: El
% repositorio con el index modificado.
gitAdd([Fecha,NombreRepo,Autor,W,I,LR,RR],ListaArchivos,[Fecha,NombreRepo,Autor,W,NI,LR,RR]):-coincidencias(ListaArchivos,W,ListaCoincidencias),
                                                                                              concatenar(ListaCoincidencias,I,NI).

hacerCommit(Mensaje,I,Commit):-concatenar([[Mensaje,I]],[],Commit).
%Terminos de entrada:Repositorio,String,Salida: El repositorio con
%index vacio y el localR modificado.
gitCommit([Fecha,NombreRepo,Autor,W,I,LR,RR],Mensaje,[Fecha,NombreRepo,Autor,W,NI,NLR,RR]):-string(Mensaje),
                                                                                           hacerCommit(Mensaje,I,Commit),
                                                                                           concatenar(Commit,LR,NLR),
                                                                                           indexGit(NI).
% Terminos de Entrada,Repositorio,Salida:Repositorio con el localR y
% remoteR modificado.
gitPush([Fecha,NombreRepo,Autor,W,I,LR,RR],[Fecha,NombreRepo,Autor,W,I,NLR,NRR]):-concatenar(LR,RR,NRR),
                                                                                  localRepository(NLR).

% ==============================EJEMPLOS DE EJECUCION=============
%



