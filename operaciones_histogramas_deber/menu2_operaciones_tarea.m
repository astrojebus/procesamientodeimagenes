function varargout = menu2_operaciones_tarea(varargin)
% MENU2_OPERACIONES_TAREA MATLAB code for menu2_operaciones_tarea.fig
%      MENU2_OPERACIONES_TAREA, by itself, creates a new MENU2_OPERACIONES_TAREA or raises the existing
%      singleton*.
%
%      H = MENU2_OPERACIONES_TAREA returns the handle to a new MENU2_OPERACIONES_TAREA or the handle to
%      the existing singleton*.
%
%      MENU2_OPERACIONES_TAREA('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MENU2_OPERACIONES_TAREA.M with the given input arguments.
%
%      MENU2_OPERACIONES_TAREA('Property','Value',...) creates a new MENU2_OPERACIONES_TAREA or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before menu2_operaciones_tarea_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to menu2_operaciones_tarea_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help menu2_operaciones_tarea

% Last Modified by GUIDE v2.5 22-Jun-2014 23:43:49

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @menu2_operaciones_tarea_OpeningFcn, ...
                   'gui_OutputFcn',  @menu2_operaciones_tarea_OutputFcn, ...
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


% --- Executes just before menu2_operaciones_tarea is made visible.
function menu2_operaciones_tarea_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to menu2_operaciones_tarea (see VARARGIN)

% Choose default command line output for menu2_operaciones_tarea
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes menu2_operaciones_tarea wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = menu2_operaciones_tarea_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --------------------------------------------------------------------
function Untitled_1_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function btn_abrir_Callback(hObject, eventdata, handles)
global a;    
global b;
global a1;
global b1;
[FileName Path]=uigetfile('*.jpg;*.bpm','brir imagen');
if isequal(FileName,0)
return;
else
a=imread(strcat(Path,FileName));
[Archivo Ruta]=uigetfile('*.jpg;*.bpm','brir imagen');
if isequal(Archivo,0)
return;
else
[ma na da]=size(a);
b=imread(strcat(Path,Archivo));
b=imresize(b,[ma na]);
a1=im2double(a);
b1=im2double(b);
axes(handles.axes1);
imshow(a);
%msgbox('Se abrio con exito','abrir');
axes(handles.axes2);
imshow(b);
%msgbox('Se abrio con exito','abrir');
%set(handles.btnsalir,'Enable','on');
%set(handles.btnabrir,'Enable','off');
end
end
 
% --------------------------------------------------------------------
function btn_guardar_Callback(hObject, eventdata, handles)
  global a;
    global contraste;
    [Filename Path]=uiputfile('*.jpg;*.bmp','Guardar');
    if isequal(Filename,0)
        return;
    else
        contraste=get(handles.slider1,'String');
        contraste=str2double(contraste);
    if ((contraste>=0)&&(contraste<=100))
        imwrite(a,strcat(Path,Filename),'quality',contraste);
        msgbox('La imagen se guardo con éxito');
        axes(handles.axes1);
        imshow(a);

    else
        msgbox('La calidad no esta en el intervalo');
    end   
end



% --------------------------------------------------------------------
function Untitled_4_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Histograma_Callback(hObject, eventdata, handles)
% hObject    handle to Histograma (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function btn_histograma_Callback(hObject, eventdata, handles)
global a;global escala;global d;
global calidad;
escala=rgb2gray(a);
    calidad=get(handles.slider1,'Value');
    %calidad=str2double(calidad);
    if((calidad>=0) && (calidad<=100))
    d=escala+calidad;
    axes(handles.axes3);
    imhist(d);
    %msgbox('imagen guardada con exito','guardar');
    %set(handles.btnguardar,'Enable','off');
    %set(handles.btnabrir,'Enable','on');
    else
    msgbox('calidad no esta en el intervalo');
    end
% --------------------------------------------------------------------
function btn_acumulativo_Callback(hObject, eventdata, handles)
global b;   global c; 
%global cont;
%global x; 
%global acum;%global h;
 global valor_rojo;global valor_verde;global valor_azul;%global i;
    c=rgb2gray(b);
    [cont,x]=imhist(c);
    acum=valor_rojo+valor_verde+valor_azul;
    for i=1:256
    h(i)=acum+cont(i);
    acum=h(i);
    end
    axes(handles.axes3);
    stem(x,h);
    msgbox('El histograma se ejecuto correctamente', 'Aviso');


% --------------------------------------------------------------------
function btn_suma_Callback(hObject, eventdata, handles)
global a;    
global b;
global c;
global a1;
global b1;
a1=im2double(a);
b1=im2double(b);
c=a1+b1;
c=im2uint8(c);
axes(handles.axes3);
imshow(c);

% --------------------------------------------------------------------
function btn_resta_Callback(hObject, eventdata, handles)
global a;    
global b;
global c;
global a1;
global b1;
a1=im2double(a);
b1=im2double(b);
c=a1-b1;
c=im2uint8(c);
axes(handles.axes3);
imshow(c);


% --------------------------------------------------------------------
function btn_and_Callback(hObject, eventdata, handles)
global a;    
global b;
global e;
global bwa;
global bwb;
bwa=im2bw(a,0.5);
bwb=im2bw(b,0.5);
e=and(bwa,bwb);
axes(handles.axes3);
imshow(e);

% --------------------------------------------------------------------
function btn_or_Callback(hObject, eventdata, handles)
global a;    
global b;
global o;
global bwa;
global bwb;
bwa=im2bw(a,0.5);
bwb=im2bw(b,0.5);
o=or(bwa,bwb);
axes(handles.axes3);
imshow(o);
% --------------------------------------------------------------------
function btn_xor_Callback(hObject, eventdata, handles)
global a;    
global b;
global xo;
global bwa;
global bwb;
bwa=im2bw(a,0.5);
bwb=im2bw(b,0.5);
xo=not(or(bwa,bwb));
axes(handles.axes3);
imshow(xo);

% --------------------------------------------------------------------
function btn_nand_Callback(hObject, eventdata, handles)
global a;    
global b;
global h;
global bwa;
global bwb;
bwa=im2bw(a,0.5);
bwb=im2bw(b,0.5);
h=not(and(bwa,bwb));
axes(handles.axes3);
imshow(h);
% --- Executes on slider movement.
function slider1_Callback(hObject, eventdata, handles)
global a; global con;
    global contraste;
    contraste=get(handles.slider1,'Value');
    set (handles.slider1,'String',contraste);
    con=a*contraste;
    axes(handles.axes3);
    imshow(con);
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
function slider_rojo_Callback(hObject, eventdata, handles)
    global b;global c;
    global valor_rojo;
    valor_rojo=get(handles.slider_rojo,'Value');
    set (handles.slider_rojo,'String',valor_rojo);
    c(:,:,1)=valor_rojo-b(:,:,1);
    axes(handles.axes2);
    imshow(c);


% --- Executes during object creation, after setting all properties.
function slider_rojo_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider_rojo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider_verde_Callback(hObject, eventdata, handles)
    global b;global c;
    global valor_verde;
    valor_verde=get(handles.slider_verde,'Value');
    set(handles.slider_verde,'String',valor_verde);
    c(:,:,2)=valor_verde-b(:,:,2);
    axes(handles.axes2);
    imshow(c);

% --- Executes during object creation, after setting all properties.
function slider_verde_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider_verde (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider_azul_Callback(hObject, eventdata, handles)
 global b;global c;
 global valor_azul;
    valor_azul=get(handles.slider_azul,'Value');
    set (handles.slider_azul,'String',valor_azul);
    c(:,:,3)=valor_azul-b(:,:,3);
    axes(handles.axes2);
    imshow(c);

% --- Executes during object creation, after setting all properties.
function slider_azul_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider_azul (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --------------------------------------------------------------------
function btn_salir_Callback(hObject, eventdata, handles)
 global salir;
    salir=questdlg('Desea salir del programa','Salir','Si','No','Si');
    if strcmp(salir,'No')
        return;
    else
        delete(handles.figure1); %Saliendo del formulario
    end

% --------------------------------------------------------------------
