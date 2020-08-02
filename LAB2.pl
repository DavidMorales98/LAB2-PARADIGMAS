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
%
%gitPull(RepoInput,RepoOutput)
%gitStatus(RepoInput,RepoStatusStr)
%gitLog(RepoInput,RepoLogStr)
%gitBranch(RepoInput, NombreRama,RepoOutput)
%gitCheckout(RepoInput, NombreRama, RepoOutput)
% #|---------------------------------------------------------------------------------------------|#

%Dominios
%Predicados

%Metas
%Primarias
%Secundarias

%Hechos

%reglas
%MANEJO DE LISTAS
%agregar un elemento a una lista
agregarElemento(Elemento,Lista,NuevaLista):-append([Elemento],Lista,NuevaLista).
seEncuentra(Elemento,Lista):-member(Elemento,Lista).

concatenar([],L,L).
concatenar([X|L1],L2,[X|L3]):-concatenar(L1,L2,L3).




