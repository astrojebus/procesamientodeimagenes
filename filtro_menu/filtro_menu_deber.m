function varargout = filtro_menu_deber(varargin)
% FILTRO_MENU_DEBER MATLAB code for filtro_menu_deber.fig
%      FILTRO_MENU_DEBER, by itself, creates a new FILTRO_MENU_DEBER or raises the existing
%      singleton*.
%
%      H = FILTRO_MENU_DEBER returns the handle to a new FILTRO_MENU_DEBER or the handle to
%      the existing singleton*.
%
%      FILTRO_MENU_DEBER('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in FILTRO_MENU_DEBER.M with the given input arguments.
%
%      FILTRO_MENU_DEBER('Property','Value',...) creates a new FILTRO_MENU_DEBER or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before filtro_menu_deber_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to filtro_menu_deber_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help filtro_menu_deber

% Last Modified by GUIDE v2.5 09-Jul-2014 15:33:07

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @filtro_menu_deber_OpeningFcn, ...
                   'gui_OutputFcn',  @filtro_menu_deber_OutputFcn, ...
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


% --- Executes just before filtro_menu_deber is made visible.
function filtro_menu_deber_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to filtro_menu_deber (see VARARGIN)

% Choose default command line output for filtro_menu_deber
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes filtro_menu_deber wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = filtro_menu_deber_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --------------------------------------------------------------------
function Untitled_3_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_8_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_20_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_20 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function btn_maximo_Callback(hObject, eventdata, handles)
% hObject    handle to btn_maximo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function btn_mediana_Callback(hObject, eventdata, handles)
% hObject    handle to btn_mediana (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function btn_minimo_Callback(hObject, eventdata, handles)
% hObject    handle to btn_minimo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function btn_promedio_Callback(hObject, eventdata, handles)
% hObject    handle to btn_promedio (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function btn_gauss_Callback(hObject, eventdata, handles)
global d;
global a;
mf=[1 4 7 4 1; 4 20 33 20 4; 7 33 55 33 7; 4 20 33 20 4; 1 4 7 4 1];
s=sum(sum(mf));
mf=mf/s;
d=imfilter (a,mf);
axes(handles.axes2);
imshow(d);

% --------------------------------------------------------------------
function btn_laplace_Callback(hObject, eventdata, handles)
global a;
global d;
mf=[0 0 -1 0 0; 0 -1 -2 -1 0; -1 -2 16 -2 -1; 0 -1 -2 -1 0; 0 0 -1 0 0];
d=imfilter (a,mf);
axes(handles.axes2);
imshow(d);
% --------------------------------------------------------------------
function btn_replica_Callback(hObject, eventdata, handles)
global a;global f;global m;global n;global w;
[m n]=size(a);
w=zeros(99,99);
w(50,50)=1;
f=imfilter(a,w,'replicate','full');
axes(handles.axes2);
imshow(f);
% --------------------------------------------------------------------
function btn_simetria_Callback(hObject, eventdata, handles)
   set(handles.slider_fil,'Visible','on');
   set(handles.slider_col,'Visible','on');
% --------------------------------------------------------------------
function btn_relleno_Callback(hObject, eventdata, handles)



% --------------------------------------------------------------------
function btn_abrir_Callback(hObject, eventdata, handles)
global a;

[FileName Path]=uigetfile('*.jpg;*.bmp','Abrir Imagen');
if isequal(FileName,0)
    return;
    else
    a=imread(strcat(Path,FileName));
    axes(handles.axes1);
    imshow(a);
    msgbox('Se abrio con exito','abrir');
    set(handles.btn_abrir,'Enable','off');
    set(handles.btn_guardar,'Enable','on');
end


% --------------------------------------------------------------------
function btn_nuevo_Callback(hObject, eventdata, handles)
%set(handles.btnabrir,'Enable','on');
%set(handles.btnguardar,'Enable','off');
imagen=findobj(handles.axes1,'Type','image');
delete(imagen);
imagen2=findobj(handles.axes2,'Type','image');
delete(imagen2);
% --------------------------------------------------------------------
function btn_guardar_Callback(hObject, eventdata, handles)
[Filename Path]=uiputfile('*.jpg;*.bmp','Guardar');
if isequal(Filename,0)
    return;
else

    a = getimage(handles.axes2);
    imwrite(a,strcat(Path,Filename));
    msgbox('La imagen se guardo con éxito');
    set(handles.btn_abrir,'Enable','on');
    set(handles.btn_guardar,'Enable','off');
end
% --------------------------------------------------------------------
function btn7_Callback(hObject, eventdata, handles)
global a;global c; global d;
c=ones(7,7)/49;
d=imfilter(a,c);
axes(handles.axes2);
imshow(d);
% --------------------------------------------------------------------
function btn9_Callback(hObject, eventdata, handles)
global a;global c; global d;
c=ones(9,9)/81;
d=imfilter(a,c);
axes(handles.axes2);
imshow(d);


% --------------------------------------------------------------------
function btn3_minimo_Callback(hObject, eventdata, handles)
global a;global a1;global b;
a1=rgb2gray(a);
fun=@(x)min(x(:));
b=nlfilter(a1,[3 3],fun);
axes(handles.axes2);
imshow(b);


% --------------------------------------------------------------------
function btn5_minimo_Callback(hObject, eventdata, handles)
global a;global a1;global b;
a1=rgb2gray(a);
fun=@(x)min(x(:));
b=nlfilter(a1,[5 5],fun);
axes(handles.axes2);
imshow(b);


% --------------------------------------------------------------------
function btn3_mediana_Callback(hObject, eventdata, handles)
global a;global a1;global b;
a1=rgb2gray(a);
fun=@(x)median(x(:));
b=nlfilter(a1,[3 3],fun);
axes(handles.axes2);
imshow(b);

% --------------------------------------------------------------------
function btn5_mediana_Callback(hObject, eventdata, handles)
global a;global a1;global b;
a1=rgb2gray(a);
fun=@(x)median(x(:));
b=nlfilter(a1,[5 5],fun);
axes(handles.axes2);
imshow(b);

% --------------------------------------------------------------------
function btn3_maximo_Callback(hObject, eventdata, handles)
global a;global a1;global b;
a1=rgb2gray(a);
fun=@(x)max(x(:));
b=nlfilter(a1,[3 3],fun);
axes(handles.axes2);
imshow(b);


% --------------------------------------------------------------------
function btn5_maximo_Callback(hObject, eventdata, handles)
global a;global a1;global b;
a1=rgb2gray(a);
fun=@(x)max(x(:));
b=nlfilter(a1,[5 5],fun);
axes(handles.axes2);
imshow(b);


% --- Executes on slider movement.
function slider1_Callback(hObject, eventdata, handles)

% --- Executes during object creation, after setting all properties.
function slider1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end

% --- Executes on slider movement.
function slider2_Callback(hObject, eventdata, handles)

% --- Executes during object creation, after setting all properties.
function slider2_CreateFcn(hObject, eventdata, handles)

if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --------------------------------------------------------------------
function btn_salir_Callback(hObject, eventdata, handles)
 c=questdlg('Desea salir del programa','salir','si','no','si');
 if strcmp(c,'no')
     return;
 else
     delete(handles.figure1); %saliendo formulario
 end
% --------------------------------------------------------------------
function btn3_Callback(hObject, eventdata, handles)
global a;global c; global d;
c=ones(3,3)/9;
d=imfilter(a,c);
axes(handles.axes2);
imshow(d);

% --------------------------------------------------------------------
function btn5_Callback(hObject, eventdata, handles)
global a;global c; global d;
c=ones(5,5)/25;
d=imfilter(a,c);
axes(handles.axes2);
imshow(d);


% --- Executes on slider movement.
function slider_fil_Callback(hObject, eventdata, handles)
global a ;
    global b;
    global value_f;
    global value_c;
    [f c m]=size(a);
    %set(handles.sliderSimetriaVertical,'Max',f);
    %set(handles.sliderSimetriaVertical,'Min',1);
    set(hObject,'Min',0);
    set(hObject,'Max',f-1);
    value_f=get(handles.slider_fil,'Value')+1;
    value_c=get(handles.slider_col,'Value')+1;
    w=zeros(round(value_f),round(value_c));
    w(1,1)=1;
    b=imfilter(a,w,'symmetric','full');
    axes(handles.axes2);
    imshow(b);

% --- Executes during object creation, after setting all properties.
function slider_fil_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider_fil (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider_col_Callback(hObject, eventdata, handles)
global a ;
global b;
global value_f;
global value_c;
[f c m]=size(a);
set(hObject,'Min',0);
set(hObject,'Max',c);
value_f=get(handles.slider_fil,'Value')+1;
value_c=get(handles.slider_col,'Value')+1;
w=zeros(round(value_f),round(value_c));
w(1,1)=1;
b=imfilter(a,w,'symmetric','full');
axes(handles.axes2);
imshow(b);

% --- Executes during object creation, after setting all properties.
function slider_col_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider_col (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function sliderelleno_Callback(hObject, eventdata, handles)
global a;global f;global w;
valor=get(handles.sliderelleno,'Value');
w=zeros((round(valor)),(round(valor)));
w((round(valor/2)),(round(valor/2)))=1;
f=imfilter(a,w,25,'full');
axes(handles.axes2);
imshow(f);


% --- Executes during object creation, after setting all properties.
function sliderelleno_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sliderelleno (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on button press in togglebutton1.
function togglebutton1_Callback(hObject, eventdata, handles)
% hObject    handle to togglebutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of togglebutton1
