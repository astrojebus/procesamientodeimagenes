function varargout = trangeo(varargin)
% TRANGEO MATLAB code for trangeo.fig
%      TRANGEO, by itself, creates a new TRANGEO or raises the existing
%      singleton*.
%
%      H = TRANGEO returns the handle to a new TRANGEO or the handle to
%      the existing singleton*.
%
%      TRANGEO('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in TRANGEO.M with the given input arguments.
%
%      TRANGEO('Property','Value',...) creates a new TRANGEO or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before trangeo_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to trangeo_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help trangeo

% Last Modified by GUIDE v2.5 02-Dec-2014 23:48:19

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @trangeo_OpeningFcn, ...
                   'gui_OutputFcn',  @trangeo_OutputFcn, ...
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


% --- Executes just before trangeo is made visible.
function trangeo_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to trangeo (see VARARGIN)

% Choose default command line output for trangeo
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes trangeo wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = trangeo_OutputFcn(hObject, eventdata, handles) 
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
end


% --- Executes on button press in btnNuevo.
function btnNuevo_Callback(hObject, eventdata, handles)
cla(handles.imgoriginal,'reset');
msgbox('Imagen borrada');
set(handles.btnAbrir,'Enable','on');
set(handles.btnGuardar,'Enable','off');
set(handles.btnNuevo,'Enable','off');



% --- Executes on button press in btnGuardar.
function btnGuardar_Callback(hObject, eventdata, handles)
global a
[archivo ruta]=uiputfile({'*.jpg';'*.gif';'*.png';'*.bmp'},'Guardar iamgen');
if isequal(archivo,0)
   return
else
    imwrite(a,strcat(ruta,archivo),'quality',10);
    msgbox('Imagen guardada');
    set(handles.btnAbrir,'Enable','on');
    set(handles.btnGuardar,'Enable','off'); 
    set(handles.btnNuevo,'Enable','off');
end


% --- Executes on button press in btnSalir.
function btnSalir_Callback(hObject, eventdata, handles)
close(gcbf)


% --- Executes on button press in btnRotar.
function btnRotar_Callback(hObject, eventdata, handles)
global a
b = str2num(get(handles.txtangulo,'string'));
J = imrotate(a,b,'bilinear');
axes(handles.imgresultado);
imshow(J);

% --- Executes on button press in btnEscalamiento.
function btnEscalamiento_Callback(hObject, eventdata, handles)
global a
b1 = str2num(get(handles.txtfilad,'string'));
b2 = str2num(get(handles.txtcolumnad,'string'));
J = imresize(a,[b1 b2]);
axes(handles.imgresultado);
imshow(J);
    


% --- Executes on button press in btnTraslacion.
function btnTraslacion_Callback(hObject, eventdata, handles)
global a
[m n dim]=size(a);
imgaux=zeros(m,n,dim);
f= str2num(get(handles.txtfilam,'string'));
for i=1:m
    c= str2num(get(handles.txtcolumnam,'string'));
    for j=1:n
        imgaux(f,c,:)=a(i,j,:);
        c=c+1;
    end
    f=f+1;
end
imgaux=uint8(imgaux);
axes(handles.imgresultado);
imshow(imgaux);

function txtcolumnam_Callback(hObject, eventdata, handles)
% hObject    handle to txtcolumnam (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txtcolumnam as text
%        str2double(get(hObject,'String')) returns contents of txtcolumnam as a double


% --- Executes during object creation, after setting all properties.
function txtcolumnam_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtcolumnam (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function txtfilam_Callback(hObject, eventdata, handles)
% hObject    handle to txtfilam (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txtfilam as text
%        str2double(get(hObject,'String')) returns contents of txtfilam as a double


% --- Executes during object creation, after setting all properties.
function txtfilam_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtfilam (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function txtfilad_Callback(hObject, eventdata, handles)
% hObject    handle to txtfilad (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txtfilad as text
%        str2double(get(hObject,'String')) returns contents of txtfilad as a double


% --- Executes during object creation, after setting all properties.
function txtfilad_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtfilad (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function txtcolumnad_Callback(hObject, eventdata, handles)
% hObject    handle to txtcolumnad (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txtcolumnad as text
%        str2double(get(hObject,'String')) returns contents of txtcolumnad as a double


% --- Executes during object creation, after setting all properties.
function txtcolumnad_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtcolumnad (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function txtangulo_Callback(hObject, eventdata, handles)
% hObject    handle to txtangulo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txtangulo as text
%        str2double(get(hObject,'String')) returns contents of txtangulo as a double


% --- Executes during object creation, after setting all properties.
function txtangulo_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtangulo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
