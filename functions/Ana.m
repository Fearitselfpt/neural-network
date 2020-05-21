function varargout = Ana(varargin)

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Ana_OpeningFcn, ...
                   'gui_OutputFcn',  @Ana_OutputFcn, ...
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


% --- Executes just before Ana is made visible.
function Ana_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Ana (see VARARGIN)

% Choose default command line output for Ana
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Ana wait for user response (see UIRESUME)
% uiwait(handles.figure1);

% Coloca a Fotografia
I=imread('ana.JPG','JPEG');
imshow(I,[],'Parent',handles.axesFoto)

% Coloca as Imagens nos Botoes
[a,map]=imread('fb.JPG');
[r,c,d]=size(a); 
x=ceil(r/30); 
y=ceil(c/30); 
g=a(1:x:end,1:y:end,:);
g(g==255)=5.5*255;
set(handles.btFacebook,'CData',g);

[a,map]=imread('instagram.JPG');
[r,c,d]=size(a); 
x=ceil(r/30); 
y=ceil(c/30); 
g=a(1:x:end,1:y:end,:);
g(g==255)=5.5*255;
set(handles.btInstagram,'CData',g);

[a,map]=imread('linkedin.JPG');
[r,c,d]=size(a); 
x=ceil(r/30); 
y=ceil(c/30); 
g=a(1:x:end,1:y:end,:);
g(g==255)=5.5*255;
set(handles.btLinkedin,'CData',g);

[a,map]=imread('skype.JPG');
[r,c,d]=size(a); 
x=ceil(r/30); 
y=ceil(c/30); 
g=a(1:x:end,1:y:end,:);
g(g==255)=5.5*255;
set(handles.btSkype,'CData',g);

[a,map]=imread('moodle.JPG');
[r,c,d]=size(a); 
x=ceil(r/30); 
y=ceil(c/30); 
g=a(1:x:end,1:y:end,:);
g(g==255)=5.5*255;
set(handles.btMoodle,'CData',g);


% --- Outputs from this function are returned to the command line.
function varargout = Ana_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in sendMail.
function sendMail_Callback(hObject, eventdata, handles)
% hObject    handle to sendMail (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
web('mailto:a21190240@alunos.isec.pt', '-browser')

% --- Executes during object creation, after setting all properties.
function axesFoto_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axesFoto (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axesFoto



% --- Executes on button press in btLinkedin.
function btLinkedin_Callback(hObject, eventdata, handles)
% hObject    handle to btLinkedin (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
web('https://www.linkedin.com/in/ana-farinha-alves/', '-browser')

% --- Executes on button press in btSkype.
function btSkype_Callback(hObject, eventdata, handles)
% hObject    handle to btSkype (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
uiwait(msgbox('Nome de utilizador: meiapeuga2','Skype','modal'));

% --- Executes on button press in btMoodle.
function btMoodle_Callback(hObject, eventdata, handles)
% hObject    handle to btMoodle (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
web('https://moodle.isec.pt/moodle/user/profile.php?id=2944', '-browser')

% --- Executes on button press in btFacebook.
function btFacebook_Callback(hObject, eventdata, handles)
% hObject    handle to btFacebook (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
web('https://www.facebook.com/profile.php?id=100004369864990', '-browser')

% --- Executes on button press in btInstagram.
function btInstagram_Callback(hObject, eventdata, handles)
% hObject    handle to btInstagram (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
web('https://www.instagram.com/anaaaaaa4/', '-browser')
