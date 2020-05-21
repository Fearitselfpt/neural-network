function varargout = tp(varargin)
% TP MATLAB code for tp.fig
%      TP, by itself, creates a new TP or raises the existing
%      singleton*.
%
%      H = TP returns the handle to a new TP or the handle to
%      the existing singleton*.
%
%      TP('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in TP.M with the given input arguments.
%
%      TP('Property','Value',...) creates a new TP or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before tp_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to tp_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help tp

% Last Modified by GUIDE v2.5 01-Jul-2018 15:30:26

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
    'gui_Singleton',  gui_Singleton, ...
    'gui_OpeningFcn', @tp_OpeningFcn, ...
    'gui_OutputFcn',  @tp_OutputFcn, ...
    'gui_LayoutFcn',  [] , ...
    'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before tp is made visible.
function tp_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to tp (see VARARGIN)

% Choose default command line output for tp
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);
setGlobalVezesCorreu(0);
setGlobalTrainedGravar(0);
setGlobalRedeCarregada(0);
% UIWAIT makes tp wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = tp_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pbStart.
function pbStart_Callback(hObject, eventdata, handles)
% hObject    handle to pbStart (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.tAcertoEspecie,'String','');
set(handles.tAcertoSubEspecie,'String','');
fn = get(handles.etFN,'String');
[numFiles, max_alt, max_larg] = converterImagem(fn);
setGlobalMaxAltura(max_alt);
setGlobalMaxLargura(max_larg);
set(handles.tNumFiles,'String',num2str(numFiles));
set(handles.tNumFiles2,'String',num2str(numFiles));
msgbox('As imagens estão prontas para entrar na rede!','Converter imagens')


function etFN_Callback(hObject, eventdata, handles)
% hObject    handle to etFN (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of etFN as text
%        str2double(get(hObject,'String')) returns contents of etFN as a double


% --- Executes during object creation, after setting all properties.
function etFN_CreateFcn(hObject, eventdata, handles)
% hObject    handle to etFN (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usu\ally have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in cbOI.
function cbOI_Callback(hObject, eventdata, handles)
% hObject    handle to cbOI (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of cbOI


% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1


% --- Executes during object creation, after setting all properties.
function popupmenu1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu2.
function popupmenu2_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu2


% --- Executes during object creation, after setting all properties.
function popupmenu2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pbTreinarRede.
function pbTreinarRede_Callback(hObject, eventdata, handles)
% hObject    handle to pbTreinarRede (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.tAcertoEspecie,'String','');
set(handles.tAcertoSubEspecie,'String','');
quant = getGlobalVezesCorreu;
funcTreino = get(handles.popupmenu2,'Value');
cam1Treino = get(handles.popupmenu1, 'Value');
cam2Treino = get(handles.popupmenu3, 'Value');
camadasEscondidas = str2num(get(handles.etCamadasEscondidas, 'String'));
trainTool = get(handles.checkbox3, 'Value');
redeCarregada = getGlobalRedeCarregada;
justUse = get(handles.cbUsar, 'Value');
if justUse == 1.0
    isToTrain = false;
else
    isToTrain = true;
end
if isToTrain == false
    setGlobalTrainedGravar(1);
else
    setGlobalTrainedGravar(0);
end
isToTrainWithProps = get(handles.checkbox4, 'Value');
isToPlot = get(handles.cbGraficos, 'Value');
isToDivideFcn = get(handles.checkbox6, 'Value');
trainRatio = (str2double(get(handles.eTrainRatio,'String'))/100);
valRatio = (str2double(get(handles.eValRatio,'String'))/100);
testRatio = (str2double(get(handles.eTestRatio,'String'))/100);
%nomeRede = getGlobalName;
%nomeRede2 = strcat(nomeRede, 'subespecie');
[rede, tr, percAcerto, time1, epoch1] = notIris(isToTrain, funcTreino, cam1Treino, cam2Treino, trainRatio, valRatio, testRatio, trainTool, isToTrainWithProps, isToDivideFcn, camadasEscondidas, isToPlot, redeCarregada);
setGlobalRede(rede);
setGlobalRedeTR(tr);
percAcerto = round(percAcerto,2);
percAcerto = num2str(percAcerto);
percAcerto = strcat(percAcerto,'%');
set(handles.tAcertoEspecie,'String',percAcerto);
setGlobalTime(time1);
setGlobalEpoch(epoch1);
drawnow
[redesub, trsub, percAcertoSub, time2, epoch2] = notIris_ss(isToTrain, funcTreino, cam1Treino, cam2Treino, trainRatio, valRatio, testRatio, trainTool, isToTrainWithProps, isToDivideFcn, camadasEscondidas, isToPlot, redeCarregada);
percAcertoSub = round(percAcertoSub,2);
percAcertoSub = num2str(percAcertoSub);
percAcertoSub = strcat(percAcertoSub,'%');
set(handles.tAcertoSubEspecie,'String',percAcertoSub);
setGlobalRede2(redesub);
setGlobalRede2TR(trsub);
setGlobalTime2(time2);
setGlobalEpoch2(epoch2);
setGlobalRedeCarregada(0);
quant = quant +1;
setGlobalVezesCorreu(quant);
drawnow
msgbox('O treino da rede foi completado!','Treinar a rede')

% --- Executes on button press in pbGuardarRede.
function pbGuardarRede_Callback(hObject, eventdata, handles)
% hObject    handle to pbGuardarRede (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
quant = getGlobalVezesCorreu;
if quant == 0
    msgbox('Nao existe nenhuma rede!','Guardar a rede')
else
    %nomeRede = getNomeRede;
    %nomeRede2 = strcat(nomeRede,'subespecie');
    redeEspecie = getGlobalRede;
    trEspecie = getGlobalRedeTR;
    redeSubEspecie = getGlobalRede2;
    trSubEspecie = getGlobalRede2TR;
    trainProps = get(handles.checkbox4, 'Value');
    if trainProps == 0.0
        save('redeEspecie.mat','redeEspecie')
        save('trEspecie.mat','trEspecie')
        save('redeSubEspecie.mat','redeSubEspecie')
        save('trSubEspecie.mat','trSubEspecie')
    elseif trainProps == 1.0
        save('redeEspecieProps.mat','redeEspecie')
        save('trEspecieProps.mat','trEspecie')
        save('redeSubEspecieProps.mat','redeSubEspecie')
        save('trSubEspecieProps.mat','trSubEspecie')
    end
    max_alt = getGlobalMaxAltura;
    max_larg = getGlobalMaxLargura;
    matriz_maior = [max_alt; max_larg];
    save('maxMatrice.mat','matriz_maior')
    msgbox('A rede foi guardada com sucesso!','Guardar a rede')
end

% --- Executes on button press in pbCarregarRede.
function pbCarregarRede_Callback(hObject, eventdata, handles)
% hObject    handle to pbCarregarRede (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%nomeRede = getNomeRede;
%nomeRede = strcat(nomeRede,'.mat');
%nomeRede2 = strcat(nomeRede, 'subespecie','.mat');
%setGlobalName(nomeRede);
setGlobalRedeCarregada(1);
msgbox('A rede foi carregada com sucesso!','Treinar a rede')

% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_1_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function mAI_Callback(hObject, eventdata, handles)
% hObject    handle to mAI (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
imagemPersonalizada();

% --------------------------------------------------------------------
function mClose_Callback(hObject, eventdata, handles)
% hObject    handle to mClose (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close all


% --- Executes on button press in pbShow.
function pbShow_Callback(hObject, eventdata, handles)
% hObject    handle to pbShow (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%clc;
winopen('resultados.xlsx')

% --- Executes on button press in pbSave.
function pbSave_Callback(hObject, eventdata, handles)
% hObject    handle to pbSave (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
disp('A gravar rede no ficheiro excel');
quant = getGlobalVezesCorreu;
if quant == 0
    msgbox('Não existem resultados para serem guardados!','Guardar resultados')
else
    % Nome do ficheiro
    nomeFicheiro = get(handles.etFN, 'String');
    wasNot = getGlobalTrainedGravar;
    wasNotTrained = get(handles.cbUsar, 'Value');
    if wasNotTrained == 1.0
        carregada = 'On';
        numImg = num2str(get(handles.tNumFiles, 'String'));
        camadasEscondidas = '-----';
        nomeFuncao1 = '-----';
        nomeFuncao2 = '-----';
        nomeTopologia = '-----';
        treino = '-----';
        validacao = '-----';
        teste = '-----';
        tempoEspecie = '-----';
        tempoSubEspecie = '-----';
        epoch1 = '-----';
        epoch2 = '-----';
        tempoSubEspecie = '-----';
        tempoEspecie = '-----';
        acertoEspecie = num2str(get(handles.tAcertoEspecie, 'String'));
        acertoSubEspecie = num2str(get(handles.tAcertoSubEspecie, 'String'));
    else
        if wasNot == 1.0
            carregada = 'On';
        else
            carregada = 'Off';
        end
        % Camadas escondidas
        camadasEscondidas = get(handles.etCamadasEscondidas, 'String');
        % Nome da primeira funcao de ativacao
        funcao1 = get(handles.popupmenu1, 'Value');
        if funcao1 == 1.0
            nomeFuncao1 = 'Step';
        elseif funcao1 == 2.0
            nomeFuncao1 = 'Linear';
        elseif funcao1 == 3.0
            nomeFuncao1 = 'Sigmoide';
        elseif funcao1 == 4.0
            nomeFuncao1 = 'TanH';
        elseif funcao1 == 5.0
            nomeFuncao1 = 'Sinal';
        end
        % Nome da segunda funcao de ativacao
        funcao2 = get(handles.popupmenu3, 'Value');
        if funcao2 == 1.0
            nomeFuncao2 = 'Step';
        elseif funcao2 == 2.0
            nomeFuncao2 = 'Linear';
        elseif funcao2 == 3.0
            nomeFuncao2 = 'Sigmoide';
        elseif funcao2 == 4.0
            nomeFuncao2 = 'TanH';
        elseif funcao2 == 5.0
            nomeFuncao2 = 'Sinal';
        else
            nomeFuncao2 = 'Nenhuma';
        end
        % Nome da topologia da rede
        topologia = get(handles.popupmenu2, 'Value');
        if topologia == 1.0
            nomeTopologia = 'Perceptron Training Rule';
        elseif topologia == 2.0
            nomeTopologia = 'Gradient Descent';
        elseif topologia == 3.0
            nomeTopologia = 'Stochastic Approximation to Gradient Descent';
        end
        racio = get(handles.checkbox6, 'Value');
        if racio == 1.0
            % RACIO DO TREINO
            treino = get(handles.eTrainRatio, 'String');
            % RACIO DA VALIDACAO
            validacao = get(handles.eValRatio, 'String');
            % RACIO DE TESTE
            teste = get(handles.eTestRatio, 'String');
        else
            treino = '-----';
            validacao = '-----';
            teste = '-----';
        end
        % NUMERO IMAGENS
        numImg = num2str(get(handles.tNumFiles, 'String'));
        % ACERTO ESPECIE
        acertoEspecie = num2str(get(handles.tAcertoEspecie, 'String'));
        % Epoch ESPECIE
        epoch1 = num2str(getGlobalEpoch);
        % Tempo que demorou na ESPECIE
        tempoEspecie = num2str(getGlobalTime);
        % ACERTO SUB ESPECIE
        acertoSubEspecie = num2str(get(handles.tAcertoSubEspecie, 'String'));
        % Epoch SUB ESPECIE
        epoch2 = num2str(getGlobalEpoch2);
        % Tempo que demorou na SUBESPECIE
        tempoSubEspecie = num2str(getGlobalTime2);
    end
    % DESCOBRE INPUTS
    idinputs = get(handles.checkbox4, 'Value');
    if idinputs == 0.0
        inputs = 'Imagem em binário';
    else
        inputs = 'Características da imagem';
    end
    % MATRIZ COM OS DADOS TODOS PRONTA PARA ESCREVER NO EXCEL
    texto = {nomeFicheiro, carregada, inputs, camadasEscondidas, nomeFuncao1, nomeFuncao2, nomeTopologia, treino, validacao, teste, numImg, acertoEspecie, epoch1, tempoEspecie, acertoSubEspecie, epoch2, tempoSubEspecie};
    % PRIMEIRA PÁGINA DO EXCEL
    sheet = 1;
    % ESCREVE NO EXCEL
    [num,txt] = xlsread('resultados.xlsx',sheet);
    %finaltxt = vertcat(txt, texto);
    % Acha ultima linha
    [rows, columns] = size(txt);
    if rows == 1
        rows = 2;
    end
    rows = rows +1;
    % Escrever a começar numa determinada célula
    nomeCelula = strcat('A',num2str(rows));
    xlswrite('resultados.xlsx',texto,sheet,nomeCelula)
    msgbox('Os resultados foram guardados no excel com sucesso!','Guardar resultados')
end

function setGlobalTrainedGravar(val)
global xRedeGravar
xRedeGravar = val;

function r = getGlobalTrainedGravar
global xRedeGravar
r = xRedeGravar;


function setGlobalRede(val)
global xRede
xRede = val;

function r = getGlobalRede
global xRede
r = xRede;

function setGlobalRedeTR(val)
global uRede
uRede = val;

function r = getGlobalRedeTR
global uRede
r = uRede;

function setGlobalRede2(val)
global tRede
tRede = val;

function r = getGlobalRede2
global tRede
r = tRede;

function setGlobalRede2TR(val)
global pRede
pRede = val;

function r = getGlobalRede2TR
global pRede
r = pRede;

function setGlobalName(val)
global zName
zName = val;

function r = getGlobalName
global zName
r = zName;

function r = getNomeRede
prompt = {'Introduza o nome da rede:'};
title = 'Nome da rede';
dims = [1 35];
definput = {'net'};
r = inputdlg(prompt,title,dims, definput);


function setGlobalVezesCorreu(val)
global oVezes
oVezes = val;

function r = getGlobalVezesCorreu
global oVezes
r  = oVezes;

function setGlobalTime(val)
global sTime
sTime = val;

function r = getGlobalTime
global sTime
r = sTime;

function setGlobalTime2(val)
global cTime
cTime = val;

function r = getGlobalTime2
global cTime
r = cTime;

function setGlobalEpoch(val)
global sEpoch
sEpoch = val;

function r = getGlobalEpoch
global sEpoch
r = sEpoch;

function setGlobalEpoch2(val)
global cEpoch
cEpoch = val;

function r = getGlobalEpoch2
global cEpoch
r = cEpoch;

function setGlobalMaxAltura(val)
global cMax
cMax = val;

function r = getGlobalMaxAltura
global cMax
r = cMax;

function setGlobalMaxLargura(val)
global cMaxLarg
cMaxLarg = val;

function r = getGlobalMaxLargura
global cMaxLarg
r = cMaxLarg;

function setGlobalRedeCarregada(val)
global cRedeCarregada
cRedeCarregada = val;

function r = getGlobalRedeCarregada
global cRedeCarregada
r = cRedeCarregada;
% --- Executes on selection change in popupmenu3.
function popupmenu3_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu3 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu3


% --- Executes during object creation, after setting all properties.
function popupmenu3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function eTrainRatio_Callback(hObject, eventdata, handles)
% hObject    handle to eTrainRatio (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of eTrainRatio as text
%        str2double(get(hObject,'String')) returns contents of eTrainRatio as a double


% --- Executes during object creation, after setting all properties.
function eTrainRatio_CreateFcn(hObject, eventdata, handles)
% hObject    handle to eTrainRatio (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function eValRatio_Callback(hObject, eventdata, handles)
% hObject    handle to eValRatio (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of eValRatio as text
%        str2double(get(hObject,'String')) returns contents of eValRatio as a double


% --- Executes during object creation, after setting all properties.
function eValRatio_CreateFcn(hObject, eventdata, handles)
% hObject    handle to eValRatio (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function eTestRatio_Callback(hObject, eventdata, handles)
% hObject    handle to eTestRatio (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of eTestRatio as text
%        str2double(get(hObject,'String')) returns contents of eTestRatio as a double


% --- Executes during object creation, after setting all properties.
function eTestRatio_CreateFcn(hObject, eventdata, handles)
% hObject    handle to eTestRatio (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in checkbox3.
function checkbox3_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox3


% --- Executes on button press in checkbox4.
function checkbox4_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox4


% --- Executes on button press in checkbox6.
function checkbox6_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox6



function etCamadasEscondidas_Callback(hObject, eventdata, handles)
% hObject    handle to etCamadasEscondidas (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of etCamadasEscondidas as text
%        str2double(get(hObject,'String')) returns contents of etCamadasEscondidas as a double


% --- Executes during object creation, after setting all properties.
function etCamadasEscondidas_CreateFcn(hObject, eventdata, handles)
% hObject    handle to etCamadasEscondidas (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in cbGraficos.
function cbGraficos_Callback(hObject, eventdata, handles)
% hObject    handle to cbGraficos (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of cbGraficos


% --- Executes on button press in cbUsar.
function cbUsar_Callback(hObject, eventdata, handles)
% hObject    handle to cbUsar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of cbUsar
