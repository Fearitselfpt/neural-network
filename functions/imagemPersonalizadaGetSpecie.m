function b = imagemPersonalizadaGetSpecie(isToTrainWithProps, image, imageProps)
% CARREGA A REDE
disp('Aguarde enquanto a rede neuronal est� a ser carregada...')
% REDE CARREGADA
% DECIDE INPUTS
if isToTrainWithProps == 2.0
    load('redeEspecieProps.mat')
    net = redeEspecie;
    clear redeEspecie;
    load('trEspecieProps.mat')
    tr = trEspecie;
    clear trEspecie;
    image = imageProps;
    clear imageProps;
    image=image';
else
    load('redeEspecie.mat')
    net = redeEspecie;
    clear redeEspecie;
    load('trEspecie.mat')
    tr = trEspecie;
    clear trEspecie;
    clear imageProps;
end
disp('Aguarde enquanto � efetuada a simula��o do treino da rede neuronal.')
% SIMULAR
out = sim(net, image);
%VISUALIZAR DESEMPENHO

disp('Aguarde enquanto as classifica��es corretas s�o calculadas...')
%Calcula e mostra a percentagem de classificacoes corretas no total dos exemplos
for i=1:size(out,2)               % Para cada classificacao
    [a b] = max(out(:,i));          %b guarda a linha onde encontrou valor mais alto da saida obtida
end
end
