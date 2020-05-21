function [net, tr, accuracy, time, epochs] = notIris(isToTrain, funcTreino, cam1Treino, cam2Treino, trainRatio, valRatio, testRatio, trainTool, isToTrainWithProps, isToDivideFcn, camadasEscondidas, isToPlot, redeCarregada)
disp('A rede neuronal para o reconhecimento da espécie vai começar!')
disp('Aguarde enquanto a rede neuronal está a ser criada e configurada...')
% CRIAR E CONFIGURAR A REDE NEURONAL
% Camadas Escondidas
net = feedforwardnet(camadasEscondidas);
% INDICAR: N? camadas escondidas e nos por camada escondida //1 no
% enunciado
disp('As funções de treino estão a ser configuradas...')
%net.layers{3}.transferFcn = 'purelin'; %(camada 2, pure linear)
% INDICAR: Funcao de treino: fishe{'trainlm', 'trainbfg', traingd'}
if funcTreino == 1.0
    net.trainFcn = 'trainlm';
elseif funcTreino == 2.0
    net.trainFcn = 'traingd';
else
    net.trainFcn = 'trainbfg';
end
% INDICAR: Funcoes de ativacao das camadas escondidas e de saida: {'purelin', 'logsig', 'tansig'}
% FUNCAO DE ATIVACAO DA CAMADA DE SAIDA
%aqui coloca-se o nº da camada onde se quer mexer
if cam2Treino == 6.0
    % CAMADA 1
    if cam1Treino == 1.0
        net.layers{1}.transferFcn = 'hardlim'; %(camada 1, step)
    elseif cam1Treino == 2.0
        net.layers{1}.transferFcn = 'purelin'; %(camada 1, linear)
    elseif cam1Treino == 3.0
        net.layers{1}.transferFcn = 'logsig'; %(camada 1, sigmoid)
    elseif cam1Treino == 4.0
        net.layers{1}.transferFcn = 'tansig'; %(camada 1, tanH)
    elseif cam1Treino == 5.0
        net.layers{1}.transferFcn = 'hardlims'; %(camada 1, sinal)
    end
else
    % CAMADA 1
    if cam1Treino == 1.0
        net.layers{1}.transferFcn = 'hardlim'; %(camada 1, step)
    elseif cam1Treino == 2.0
        net.layers{1}.transferFcn = 'purelin'; %(camada 1, linear)
    elseif cam1Treino == 3.0
        net.layers{1}.transferFcn = 'logsig'; %(camada 1, sigmoid)
    elseif cam1Treino == 4.0
        net.layers{1}.transferFcn = 'tansig'; %(camada 1, tanH)
    elseif cam1Treino == 5.0
        net.layers{1}.transferFcn = 'hardlims'; %(camada 1, sinal)
    end
    
    % CAMADA 2
    if cam2Treino == 1.0
        net.layers{2}.transferFcn = 'hardlim'; %(camada 2, step)
    elseif cam2Treino == 2.0
        net.layers{2}.transferFcn = 'purelin'; %(camada 2, linear)
    elseif cam2Treino == 3.0
        net.layers{2}.transferFcn = 'logsig'; %(camada 2, sigmoid)
    elseif cam2Treino == 4.0
        net.layers{2}.transferFcn = 'tansig'; %(camada 2, tanH)
    elseif cam2Treino == 5.0
        net.layers{2}.transferFcn = 'hardlims'; %(camada 2, sinal)
    end
end

disp('As percentagens da função de treino, validação e teste estão a ser configuradas...')
% INDICAR: Divisao dos exemplos pelos conjuntos de treino, validacao e teste
%A função de divisão por defeito (dividerand) cria os 3 conjuntos de
%treino, validação e teste, respetivamente, com 70%, 15% e 15% dos exemplos. Estes valores
%podem ser alterados através das variáveis pertencentes ao objeto net.divideParam .

if isToDivideFcn == 1.0
    net.divideFcn = 'dividerand';
    net.divideParam.trainRatio = trainRatio;
    net.divideParam.valRatio = valRatio;
    net.divideParam.testRatio = testRatio;
end
disp('As imagens vetorizadas e os indicadores de espécies estão a ser carregados...')
if isToTrainWithProps == 1.0
    load('imagesProperties.mat')
    imagesvectorized = imagesProperties;
    clear imagesProperties;
else
    load('imagesvectorized.mat')
end
load('labels.mat')
imagesvectorized=imagesvectorized';
if trainTool == 0.0
    net.trainParam.showWindow = 0;
end
% COMPLETAR A RESTANTE CONFIGURACAO

disp('A configuração da rede neuronal foi terminada.')
% TREINAR
if isToTrain
    disp('Aguarde enquanto a rede neuronal está a ser treinada...')
    if redeCarregada == 1 && isToTrainWithProps == 0.0
        disp('A rede com binario foi carregada com sucesso!')
        load('redeEspecie.mat')
        net = redeEspecie;
        clear redeEspecie;
    else
        if redeCarregada == 1 && isToTrainWithProps == 1.0
            disp('A rede com caracteristicas foi carregada com sucesso!')
            load('redeEspecieProps.mat')
            net = redeEspecie;
            clear redeEspecie;
        end
    end
    [net,tr] = train(net, imagesvectorized, labels);
else
    disp('Aguarde enquanto a rede neuronal está a ser carregada...')
    if isToTrainWithProps == 1.0
        load('redeEspecieProps.mat')
        net = redeEspecie;
        clear redeEspecie;
        load('trEspecieProps.mat')
        tr = trEspecie;
        clear trEspecie;        
    else
        load('redeEspecie.mat')
        net = redeEspecie;
        clear redeEspecie;
        load('trEspecie.mat')
        tr = trEspecie;
        clear trEspecie;
    end
end
%view(net);
disp('Aguarde enquanto é efetuada a simulação do treino da rede neuronal.')
% SIMULAR
out = sim(net, imagesvectorized);

disp('Aguarde enquanto os gráficos estão a ser preparados...')
%VISUALIZAR DESEMPENHO
if isToPlot == 1.0
    %plotconfusion(labels, out) % Matriz de confusao
    plotperf(tr)         % Grafico com o desempenho da rede nos 3 conjuntos
end
disp('Aguarde enquanto as classificações corretas são calculadas...')
%Calcula e mostra a percentagem de classificacoes corretas no total dos exemplos
r=0;
for i=1:size(out,2)               % Para cada classificacao
    [a b] = max(out(:,i));          %b guarda a linha onde encontrou valor mais alto da saida obtida
    [c d] = max(labels(:,i));  %d guarda a linha onde encontrou valor mais alto da saida desejada
    if b == d                       % se estao na mesma linha, a classificacao foi correta (incrementa 1)
        r = r+1;
    end
end
accuracy = r/size(out,2)*100;
%fprintf('Precisao total %f\n', accuracy)

disp('Aguarde enquanto é efetuada a simulação apenas no conjunto de teste...')
if isToTrain
    % SIMULAR A REDE APENAS NO CONJUNTO DE TESTE
    TInput = imagesvectorized(:, tr.testInd);
    TTargets = labels(:, tr.testInd);
    
    out = sim(net, TInput);
    
    disp('Aguarde enquanto as classificações corretas no conjunto de teste são calculadas...')
    %Calcula e mostra a percentagem de classificacoes corretas no conjunto de teste
    r=0;
    for i=1:size(tr.testInd,2)               % Para cada classificacao
        [a b] = max(out(:,i));          %b guarda a linha onde encontrou valor mais alto da saida obtida
        [c d] = max(TTargets(:,i));  %d guarda a linha onde encontrou valor mais alto da saida desejada
        if b == d                       % se estao na mesma linha, a classificacao foi correta (incrementa 1)
            r = r+1;
        end
    end
    accuracy = r/size(tr.testInd,2)*100;
    time = tr.time(:,size(tr.time,2))/60;
    time = round(time,2);
    epochs = tr.num_epochs;
else
    time = -1;
    epochs = -1;
end
%fprintf('Precisao teste %f\n', accuracy)



xx = net.IW{1,:};                    % w's de todos os inputs para a camada 1
yy1 = net.LW(2,1);                  % w's entre a camada 1 e a camada 2
xx1 = net.b{1};                      % w0's (bias) da camada 1
b1 = net.b{2};                      % bias output

%fprintf('ws entre inputs e camada 1 \n');
%disp(xx);
%fprintf('ws entre camada 1 e camada 2\n');
%disp(yy1);
%fprintf('w0 s (bias) da camada 1\n');
%disp(xx1);
%fprintf('ws entre camada 2 e camada de saida \n');
%disp(b1);

% SE E PARA MELHORAR A REDE ENTAO GUARDA LOGO
if redeCarregada == 1 && isToTrain
    redeEspecie = net;
    trEspecie = tr;
    if isToTrainWithProps == 1.0
        save('redeEspecieProps.mat','redeEspecie')
        save('trEspecieProps.mat','trEspecie')
        disp('Rede guardada com sucesso!')
    else
        save('redeEspecie.mat','redeEspecie')
        save('trEspecie.mat','trEspecie')
        disp('Rede guardada com sucesso!')
    end
end
end
