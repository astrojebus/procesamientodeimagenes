function varargout = operacionesIma(varargin)
% OPERACIONESIMA MATLAB code for operacionesIma.fig
%      OPERACIONESIMA, by itself, creates a new OPERACIONESIMA or raises the existing
%      singleton*.
%
%      H = OPERACIONESIMA returns the handle to a new OPERACIONESIMA or the handle to
%      the existing singleton*.
%
%      OPERACIONESIMA('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in OPERACIONESIMA.M with the given input arguments.
%
%      OPERACIONESIMA('Property','Value',...) creates a new OPERACIONESIMA or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before operacionesIma_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to operacionesIma_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help operacionesIma

% Last Modified by GUIDE v2.5 10-Dec-2014 18:55:28

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @operacionesIma_OpeningFcn, ...
                   'gui_OutputFcn',  @operacionesIma_OutputFcn, ...
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


% --- Executes just before operacionesIma is made visible.
function operacionesIma_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to operacionesIma (see VARARGIN)

% Choose default command line output for operacionesIma
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes operacionesIma wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = operacionesIma_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in btnAbrir.
function btnAbrir_Callback(hObject, eventdata, handles)
global a
[archivo ruta]=uigetfile({'*.jpg';'*.gif';'*.png';'*.bmp'},'Abrir imagen');
if isequal(archivo,0)
   return
else
    a=imread(strcat(ruta,archivo));
    axes(handles.imgoriginal);
    imshow(a);
    msgbox('Se abrió con éxito','Mensaje');
    set(handles.btnAbrir,'Enable','off');
    set(handles.btnGuardar,'Enable','on');
    set(handles.btnNuevo,'Enable','on');
    
    set(handles.btnContraste,'Enable','on');
    set(handles.btnIluminacion,'Enable','on');
    set(handles.btnHistograma,'Enable','on');
    set(handles.btnAdaptacion,'Enable','on');
end


% --- Executes on button press in btnNuevo.
function btnNuevo_Callback(hObject, eventdata, handles)
cla(handles.imgoriginal,'reset');
cla(handles.imgresultado,'reset');
msgbox('Imagen borrada');
set(handles.btnAbrir,'Enable','on');
set(handles.btnGuardar,'Enable','off');
set(handles.btnNuevo,'Enable','off');


% --- Executes on button press in btnGuardar.
function btnGuardar_Callback(hObject, eventdata, handles)
global a2
[archivo ruta]=uiputfile({'*.jpg';'*.gif';'*.png';'*.bmp'},'Guardar iamgen');
if isequal(archivo,0)
   return
else
    imwrite(a2,strcat(ruta,archivo),'quality',10);
    msgbox('Imagen guardada');
end


% --- Executes on button press in btnSalir.
function btnSalir_Callback(hObject, eventdata, handles)
close(gcbf)


% --- Executes on button press in btnContraste.
function btnContraste_Callback(hObject, eventdata, handles)
set(handles.grContraste,'Visible','on');
set(handles.grIluminacion,'Visible','off');

% --- Executes on button press in btnIluminacion.
function btnIluminacion_Callback(hObject, eventdata, handles)
set(handles.grContraste,'Visible','off');
set(handles.grIluminacion,'Visible','on');

% --- Executes on button press in btnHistograma.
function btnHistograma_Callback(hObject, eventdata, handles)
set(handles.grContraste,'Visible','off');
set(handles.grIluminacion,'Visible','off');
global a
b=rgb2gray(a);
[cont,x]=imhist(b);
acum=0;
for i=1:256
    h(i)=acum+cont(i);
    acum=h(i);
end
axes(handles.imgresultado);
stem(x,h);

% --- Executes on button press in btnAdaptacion.
function btnAdaptacion_Callback(hObject, eventdata, handles)
global a
set(handles.grContraste,'Visible','off');
set(handles.grIluminacion,'Visible','off');
b=rgb2gray(a);
axes(handles.imgresultado);
imhist(b);

% --- Executes on slider movement.
function sldIluminacion_Callback(hObject, eventdata, handles)
global a
handles.sldIluminacion=get(hObject,'Value'); %Carga en handles.slider1 el valor delSlider
handles.sldIluminacion=100.*handles.sldIluminacion;
set(handles.txtPorcentajeC,'String',handles.sldIluminacion); %Escribe el valor de Slider en statictext
guidata(hObject, handles);
b=rgb2gray(a);
d=b+handles.sldIluminacion;
axes(handles.imgresultado);
imshow(d);


% --- Executes during object creation, after setting all properties.
function sldIluminacion_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sldIluminacion (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function sldContraste_Callback(hObject, eventdata, handles)
global a
handles.sldContraste=get(hObject,'Value'); %Carga en handles.slider1 el valor delSlider
handles.sldContraste=100.*handles.sldContraste;
set(handles.txtPorcentajeC,'String',handles.sldContraste); %Escribe el valor de Slider en statictext
guidata(hObject, handles);
b=rgb2gray(a);
c=b*(1+(handles.sldContraste/100));
axes(handles.imgresultado);
imshow(c);

% --- Executes during object creation, after setting all properties.
function sldContraste_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sldContraste (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
