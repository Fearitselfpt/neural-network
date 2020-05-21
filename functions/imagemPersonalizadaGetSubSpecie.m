function b = imagemPersonalizadaGetSpecie(isToTrainWithProps, image, imageProps)
% CARREGA A REDE
disp('Aguarde enquanto a rede neuronal está a ser carregada...')
% REDE CARREGADA
% DECIDE INPUTS
if isToTrainWithProps == 2.0
    load('redeSubEspecieProps.mat')
    net = redeSubEspecie;
    clear redeSubEspecie;
    load('trSubEspecieProps.mat')
    tr = trSubEspecie;
    clear trSubEspecie;
    image = imageProps;%size(image)
    clear imageProps;
    image=image';
else
    load('redeSubEspecie.mat')
    net = redeSubEspecie;
    clear redeSubEspecie;
    load('trSubEspecie.mat')
    tr = trSubEspecie;
    clear trSubEspecie;
    clear imageProps;
end
disp('Aguarde enquanto é efetuada a simulação do treino da rede neuronal.')
% SIMULAR
out = sim(net, image);
for i=1:size(out,2)               % Para cada classificacao
    [a b] = max(out(:,i));          %b guarda a linha onde encontrou valor mais alto da saida obtida
end
end

