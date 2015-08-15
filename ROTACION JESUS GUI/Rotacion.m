function varargout = Rotacion(varargin)
% ROTACION MATLAB code for Rotacion.fig
%      ROTACION, by itself, creates a new ROTACION or raises the existing
%      singleton*.
%
%      H = ROTACION returns the handle to a new ROTACION or the handle to
%      the existing singleton*.
%
%      ROTACION('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in ROTACION.M with the given input arguments.
%
%      ROTACION('Property','Value',...) creates a new ROTACION or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Rotacion_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Rotacion_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Rotacion

% Last Modified by GUIDE v2.5 01-Dec-2014 15:17:45

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Rotacion_OpeningFcn, ...
                   'gui_OutputFcn',  @Rotacion_OutputFcn, ...
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


% --- Executes just before Rotacion is made visible.
function Rotacion_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Rotacion (see VARARGIN)

% Choose default command line output for Rotacion
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Rotacion wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Rotacion_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



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
function Untitled_1_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_4_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function angulomenu_Callback(hObject, eventdata, handles)
% hObject    handle to angulomenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
i = str2double(get(handles.edit1,'String'));
img1=imrotate(handles.a,i);
 axes(handles.axes2);
imshow(img1);
  


% --------------------------------------------------------------------
function dimensionesmenu_Callback(hObject, eventdata, handles)
% hObject    handle to dimensionesmenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
fila = str2double(get(handles.edit2,'String'));
columna = str2double(get(handles.edit3,'String'));
  
       
    
    img6=imresize(handles.a,[fila columna]);
      axes(handles.axes2);
      imshow(img6);
  
   
    


% --------------------------------------------------------------------
function movermenu_Callback(hObject, eventdata, handles)
% hObject    handle to movermenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
fila = str2double(get(handles.edit4,'String'));
columna = str2double(get(handles.edit5,'String'));
    img=handles.a
    [m n dim]=size(img);
    imgaux=zeros(m,n,dim);
    f=fila; %Mover a la fila 20
    for i=1:m
        c=columna; %Mover a la columna 20
        for j=1:n
            imgaux(f,c,:)=img(i,j,:);
            c=c+1;
        end
        f=f+1
    end
    imgaux=uint8(imgaux);
   axes(handles.axes2);
    imshow(imgaux);

% --------------------------------------------------------------------
function abrirmenu_Callback(hObject, eventdata, handles)
% hObject    handle to abrirmenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global a;

[archivo ruta]=uigetfile({'*.gif';'*.jpg'},'abrir imagen');
if isequal(archivo,0)%si el usuario no eleige ningun archivo
 return 
else
 
    handles.a=imread(strcat(ruta,archivo));
    
    axes(handles.axes1);
    imshow(handles.a);
    guidata(gcbf, handles);
    msgbox('Se abrio con exito','mensaje');
    set(handles.guardarmenu,'Enable','on');
end


% --------------------------------------------------------------------
function salirmenu_Callback(hObject, eventdata, handles)
% hObject    handle to salirmenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close(gcbf);


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



function edit5_Callback(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit5 as text
%        str2double(get(hObject,'String')) returns contents of edit5 as a double


% --- Executes during object creation, after setting all properties.
function edit5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double


% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --------------------------------------------------------------------
function guardarmenu_Callback(hObject, eventdata, handles)
% hObject    handle to guardarmenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

 canal = getimage(handles.axes2); 
[Filename Path]=uiputfile('*.jpg;*.bmp','Guardar');
if isequal(Filename,0)
    return;
else
  
        
        imwrite(canal,strcat(Path,Filename));
        msgbox('La imagen se guardo con éxito');
        
       % set(handles.mnuguardar,'Enable','off');  
          
end
    %set(handles.mnuabrir,'Enable','on');
