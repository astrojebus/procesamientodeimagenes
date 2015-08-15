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

% Last Modified by GUIDE v2.5 14-May-2014 15:56:57

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
set (handles.sld1,'String',calidad);


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

    else
        msgbox('La calidad no esta en el intervalo');
    end   
end
    set(handles.mnuguardar,'Enable','off');
    set(handles.mnuabrir,'Enable','on');


% --------------------------------------------------------------------
function mnunuevo_Callback(hObject, eventdata, handles)
    global a
    cla
    cla reset
    cla(a)
    cla(a,'reset')

% --------------------------------------------------------------------
function mnusalir_Callback(hObject, eventdata, handles)
c=questdlg('Desea salir del programa','Salir','Si','No','Si');
if strcmp(c,'No')
    return;
else
    delete(handles.frmimagen); %Saliendo del formulario
end
