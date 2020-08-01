%#|---------------------------------------------------------------------------------------------|#
%#|-----------------------------------TDA REPOSITORIOS------------------------------------------|#
%#|---------------------------------------------------------------------------------------------|#
%;.......................................Representacion........................................
%repositorio(fecha,autor,nombreRepositorio,workspace,index,localRepository,remoteRepository)

%;........................................Constructores........................................
%gitInit(NombreRepo,Autor,RepoOutput)

%;.........................................Selectores..........................................

%;.........................................Modificadores..........................................
%gitAdd(RepoInput, Archivos, RepoOutput)
%gitCommit(RepoInput, Mensaje, RepoOutput)
%gitPush(RepoInput, RepoOutput)
%gitPull(RepoInput,RepoOutput)
%gitStatus(RepoInput,RepoStatusStr)
%gitLog(RepoInput,RepoLogStr)

%gitBranch(RepoInput, NombreRama,RepoOutput)
%gitCheckout(RepoInput, NombreRama, RepoOutput)


%Hechos
%Predicados