function varargout = OperacionesImagenes_Grafica(varargin)
% OPERACIONESIMAGENES_GRAFICA MATLAB code for OperacionesImagenes_Grafica.fig
%      OPERACIONESIMAGENES_GRAFICA, by itself, creates a new OPERACIONESIMAGENES_GRAFICA or raises the existing
%      singleton*.
%
%      H = OPERACIONESIMAGENES_GRAFICA returns the handle to a new OPERACIONESIMAGENES_GRAFICA or the handle to
%      the existing singleton*.
%
%      OPERACIONESIMAGENES_GRAFICA('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in OPERACIONESIMAGENES_GRAFICA.M with the given input arguments.
%
%      OPERACIONESIMAGENES_GRAFICA('Property','Value',...) creates a new OPERACIONESIMAGENES_GRAFICA or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before OperacionesImagenes_Grafica_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to OperacionesImagenes_Grafica_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help OperacionesImagenes_Grafica

% Last Modified by GUIDE v2.5 20-Jun-2014 21:42:39

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @OperacionesImagenes_Grafica_OpeningFcn, ...
                   'gui_OutputFcn',  @OperacionesImagenes_Grafica_OutputFcn, ...
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


% --- Executes just before OperacionesImagenes_Grafica is made visible.
function OperacionesImagenes_Grafica_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to OperacionesImagenes_Grafica (see VARARGIN)

% Choose default command line output for OperacionesImagenes_Grafica
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes OperacionesImagenes_Grafica wait for user response (see UIRESUME)
% uiwait(handles.frmoperaciones);


% --- Outputs from this function are returned to the command line.
function varargout = OperacionesImagenes_Grafica_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on slider movement.
function sld_contraste_Callback(hObject, eventdata, handles)
    global a;
    global contraste;
    contraste=get(handles.sld_contraste,'Value');
    set (handles.sld_contraste,'String',contraste);
    c=a*contraste;
    axes(handles.img3);
    imshow(c);

% --- Executes during object creation, after setting all properties.
function sld_contraste_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sld_contraste (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function sld_rojo_Callback(hObject, eventdata, handles)
    global b;
    global valor;
    valor=get(handles.sld_rojo,'Value');
    set (handles.sld_rojo,'String',valor);
    c(:,:,1)=valor-b(:,:,1);
    c(:,:,2)=valor-b(:,:,2);
    c(:,:,3)=valor-b(:,:,3);
    axes(handles.img2);
    imshow(c);

% --- Executes during object creation, after setting all properties.
function sld_rojo_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sld_rojo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function sld_verde_Callback(hObject, eventdata, handles)
% hObject    handle to sld_verde (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function sld_verde_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sld_verde (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function sld_azul_Callback(hObject, eventdata, handles)
% hObject    handle to sld_azul (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function sld_azul_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sld_azul (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --------------------------------------------------------------------
function mnu_imagen_Callback(hObject, eventdata, handles)
% hObject    handle to mnu_imagen (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function mnu_operaciones_Callback(hObject, eventdata, handles)
     set(handles.btn_abrir2,'Enable','on');


% --------------------------------------------------------------------
function mnu_histogramaGeneral_Callback(hObject, eventdata, handles)
    set(handles.btn_abrir2,'Enable','off');


% --------------------------------------------------------------------
function mnu_histograma_Callback(hObject, eventdata, handles)
    global a; 
    b=rgb2gray(a);
    axes(handles.img3);
    imhist(b);
    msgbox('El histograma se ejecuto correctamente', 'Aviso');

% --------------------------------------------------------------------
function mnu_acumulativo_Callback(hObject, eventdata, handles)
    global b;   
    c=rgb2gray(b);
    [cont,x]=imhist(c);
    acum=0;
    for i=1:256
        h(i)=acum+cont(i);
        acum=h(i);
    end
    axes(handles.img3);
    stem(x,h);
    msgbox('El histograma se ejecuto correctamente', 'Aviso');


% --------------------------------------------------------------------
function mnu_suma_Callback(hObject, eventdata, handles)
    global a;     global b;   
    global Ruta;  global Archivo; 
        [ma na da]=size(a);
        b=imread(strcat(Ruta, Archivo)); 
        b=imresize(b, [ma na]);
        b1=im2double(b);     a1=im2double(a);
        c=a1+b1;
        c=im2uint8(c);
        axes(handles.img3);
        imshow(c);

% --------------------------------------------------------------------
function mnu_resta_Callback(hObject, eventdata, handles)
    global a;     global b;   
    global Ruta;  global Archivo; 
        [ma na da]=size(a);
        b=imread(strcat(Ruta, Archivo)); 
        b=imresize(b, [ma na]);
        b1=im2double(b);     a1=im2double(a);
        c=a1-b1;
        c=im2uint8(c);
        axes(handles.img3);
        imshow(c);
       

% --------------------------------------------------------------------
function mnu_and_Callback(hObject, eventdata, handles)
    global a;     global b;  
    global Ruta;  global Archivo; 
        [ma na da]=size(a);
        b=imread(strcat(Ruta, Archivo)); 
        b=imresize(b, [ma na]);
        bwa=im2bw(a,0.5);
        bwb=im2bw(b,0.5);
        c=and(bwa,bwb);
        axes(handles.img3);
        imshow(c);
       

% --------------------------------------------------------------------
function mnu_or_Callback(hObject, eventdata, handles)
    global a;     global b; 
    global Ruta;  global Archivo; 
        [ma na da]=size(a);
        b=imread(strcat(Ruta, Archivo)); 
        b=imresize(b, [ma na]);
        bwa=im2bw(a,0.5);
        bwb=im2bw(b,0.5);
        c=or(bwa,bwb);
        axes(handles.img3);
        imshow(c);
       

% --------------------------------------------------------------------
function mnu_nand_Callback(hObject, eventdata, handles)
    global a;     global b; 
    global Ruta;  global Archivo; 
        [ma na da]=size(a);
        b=imread(strcat(Ruta, Archivo)); 
        b=imresize(b, [ma na]);
        bwa=im2bw(a,0.5);
        bwb=im2bw(b,0.5);
        c=not(and(bwa,bwb));
        axes(handles.img3);
        imshow(c);
       

% --------------------------------------------------------------------
function mnu_xor_Callback(hObject, eventdata, handles)
    global a;     global b; 
    global Ruta;  global Archivo; 
        [ma na da]=size(a);
        b=imread(strcat(Ruta, Archivo)); 
        b=imresize(b, [ma na]);
        bwa=im2bw(a,0.5);
        bwb=im2bw(b,0.5);
        c=not(or(bwa,bwb));
        axes(handles.img3);
        imshow(c);
       

% --------------------------------------------------------------------
function mnu_abrir_Callback(hObject, eventdata, handles)
    global a;
    [Filename Path]=uigetfile('*.jpg;*.bmp; *.png','Abrir imagen');
    a= imread(strcat(Path, Filename));
    axes(handles.img1);
    imshow(a);
    msgbox('Se abrió con éxito', 'Abrir');
   



% --------------------------------------------------------------------
function mnu_guardar_Callback(hObject, eventdata, handles)
    global a;
    global contraste;
    [Filename Path]=uiputfile('*.jpg;*.bmp','Guardar');
    if isequal(Filename,0)
        return;
    else
        contraste=get(handles.sld_contraste,'String');
        contraste=str2double(contraste);
    if ((contraste>=0)&&(contraste<=100))
        imwrite(a,strcat(Path,Filename),'quality',contraste);
        msgbox('La imagen se guardo con éxito');
        axes(handles.img1);
        imshow(a);

    else
        msgbox('La calidad no esta en el intervalo');
    end   
end

% --- Executes on button press in btn_salir.
function btn_salir_Callback(hObject, eventdata, handles)
    global b;
    b=questdlg('Desea salir del programa','Salir','Si','No','Si');
    if strcmp(b,'No')
        return;
    else
        delete(handles.frmoperaciones); %Saliendo del formulario
    end


% --- Executes on button press in btn_abrir2.
function btn_abrir2_Callback(hObject, eventdata, handles)
    global b; global Ruta;   global Archivo;
    [Archivo Ruta]=uigetfile('*.jpg;*.bmp; *.png','Abrir imagen');
    b = imread(strcat(Ruta, Archivo));
    axes(handles.img2);
    imshow(b);
    msgbox('Se abrió con éxito', 'Abrir');
