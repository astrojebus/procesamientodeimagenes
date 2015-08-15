function varargout = Editor_menu(varargin)
% EDITOR_MENU MATLAB code for Editor_menu.fig
%      EDITOR_MENU, by itself, creates a new EDITOR_MENU or raises the existing
%      singleton*.
%
%      H = EDITOR_MENU returns the handle to a new EDITOR_MENU or the handle to
%      the existing singleton*.
%
%      EDITOR_MENU('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in EDITOR_MENU.M with the given input arguments.
%
%      EDITOR_MENU('Property','Value',...) creates a new EDITOR_MENU or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Editor_menu_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Editor_menu_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Editor_menu

% Last Modified by GUIDE v2.5 21-May-2014 10:25:54

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Editor_menu_OpeningFcn, ...
                   'gui_OutputFcn',  @Editor_menu_OutputFcn, ...
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


% --- Executes just before Editor_menu is made visible.
function Editor_menu_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Editor_menu (see VARARGIN)

% Choose default command line output for Editor_menu
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Editor_menu wait for user response (see UIRESUME)
% uiwait(handles.frmmenu);


% --- Outputs from this function are returned to the command line.
function varargout = Editor_menu_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on slider movement.
function sld1_Callback(hObject, eventdata, handles)
global calidad;
calidad=get(handles.sld1,'Value');
set (handles.txted,'String',calidad);



% --- Executes during object creation, after setting all properties.
function sld1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sld1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --------------------------------------------------------------------
function mnuimagen_Callback(hObject, eventdata, handles)
% hObject    handle to mnuimagen (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function mnuabrir_Callback(hObject, eventdata, handles)
global a;
[Filename path]=uigetfile('*.jpg;*.bmp','Abrir imagen');
if isequal(Filename,0)
    return;
else
    a=imread(strcat(path,Filename));
    axes(handles.axes1);
    imshow(a);
    msgbox('Se abrió con éxito', 'Abrir');
   set(handles.mnuguardar,'Enable','on');
    set(handles.mnuabrir,'Enable','off');
end

% --------------------------------------------------------------------
function mnuguardar_Callback(hObject, eventdata, handles)
global a;
global calidad;
[Filename Path]=uiputfile('*.jpg;*.bmp','Guardar');
if isequal(Filename,0)
    return;
else
    calidad=get(handles.sld1,'String');
    calidad=str2double(calidad);
    if ((calidad>=0)&&(calidad<=100))
        imwrite(a,strcat(Path,Filename),'quality',calidad);
        msgbox('La imagen se guardo con éxito');
        axes(handles.axes2);
        imshow(a);
        set(handles.mnuguardar,'Enable','off');
    else
        msgbox('La calidad no esta en el intervalo');
        set(handles.mnuguardar,'Enable','on');
    end   
end
    set(handles.mnuabrir,'Enable','on');


% --------------------------------------------------------------------
function mnunuevo_Callback(hObject, eventdata, handles)
    global a;
    global b;
    set(handles.mnuabrir,'Enable','on');
    set(handles.mnuguardar,'Enable','on');
    set(handles.recortar,'Enable','on');
    a=findobj(handles.axes1,'Type','image');
    delete(a);
    b=findobj(handles.axes2,'Type','image');
    delete(b);   
% --------------------------------------------------------------------
function mnusalir_Callback(hObject, eventdata, handles)
c=questdlg('Desea salir del programa','Salir','Si','No','Si');
if strcmp(c,'No')
    return;
else
    delete(handles.frmmenu); %Saliendo del formulario
end


% --- Executes on button press in recortar.
function recortar_Callback(hObject, eventdata, handles)
global a;
b=imcrop(a); %Recortar imagen a
axes(handles.axes2);
imshow(b);
set(handles.recortar,'Enable','off');



function txted_Callback(hObject, eventdata, handles)
% hObject    handle to txted (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txted as text
%        str2double(get(hObject,'String')) returns contents of txted as a double


% --- Executes during object creation, after setting all properties.
function txted_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txted (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on slider movement.
function sld2_Callback(hObject, eventdata, handles)
global umbral;
global a;
global b;
umbral=get(handles.sld2,'Value');
set (handles.txted2,'String',umbral);
b= rgb2gray(a);
axes(handles.axes2);
imshow(b);


% --- Executes during object creation, after setting all properties.
function sld2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sld2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



function txted2_Callback(hObject, eventdata, handles)
% hObject    handle to txted2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txted2 as text
%        str2double(get(hObject,'String')) returns contents of txted2 as a double


% --- Executes during object creation, after setting all properties.
function txted2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txted2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on key press with focus on recortar and none of its controls.
function recortar_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to recortar (see GCBO)
% eventdata  structure with the following fields (see UICONTROL)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in escg.
function escg_Callback(hObject, eventdata, handles)
    global a;
    global b;
    b= rgb2gray(a);
    umbral=graythresh(b);
    c=im2bw(b,umbral);
    set (handles.axes2);
    imshow(c);


% --- Executes during object creation, after setting all properties.
function frmmenu_CreateFcn(hObject, eventdata, handles)
% hObject    handle to frmmenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
