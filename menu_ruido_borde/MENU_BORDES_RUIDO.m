function varargout = MENU_BORDES_RUIDO(varargin)
% MENU_BORDES_RUIDO MATLAB code for MENU_BORDES_RUIDO.fig
%      MENU_BORDES_RUIDO, by itself, creates a new MENU_BORDES_RUIDO or raises the existing
%      singleton*.
%
%      H = MENU_BORDES_RUIDO returns the handle to a new MENU_BORDES_RUIDO or the handle to
%      the existing singleton*.
%
%      MENU_BORDES_RUIDO('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MENU_BORDES_RUIDO.M with the given input arguments.
%
%      MENU_BORDES_RUIDO('Property','Value',...) creates a new MENU_BORDES_RUIDO or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before MENU_BORDES_RUIDO_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to MENU_BORDES_RUIDO_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help MENU_BORDES_RUIDO

% Last Modified by GUIDE v2.5 06-Aug-2014 13:06:45

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @MENU_BORDES_RUIDO_OpeningFcn, ...
                   'gui_OutputFcn',  @MENU_BORDES_RUIDO_OutputFcn, ...
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


% --- Executes just before MENU_BORDES_RUIDO is made visible.
function MENU_BORDES_RUIDO_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to MENU_BORDES_RUIDO (see VARARGIN)

% Choose default command line output for MENU_BORDES_RUIDO
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes MENU_BORDES_RUIDO wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = MENU_BORDES_RUIDO_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in btn_convertir.
function btn_convertir_Callback(hObject, eventdata, handles)
  global a;global aux;global a1,global umbral,global i1,global densidad,global varianza;
    a1=im2bw(a);
    %i=edge(a1);
    umbral=get(handles.edit_umbral, 'String');
    umbral=str2num(umbral);
    densidad=get(handles.edit_densidad, 'String');
    densidad=str2num(densidad);
    varianza=get(handles.edit_varianza, 'String');
    varianza=str2num(varianza);
    if aux==1 
    if umbral==''
    i1=edge(a1,'sobel');
    axes(handles.axes2)
    imshow(i1);
    else
    i1=edge(a1,'sobel',umbral);
    axes(handles.axes2)
    imshow(i1);
    end
    elseif aux==2
       if umbral==''
       i1=edge(a1,'prewitt');
       axes(handles.axes2)
       imshow(i1);
       else
       i1=edge(a1,'prewitt',umbral);
       axes(handles.axes2) 
       imshow(i1);
   end
    elseif aux==3
       if umbral==''
       i1=edge(a1,'Roberts');
       axes(handles.axes2)
       imshow(i1);
       else
       i1=edge(a1,'Roberts',umbral);
       axes(handles.axes2)
       imshow(i1);
       end
    elseif aux==4
       if umbral==''
       i1=edge(a1,'log');
       axes(handles.axes2)
       imshow(i1);
       else
       i1=edge(a1,'log',umbral);
       axes(handles.axes2)
       imshow(i1);  
       end
    elseif aux==5
       if((densidad==0) || (densidad<=1)) 
       i1=imnoise(a,'salt & pepper',densidad);
       axes(handles.axes2)
       imshow(i1);   
       end
    elseif aux==6
      if((varianza==0) || (varianza<=0.01)) 
       if((densidad==0) || (densidad<1)) 
       i1=imnoise(a,'gaussian',densidad,varianza);
       axes(handles.axes2)
       imshow(i1);
      end
      end
    elseif aux==7
       i1=imnoise(a,'poisson');
       axes(handles.axes2)
       imshow(i1);
    elseif aux==8
       if((varianza==0) || (varianza<=0.01)) 
       i1=imnoise(a,'speckle',varianza);
       axes(handles.axes2)
       imshow(i1);
       end
    elseif aux==9
       if umbral==''
       i1=edge(a1,'canny');
       axes(handles.axes2)
       imshow(i1);
       else
       i1=edge(a1,'canny',umbral);
       axes(handles.axes2)
       imshow(i1);
       end
       elseif aux==10
       if umbral==''
       i1=edge(a1,'zerocross');
       axes(handles.axes2)
       imshow(i1);
       else
       i1=edge(a1,'zerocross',umbral);
       axes(handles.axes2)
       imshow(i1);
       end
       end
  function edit_umbral_Callback(hObject, eventdata, handles)
% hObject    handle to edit_umbral (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_umbral as text
%        str2double(get(hObject,'String')) returns contents of edit_umbral as a double


% --- Executes during object creation, after setting all properties.
function edit_umbral_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_umbral (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --------------------------------------------------------------------
function btn_imagen_Callback(hObject, eventdata, handles)
% --------------------------------------------------------------------
function btn_nuevo_Callback(hObject, eventdata, handles)
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
function btn_salir_Callback(hObject, eventdata, handles)
 c=questdlg('Desea salir del programa','salir','si','no','si');
 if strcmp(c,'no')
     return;
 else
     delete(handles.figure1); %saliendo formulario
 end


% --------------------------------------------------------------------
function btn_bordes_Callback(hObject, eventdata, handles)
% hObject    handle to btn_bordes (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_9_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function btn_Sal_Pimienta_Callback(hObject, eventdata, handles)
global aux;
 aux=5;
    set(handles.panel1,'Visible','on');
    set(handles.text_umbral,'Visible','off');
    set(handles.edit_umbral,'Visible','off');
    set(handles.edit_densidad,'Visible','on');
    set(handles.text_densidad,'Visible','on');
    set(handles.text_varianza,'Visible','off');
    set(handles.edit_varianza,'Visible','off');
    set(handles.btn_convertir,'Visible','on');
    set(handles.text_densidad,'String','Densidad');

% --------------------------------------------------------------------
function btn_gaussiano_ruido_Callback(hObject, eventdata, handles)
global aux;
 aux=6;
    set(handles.panel1,'Visible','on');
    set(handles.text_umbral,'Visible','off');
    set(handles.edit_umbral,'Visible','off');
    set(handles.edit_densidad,'Visible','on'); 
    set(handles.edit_varianza,'Visible','on');
    set(handles.text_densidad,'Visible','on');
    set(handles.text_varianza,'Visible','on');
    set(handles.text_densidad,'String','Media');
    set(handles.btn_convertir,'Visible','on');


% --------------------------------------------------------------------
function btn_poisson_Callback(hObject, eventdata, handles)
global aux;
 aux=7;
    set(handles.panel1,'Visible','on');
    set(handles.text_umbral,'Visible','off');
    set(handles.edit_umbral,'Visible','off');
    set(handles.btn_convertir,'Visible','on');
    set(handles.edit_densidad,'Visible','off'); 
    set(handles.edit_varianza,'Visible','off');
    set(handles.text_densidad,'Visible','off');
    set(handles.text_varianza,'Visible','off');

% --------------------------------------------------------------------
function btn_speckle_Callback(hObject, eventdata, handles)
global aux;
 aux=8;
    set(handles.panel1,'Visible','on');
    set(handles.text_umbral,'Visible','off');
    set(handles.edit_umbral,'Visible','off');
    set(handles.btn_convertir,'Visible','on');
    set(handles.edit_densidad,'Visible','off'); 
    set(handles.edit_varianza,'Visible','on');
    set(handles.text_densidad,'Visible','off');
    set(handles.text_varianza,'Visible','on');
% --------------------------------------------------------------------
function btn_sobel_Callback(hObject, eventdata, handles)
global aux;
 aux=1;
    set(handles.panel1,'Visible','on');
    set(handles.text_umbral,'Visible','on');
    set(handles.edit_umbral,'Visible','on');
    set(handles.btn_convertir,'Visible','on');
% --------------------------------------------------------------------
function btn_prewitt_Callback(hObject, eventdata, handles)
global aux;
 aux=2;
    set(handles.panel1,'Visible','on');
    set(handles.text_umbral,'Visible','on');
    set(handles.edit_umbral,'Visible','on');
    set(handles.btn_convertir,'Visible','on');
% --------------------------------------------------------------------
function btn_roberts_Callback(hObject, eventdata, handles)
global aux;
 aux=3;
    set(handles.panel1,'Visible','on');
    set(handles.text_umbral,'Visible','on');
    set(handles.edit_umbral,'Visible','on');
    set(handles.btn_convertir,'Visible','on');
% --------------------------------------------------------------------
function btn_gauss_borde_Callback(hObject, eventdata, handles)
global aux;
 aux=4;
    set(handles.panel1,'Visible','on');
    set(handles.text_umbral,'Visible','on');
    set(handles.edit_umbral,'Visible','on');
    set(handles.btn_convertir,'Visible','on');
% --------------------------------------------------------------------     
function edit_sigma_Callback(hObject, eventdata, handles)
% hObject    handle to edit_sigma (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_sigma as text
%        str2double(get(hObject,'String')) returns contents of edit_sigma as a double


% --- Executes during object creation, after setting all properties.
function edit_sigma_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_sigma (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


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
    set(handles.btn_guardar,'Enable','on');
    set(handles.btn_abrir,'Enable','off');
end



function edit_varianza_Callback(hObject, eventdata, handles)
% hObject    handle to edit_varianza (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_varianza as text
%        str2double(get(hObject,'String')) returns contents of edit_varianza as a double


% --- Executes during object creation, after setting all properties.
function edit_varianza_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_varianza (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --------------------------------------------------------------------
function btn_canny_Callback(hObject, eventdata, handles)
global aux;
 aux=9;
    set(handles.panel1,'Visible','on');
    set(handles.text_umbral,'Visible','on');
    set(handles.edit_umbral,'Visible','on');
    set(handles.btn_convertir,'Visible','on');

% --------------------------------------------------------------------
function btn_zero_cross_Callback(hObject, eventdata, handles)
global aux;
 aux=10;
    set(handles.panel1,'Visible','on');
    set(handles.text_umbral,'Visible','on');
    set(handles.edit_umbral,'Visible','on');
    set(handles.btn_convertir,'Visible','on');



function edit_densidad_Callback(hObject, eventdata, handles)
% hObject    handle to edit_densidad (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_densidad as text
%        str2double(get(hObject,'String')) returns contents of edit_densidad as a double


% --- Executes during object creation, after setting all properties.
function edit_densidad_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_densidad (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --------------------------------------------------------------------
function btn_Hsi2Rgb_Callback(hObject, eventdata, handles)
global a;
I=double(a)/255;

R=I(:,:,1);
G=I(:,:,2);
B=I(:,:,3);

%Hue
numi=1/2*((R-G)+(R-B));
denom=((R-G).^2+((R-B).*(G-B))).^0.5;

%To avoid divide by zero exception add a small number in the denominator
H=acosd(numi./(denom+0.000001));

%If B>G then H= 360-Theta
H(B>G)=360-H(B>G);

%Normalize to the range [0 1]
H=H/360;

%Saturation
S=1- (3./(sum(I,3)+0.000001)).*min(I,[],3);


%Intensity
I=sum(I,3)./3;


%HSI
HSI=zeros(size(a));
HSI(:,:,1)=H;
HSI(:,:,2)=S;
HSI(:,:,3)=I;
axes(handles.axes2);
imshow(HSI);

    
    
    
    
    
    

