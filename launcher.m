function varargout = launcher(varargin)
% LAUNCHER MATLAB code for launcher.fig
%      LAUNCHER, by itself, creates a new LAUNCHER or raises the existing
%      singleton*.
%
%      H = LAUNCHER returns the handle to a new LAUNCHER or the handle to
%      the existing singleton*.
%
%      LAUNCHER('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in LAUNCHER.M with the given input arguments.
%
%      LAUNCHER('Property','Value',...) creates a new LAUNCHER or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before launcher_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to launcher_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help launcher

% Last Modified by GUIDE v2.5 21-Jun-2018 09:07:11

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @launcher_OpeningFcn, ...
                   'gui_OutputFcn',  @launcher_OutputFcn, ...
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

% Forçar o adicionar das subpastas aos diretorios de pesquisa
AUX1 = size(mfilename('fullpath'));
AUX2 = AUX1(2);
AUX3 = mfilename('fullpath');
AUX4 = size(mfilename);
AUX5 = AUX3( 1 :( AUX2 - AUX4(2) ) );
CURRENTPATH = AUX5;
cd(CURRENTPATH)
addpath(genpath(pwd))
% End initialization code - DO NOT EDIT


% --- Executes just before launcher is made visible.
function launcher_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to launcher (see VARARGIN)

% Choose default command line output for launcher
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);
% UIWAIT makes launcher wait for user response (see UIRESUME)
% uiwait(handles.figure1);
clear;
clc;

% --- Outputs from this function are returned to the command line.
function varargout = launcher_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pbPrograma.
function pbPrograma_Callback(hObject, eventdata, handles)
% hObject    handle to pbPrograma (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
tp();

% --- Executes on button press in pbAutores.
function pbAutores_Callback(hObject, eventdata, handles)
% hObject    handle to pbAutores (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Autores();

% --- Executes on button press in pbRelatorio.
function pbRelatorio_Callback(hObject, eventdata, handles)
% hObject    handle to pbRelatorio (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
winopen('relatório.pdf')
