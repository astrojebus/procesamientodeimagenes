function varargout = filtro_menu_2(varargin)
% FILTRO_MENU_2 MATLAB code for filtro_menu_2.fig
%      FILTRO_MENU_2, by itself, creates a new FILTRO_MENU_2 or raises the existing
%      singleton*.
%
%      H = FILTRO_MENU_2 returns the handle to a new FILTRO_MENU_2 or the handle to
%      the existing singleton*.
%
%      FILTRO_MENU_2('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in FILTRO_MENU_2.M with the given input arguments.
%
%      FILTRO_MENU_2('Property','Value',...) creates a new FILTRO_MENU_2 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before filtro_menu_2_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to filtro_menu_2_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help filtro_menu_2

% Last Modified by GUIDE v2.5 27-Jul-2014 23:44:14

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @filtro_menu_2_OpeningFcn, ...
                   'gui_OutputFcn',  @filtro_menu_2_OutputFcn, ...
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


% --- Executes just before filtro_menu_2 is made visible.
function filtro_menu_2_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to filtro_menu_2 (see VARARGIN)

% Choose default command line output for filtro_menu_2
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes filtro_menu_2 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = filtro_menu_2_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --------------------------------------------------------------------
function btn_imagen_Callback(hObject, eventdata, handles)
% hObject    handle to btn_imagen (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_6_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function btn_promedio_Callback(hObject, eventdata, handles)
global aux;
 aux=1;
    set(handles.panel3,'Visible','on');
    set(handles.text_fil,'Visible','on');
    set(handles.text_col,'Visible','on');
    set(handles.text_desv,'Visible','off');
    set(handles.edit_fil,'Visible','on');
    set(handles.edit_col,'Visible','on');
    set(handles.edit_radio,'Visible','off');
    set(handles.btn_convertir,'Visible','on');
% --------------------------------------------------------------------
function btn_Promedio_Circular_Callback(hObject, eventdata, handles)
global aux;
 aux=2;
    set(handles.panel3,'Visible','on');
    set(handles.text_fil,'Visible','off');
    set(handles.text_col,'Visible','off');
    set(handles.text_desv,'Visible','on');
    set(handles.edit_fil,'Visible','off');
    set(handles.edit_col,'Visible','off');
    set(handles.edit_radio,'Visible','on');
    set(handles.btn_convertir,'Visible','on');

% --------------------------------------------------------------------
function btn_Gaussiano_Callback(hObject, eventdata, handles)
global aux;
 aux=3;
    set(handles.panel3,'Visible','on');
    set(handles.text_fil,'Visible','on');
    set(handles.text_col,'Visible','on');
    set(handles.text_desv,'Visible','on');
    set(handles.edit_fil,'Visible','on');
    set(handles.edit_col,'Visible','on');
    set(handles.edit_radio,'Visible','on');
    set(handles.btn_convertir,'Visible','on');
% --------------------------------------------------------------------
function btn_Laplace_Callback(hObject, eventdata, handles)
global aux;
 aux=4;
    set(handles.panel3,'Visible','on');
    set(handles.text_fil,'Visible','off');
    set(handles.text_col,'Visible','off');
    set(handles.text_desv,'Visible','on');
    set(handles.edit_fil,'Visible','off');
    set(handles.edit_col,'Visible','off');
    set(handles.edit_radio,'Visible','on');
    set(handles.btn_convertir,'Visible','on');
% --------------------------------------------------------------------
function btn_Logaritmico_Callback(hObject, eventdata, handles)
global aux;
 aux=5;
    set(handles.panel3,'Visible','on');
    set(handles.text_fil,'Visible','on');
    set(handles.text_col,'Visible','on');
    set(handles.text_desv,'Visible','on');
    set(handles.edit_fil,'Visible','on');
    set(handles.edit_col,'Visible','on');
    set(handles.edit_radio,'Visible','on');
    set(handles.btn_convertir,'Visible','on');

% --------------------------------------------------------------------
function btn_Movimiento_Callback(hObject, eventdata, handles)
global aux;
 aux=6;
    set(handles.panel3,'Visible','on');
    set(handles.text_fil,'Visible','off');
    set(handles.text_col,'Visible','off');
    set(handles.text_desv,'Visible','off');
    set(handles.edit_fil,'Visible','off');
    set(handles.edit_col,'Visible','off');
    set(handles.edit_radio,'Visible','off');
    set(handles.edit_des,'Visible','on');
    set(handles.edit_angulo,'Visible','on');
    set(handles.text_desplazamiento,'Visible','on');
    set(handles.text_angulo,'Visible','on');
    set(handles.btn_convertir,'Visible','on');

% --------------------------------------------------------------------
function btn_Prewitt_Callback(hObject, eventdata, handles)
% hObject    handle to btn_Prewitt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function btn_Sobel_Callback(hObject, eventdata, handles)
% hObject    handle to btn_Sobel (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function btn_dibujo_lapiz_Callback(hObject, eventdata, handles)
global a; global f;global f1;global g;
a1=rgb2gray(a);
mf=fspecial('prewitt');
f=imfilter(a1,mf);
f1=imfilter(a1,mf');
g=f+f1;
c=max(max(g))-g;
axes(handles.axes2)
imshow(c);
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
    %set(handles.btnsalir,'Enable','on');
    %set(handles.btnabrir,'Enable','off');
end




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
function btn_nuevo_Callback(hObject, eventdata, handles)
imagen=findobj(handles.axes1,'Type','image');
delete(imagen);
imagen2=findobj(handles.axes2,'Type','image');
delete(imagen2);

% --------------------------------------------------------------------
function btn_salir_Callback(hObject, eventdata, handles)
 c=questdlg('Desea salir del programa','salir','si','no','si');
 if strcmp(c,'no')
     return;
 else
     delete(handles.figure1); %saliendo formulario
 end
% --------------------------------------------------------------------
function btn_Horizontal_Sobel_Callback(hObject, eventdata, handles)
global a;
a1=rgb2gray(a);
mf=fspecial('sobel');
f=imfilter(a1,mf);
axes(handles.axes2)
imshow(f);

% --------------------------------------------------------------------
function btn_Vertical_Sobel_Callback(hObject, eventdata, handles)
global a; global f;
a1=rgb2gray(a);
mf=fspecial('sobel');
f=imfilter(a1,mf);
f1=imfilter(a1,mf');
axes(handles.axes2)
imshow(f1);
% --------------------------------------------------------------------
function btn_General_Sobel_Callback(hObject, eventdata, handles)
global a; global f;global f1;
a1=rgb2gray(a);
mf=fspecial('sobel');
f=imfilter(a1,mf);
f1=imfilter(a1,mf');
g=f+f1;
axes(handles.axes2)
imshow(g);
% --------------------------------------------------------------------
function btn_Horizontal_Prewitt_Callback(hObject, eventdata, handles)
global a;
a1=rgb2gray(a);
mf=fspecial('prewitt');
f=imfilter(a1,mf);
axes(handles.axes2)
imshow(f);
% --------------------------------------------------------------------
function btn_Vertical_Prewitt_Callback(hObject, eventdata, handles)
global a; global f;
a1=rgb2gray(a);
mf=fspecial('prewitt');
f=imfilter(a1,mf);
f1=imfilter(a1,mf');
axes(handles.axes2)
imshow(f1);
% --------------------------------------------------------------------
function btn_General_Prewitt_Callback(hObject, eventdata, handles)
global a; global f;global f1;
a1=rgb2gray(a);
mf=fspecial('prewitt');
f=imfilter(a1,mf);
f1=imfilter(a1,mf');
g=f+f1;
axes(handles.axes2)
imshow(g);
function edit4_Callback(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit4 as text
%        str2double(get(hObject,'String')) returns contents of edit4 as a double


% --- Executes during object creation, after setting all properties.
function edit4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in btn_convertir_radio.
function btn_convertir_radio_Callback(hObject, eventdata, handles)
global a;global f;
f=get(handles.edit4,'String');
f=str2num(f);
h=fspecial('disk',f);
b=imfilter(a,h);
axes(handles.axes2)
imshow(b);
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


% --- Executes on button press in btn_convertir_promedio.
function btn_convertir_promedio_Callback(hObject, eventdata, handles)


function edit_fil_Callback(hObject, eventdata, handles)
% hObject    handle to edit_fil (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_fil as text
%        str2double(get(hObject,'String')) returns contents of edit_fil as a double


% --- Executes during object creation, after setting all properties.
function edit_fil_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_fil (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_col_Callback(hObject, eventdata, handles)
% hObject    handle to edit_col (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_col as text
%        str2double(get(hObject,'String')) returns contents of edit_col as a double


% --- Executes during object creation, after setting all properties.
function edit_col_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_col (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in btn_convertir.
function btn_convertir_Callback(hObject, eventdata, handles)
   global a;global j; global k;global b;global angulo;global desplazamiento;
   global aux;global desv;global h;global f;
    j=get(handles.edit_fil, 'String');
    k=get(handles.edit_col, 'String');
    desplazamiento=get(handles.edit_des,'String');
    angulo=get(handles.edit_angulo,'String');
    desv=get(handles.edit_radio,'String');
    j=str2num(j);
    k=str2num(k);
    desv=str2num(desv);
    desplazamiento=str2num(desplazamiento);
    angulo=str2num(angulo);
    
    if aux==1 
    h=fspecial ('average', [j k]);
    f=imfilter(a,h);
    axes(handles.axes2)
    imshow(f);
    else if aux==2
       h=fspecial('disk',desv);
       f=imfilter(a,h);
       axes(handles.axes2)
       imshow(f);
        else if aux==3
            h=fspecial('gaussian',[j,k],desv);
            f=imfilter(a,h);
            axes(handles.axes2)
            imshow(f);
            else if aux==4
            h=fspecial('laplacian',desv);
            f=imfilter(a,h);
            axes(handles.axes2)
            imshow(f);   
             else if aux==5
            h=fspecial('log',[j,k],desv);
            b=imfilter(a,h);
            axes(handles.axes2)
            imshow(b);
                      else if aux==6
            h=fspecial('motion',desplazamiento,angulo);
            b=imfilter(a,h);
            axes(handles.axes2)
            imshow(b);
    end
    end
    end    
    end 
    end
    end

function edit_radio_Callback(hObject, eventdata, handles)
% hObject    handle to edit_radio (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_radio as text
%        str2double(get(hObject,'String')) returns contents of edit_radio as a double


% --- Executes during object creation, after setting all properties.
function edit_radio_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_radio (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_des_Callback(hObject, eventdata, handles)
% hObject    handle to edit_des (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_des as text
%        str2double(get(hObject,'String')) returns contents of edit_des as a double


% --- Executes during object creation, after setting all properties.
function edit_des_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_des (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_angulo_Callback(hObject, eventdata, handles)
% hObject    handle to edit_angulo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_angulo as text
%        str2double(get(hObject,'String')) returns contents of edit_angulo as a double


% --- Executes during object creation, after setting all properties.
function edit_angulo_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_angulo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
