function varargout = untitled_prueba(varargin)
% UNTITLED_PRUEBA MATLAB code for untitled_prueba.fig
%      UNTITLED_PRUEBA, by itself, creates a new UNTITLED_PRUEBA or raises the existing
%      singleton*.
%
%      H = UNTITLED_PRUEBA returns the handle to a new UNTITLED_PRUEBA or the handle to
%      the existing singleton*.
%
%      UNTITLED_PRUEBA('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in UNTITLED_PRUEBA.M with the given input arguments.
%
%      UNTITLED_PRUEBA('Property','Value',...) creates a new UNTITLED_PRUEBA or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before untitled_prueba_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to untitled_prueba_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help untitled_prueba

% Last Modified by GUIDE v2.5 06-Jun-2014 19:58:15

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @untitled_prueba_OpeningFcn, ...
                   'gui_OutputFcn',  @untitled_prueba_OutputFcn, ...
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


% --- Executes just before untitled_prueba is made visible.
function untitled_prueba_OpeningFcn(hObject, eventdata, handles, varargin)
global I_original;
%imagen original
I_original=imread('m.jpg');
axes(handles.axes1);
imshow(I_original);

handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes untitled_prueba wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = untitled_prueba_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in Process.
function Process_Callback(hObject, eventdata, handles)
global I_original;
%% ESCALA DE GRISES
I = rgb2gray(I_original);
background = imclose(I,strel('disk',90));
axes(handles.axes2);
imshow(background);
%% DETECCION DE OBJETOS
I2 = imsubtract(background,I);
%% DETERMINAR EL NIVEL DE UMBRALIZACION
lavel = graythresh(I2);
intensidad = lavel*255;
BW = im2bw(I2, lavel);
%% RELLENAR LA FIGURA
fill = imfill(BW,'holes');
axes(handles.axes3);
imshow(fill);
%% EXTRACCION DE DATOS
[niveles, numObjects] = bwlabel(fill,4);
stats = regionprops(niveles,'Eccentricity','Area','BoundingBox');
areas = [stats.Area];
excentricidad = [stats.Eccentricity];
%% PROCESO ESPECIFICO
idxOf25 = find(areas > 6326 & areas < 7211);
stats25 = stats(idxOf25);
axes(handles.axes4);
imshow(I_original);
hold on
cantidad = length(stats25)*0.25;
for idx = 1:length(stats25)
    h = rectangle('Position',stats25(idx).BoundingBox,'Curvature',[0.8,0.4],'LineWidth',2,'LineStyle','--');
     set(h,'EdgeColor',[0.75 0 0]);
     hold on
end
idxOf100 = find(areas > 7508 & areas < 8536);
stats100 = stats(idxOf100);
cantidad = cantidad + length(stats100)*1;
%imshow(I_original)
 
for idx = 1:length(stats100)
    h = rectangle('Position',stats100(idx).BoundingBox,'Curvature',[0.8,0.4],'LineWidth',2,'LineStyle','--');
     set(h,'EdgeColor',[0.75 0 0.75]);
     hold on
end 
 
idxOf50 = find(areas > 9725 & areas < 11488);
stats50 = stats(idxOf50);
cantidad = cantidad + length(stats50)*0.5;
 
for idx = 1:length(stats50)
    h = rectangle('Position',stats50(idx).BoundingBox,'Curvature',[0.8,0.4],'LineWidth',2,'LineStyle','--');
     set(h,'EdgeColor',[0.75 0.5 0]);
     hold on
end 
 
idxOf10 = find(areas > 3200 & areas < 3830);
stats10 = stats(idxOf10);
cantidad = cantidad + length(stats10)*0.1;
 
for idx = 1:length(stats10)
    h = rectangle('Position',stats10(idx).BoundingBox,'Curvature',[0.8,0.4],'LineWidth',2,'LineStyle','--');
     set(h,'EdgeColor',[0.75 0 0]);
     hold on
end 
 
idxOf5 = find(areas > 4580 & areas < 5613);
stats5 = stats(idxOf5);
hold on;
cantidad = cantidad + length(stats5)*0.05;
for idx = 1:length(stats5)
    h = rectangle('Position',stats5(idx).BoundingBox,'Curvature',[0.8,0.4],'LineWidth',2,'LineStyle','--');
     set(h,'EdgeColor',[0.75 0 0]);
     hold on
end 
 
idxOf1 = find(areas > 3836 & areas < 4524);
stats1 = stats(idxOf1);
hold on
cantidad = cantidad + length(stats1)*0.01;
for idx = 1:length(stats1)
    h = rectangle('Position',stats1(idx).BoundingBox,'Curvature',[0.8,0.4],'LineWidth',2,'LineStyle','--');
     set(h,'EdgeColor',[0.75 0 0]);
     hold on
end 
 
hold off
 
set(handles.edit1,'String',num2str(cantidad));
aux = strcat(num2str(length(stats5)));
aux2=strcat(num2str(length(stats10)));
aux3=strcat(num2str(length(stats25)));
aux4=strcat(num2str(length(stats50)));
aux5=strcat(num2str(length(stats100)));
aux6=strcat(num2str(length(stats1)));
set(handles.edit2,'String',aux);
set(handles.edit3,'String',aux2);
set(handles.edit4,'String',aux3);
set(handles.edit5,'String',aux4);
set(handles.edit6,'String',aux5);
set(handles.edit7,'String',aux6);

 






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


% --- Executes on selection change in listbox1.
function listbox1_Callback(hObject, eventdata, handles)
% hObject    handle to listbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns listbox1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox1


% --- Executes during object creation, after setting all properties.
function listbox1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in Previo.
function Previo_Callback(hObject, eventdata, handles)
%handles.objVideo = videoinput('winvideo');
%guidata(hObject,handles);
%axes(handles.axes1)  %Se llama al eje del realVideo
%vidRes = get(handles.objVideo,'VideoResolution');
%nBands = get(handles.objVideo,'NumberOfBands');
%hImage = image( zeros(vidRes(2), vidRes(1), nBands)); 
%preview(handles.objVideo,hImage);



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



function edit6_Callback(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit6 as text
%        str2double(get(hObject,'String')) returns contents of edit6 as a double


% --- Executes during object creation, after setting all properties.
function edit6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit7_Callback(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit7 as text
%        str2double(get(hObject,'String')) returns contents of edit7 as a double


% --- Executes during object creation, after setting all properties.
function edit7_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
