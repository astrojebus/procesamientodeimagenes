function varargout = lectura(varargin)
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @lectura_OpeningFcn, ...
                   'gui_OutputFcn',  @lectura_OutputFcn, ...
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
function lectura_OpeningFcn(hObject, eventdata, handles, varargin)

handles.output = hObject;
guidata(hObject, handles);

function varargout = lectura_OutputFcn(hObject, eventdata, handles) 

varargout{1} = handles.output;

function btnabrir_Callback(hObject, eventdata, handles)
global a;

[FileName Path]=uigetfile('*.jpg;*.bmp','Abrir Imagen');
if isequal(FileName,0)
    return;
    else
    a=imread(strcat(Path,FileName));
    axes(handles.img1);
    imshow(a);
    msgbox('Se abrio con exito','abrir');
    set(handles.btnsalir,'Enable','on');
    set(handles.btnabrir,'Enable','off');
end

% --- Executes on button press in btnsalir.
function btnsalir_Callback(hObject, eventdata, handles)
 c=questdlg('Desea salir del programa','salir','si','no','si');
 if strcmp(c,'no')
     return;
 else
     delete(handles.frmimagen); %saliendo formulario
 end
 
function btnguardar_Callback(hObject, eventdata, handles)
global a;
global calidad;
[FileName Path]=uiputfile('*.jpg;*.bmp','Guardar Imagen');
if isequal(FileName,0)
    return;
else
    calidad=get(handles.slider1,'Value');
    %calidad=str2double(calidad);
    if((calidad>=0) && (calidad<=100))
    imwrite(a,strcat(Path, FileName),'quality',calidad);
    msgbox('imagen guardada con exito','guardar');
    set(handles.btnguardar,'Enable','off');
    set(handles.btnabrir,'Enable','on');
    else
    msgbox('calidad no esta en el intervalo');
    end
    b=imread(strcat(Path,FileName));
    axes(handles.img2);
    imshow(b);
    end
%end
%handles.direccion=strcat(Path,FileName); 
%guidata(hObject,handles) 
%end

function edtcalidad_Callback(hObject, eventdata, handles)

function edtcalidad_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --------------------------------------------------------------------
function mnuimagen_Callback(hObject, eventdata, handles)



% --------------------------------------------------------------------
function mnuabrir_Callback(hObject, eventdata, handles)
global a;

[FileName Path]=uigetfile('*.jpg;*.bmp','Abrir Imagen');
if isequal(FileName,0)
    return;
    else
    a=imread(strcat(Path,FileName));
    axes(handles.img1);
    imshow(a);
    msgbox('Se abrio con exito','abrir');
    set(handles.mnusalir,'Enable','on');
    set(handles.mnuabrir,'Enable','off');
end

% --------------------------------------------------------------------
function mnuguardar_Callback(hObject, eventdata, handles)
global a;
global calidad;
[FileName Path]=uiputfile('*.jpg;*.bmp','Guardar Imagen');
if isequal(FileName,0)
    return;
else
    calidad=get(handles.slider1,'Value');
    %calidad=str2double(calidad);
    if((calidad>=0) && (calidad<=100))
    imwrite(a,strcat(Path, FileName),'quality',calidad);
    msgbox('imagen guardada con exito','guardar');
    set(handles.mnuguardar,'Enable','off');
    set(handles.mnuabrir,'Enable','on');
    else
    msgbox('calidad no esta en el intervalo');
    end
    b=imread(strcat(Path,FileName));
    axes(handles.img2);
    imshow(b);
    end
% --------------------------------------------------------------------
function mnusalir_Callback(hObject, eventdata, handles)
 c=questdlg('Desea salir del programa','salir','si','no','si');
 if strcmp(c,'no')
     return;
 else
     delete(handles.frmimagen); %saliendo formulario
 end

function btnnuevo_Callback(hObject, eventdata, handles)
set(handles.btnabrir,'Enable','on');
set(handles.btnguardar,'Enable','on');
imagen=findobj(handles.img1,'Type','image');
delete(imagen);
imagen2=findobj(handles.img2,'Type','image');
delete(imagen2);


% --- Executes on slider movement.
function slider1_Callback(hObject, eventdata, handles)
%global a;
%global b;
%global c;
%global d;
%a=0.02*get(hObject,'Value'); 
%if handles.direccion==0 
 %return;
%else
%b=rgb2gray(imread(handles.direccion)); 
%c=double(b);
%d=a*c; imshow(d); 
%end

% --- Executes during object creation, after setting all properties.
function slider1_CreateFcn(hObject, eventdata, handles)

if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --------------------------------------------------------------------
function mnunuevo_Callback(hObject, eventdata, handles)
set(handles.mnuabrir,'Enable','on');
set(handles.mnuguardar,'Enable','on');
imagen=findobj(handles.img1,'Type','image');
delete(imagen);
imagen2=findobj(handles.img2,'Type','image');
delete(imagen2);

function edit2_Callback(hObject, eventdata, handles)

function edit2_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function edit3_Callback(hObject, eventdata, handles)

function edit3_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --------------------------------------------------------------------
function mnuconvertir_Callback(hObject, eventdata, handles)

% --------------------------------------------------------------------
function mnurecortar_Callback(hObject, eventdata, handles)


% --------------------------------------------------------------------
function mnuescalagrises_Callback(hObject, eventdata, handles)
global a;
    b=rgb2gray(a);
    axes(handles.img2);
    imshow(b);

% --------------------------------------------------------------------
function mnublanconegro_Callback(hObject, eventdata, handles)
% hObject    handle to mnublanconegro (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
