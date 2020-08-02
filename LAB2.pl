%#|---------------------------------------------------------------------------------------------|#
%#|-----------------------------------TDA REPOSITORIOS------------------------------------------|#
%#|---------------------------------------------------------------------------------------------|#
%;.......................................Representacion........................................
% repositorio(fecha,nombreRepositorio,autor,workspace,index,localRepository,remoteRepository)

%;........................................Constructores........................................
%gitInit(NombreRepo,Autor,RepoOutput)

%;.........................................Selectores..........................................

%;.........................................Modificadores..........................................
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
%agregar un elemento a una lista
agregarElemento(Elemento,Lista,NuevaLista):-append([Elemento],Lista,NuevaLista).
seEncuentra(Elemento,Lista):-member(Elemento,Lista).
concatenar([],L,L).
concatenar([X|L1],L2,[X|L3]):-concatenar(L1,L2,L3).

%PROGRAMA
obtenerFecha([F,_,_,_,_,_,_],F).
obtenerNombre([_,N,_,_,_,_,_],N).
obtenerAutor([_,_,A,_,_,_,_],A).
obtenerWorkspace([_,_,_,W,_,_,_],W).
obtenerIndex([_,_,_,_,I,_,_],I).
obtenerLocalRepository([_,_,_,_,_,LR,_],LR).
obtenerRemoteRepository([_,_,_,_,_,_,RR],RR).

agregarArchivoW([F,N,A,W,I,L,R],Archivo,[F,N,A,NW,I,L,R]):-string(Archivo),
                                                          agregarElemento(Archivo,W,NW).

gitInit(NombreRepo, Autor, [Fecha, NombreRepo, Autor, W, I, L, R]):- get_time(X), convert_time(X,Fecha),string(NombreRepo),string(Autor),
                                                                   workspace(W),
                                                                  indexGit(I),
                                                                  localRepository(L),
                                                                  remoteRepository(R).




