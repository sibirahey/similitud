function varargout = nuevo(varargin)
% NUEVO MATLAB code for nuevo.fig
%      NUEVO, by itself, creates a new NUEVO or raises the existing
%      singleton*.
%
%      H = NUEVO returns the handle to a new NUEVO or the handle to
%      the existing singleton*.
%
%      NUEVO('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in NUEVO.M with the given input arguments.
%
%      NUEVO('Property','Value',...) creates a new NUEVO or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before nuevo_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to nuevo_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help nuevo

% Last Modified by GUIDE v2.5 31-May-2017 12:22:40

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @nuevo_OpeningFcn, ...
                   'gui_OutputFcn',  @nuevo_OutputFcn, ...
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


% --- Executes just before nuevo is made visible.
function nuevo_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to nuevo (see VARARGIN)

% mainGuiInput = find(strcmp(varargin, 'main'));
% handles.changeMeMain = varargin{mainGuiInput+1};



% Choose default command line output for nuevo
%handles.output = hObject;

nombres = obtenerNombres( 'continua' );
nombres = sortrows(nombres');
set(handles.list_entrada,'string',nombres);
set(handles.list_salida,'string',{});


% Update handles structure
guidata(hObject, handles);

% UIWAIT makes nuevo wait for user response (see UIRESUME)
uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = nuevo_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if handles.cancelar
    varargout{1} = [];
    delete(handles.figure1);
    return;
end
% Get default command line output from handles structure
out.nombres = get(handles.list_salida,'String');
out.archivo=handles.FileName;
out.ruta=handles.PathName;
out.guardar = get(handles.guardar,'Value');
varargout{1} = out;
delete(handles.figure1);



function archivo_Callback(hObject, eventdata, handles)
% hObject    handle to archivo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of archivo as text
%        str2double(get(hObject,'String')) returns contents of archivo as a double


% --- Executes during object creation, after setting all properties.
function archivo_CreateFcn(hObject, eventdata, handles)
% hObject    handle to archivo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[FileName,PathName] = uigetfile('*.xlsx');
handles.FileName=FileName;
handles.PathName=PathName;
set(handles.archivo, 'String', FileName);
guidata(hObject,handles)



% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
list = get(handles.list_salida,'String');
if(isfield(handles,'FileName') && ~isempty(list))
    handles.cancelar = false;
    guidata(hObject,handles);
    uiresume(handles.figure1);
else
    warndlg('Por favor llena todos los campos','Alerta');
end



% --- Executes on selection change in list_entrada.
function list_entrada_Callback(hObject, eventdata, handles)
% hObject    handle to list_entrada (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns list_entrada contents as cell array
%        contents{get(hObject,'Value')} returns selected item from list_entrada


% --- Executes during object creation, after setting all properties.
function list_entrada_CreateFcn(hObject, eventdata, handles)
% hObject    handle to list_entrada (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in list_salida.
function list_salida_Callback(hObject, eventdata, handles)
% hObject    handle to list_salida (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns list_salida contents as cell array
%        contents{get(hObject,'Value')} returns selected item from list_salida


% --- Executes during object creation, after setting all properties.
function list_salida_CreateFcn(hObject, eventdata, handles)
% hObject    handle to list_salida (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pasar_btn.
function pasar_btn_Callback(hObject, eventdata, handles)
% hObject    handle to pasar_btn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
index_selected = get(handles.list_entrada,'Value');
set(handles.list_entrada,'Value',1);
list = get(handles.list_entrada,'String');
if isempty(list)
    return
end
item_selected = list{index_selected};
list(index_selected,:) = [];
set(handles.list_entrada,'String',list);

prev_list = get(handles.list_salida,'String');
new_list = [prev_list; {item_selected}];
new_list = sortrows(new_list);
set(handles.list_salida,'String',new_list);



% --- Executes on button press in regresar_btn.
function regresar_btn_Callback(hObject, eventdata, handles)
% hObject    handle to regresar_btn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
index_selected = get(handles.list_salida,'Value');
set(handles.list_salida,'Value',1);
list = get(handles.list_salida,'String');
if isempty(list)
    return
end
item_selected = list{index_selected};
list(index_selected,:) = [];
set(handles.list_salida,'String',list);

prev_list = get(handles.list_entrada,'String');
new_list = [prev_list; {item_selected}];
new_list = sortrows(new_list);
set(handles.list_entrada,'String',new_list);


% --- Executes on button press in pasar_todos_btn.
function pasar_todos_btn_Callback(hObject, eventdata, handles)
% hObject    handle to pasar_todos_btn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.list_entrada,'Value',1);
list = get(handles.list_entrada,'String');
if isempty(list)
    return
end
set(handles.list_entrada,'String',{});

prev_list = get(handles.list_salida,'String');
new_list = [prev_list; list];
new_list = sortrows(new_list);
set(handles.list_salida,'String',new_list);


% --- Executes on button press in regresar_todos_btn.
function regresar_todos_btn_Callback(hObject, eventdata, handles)
% hObject    handle to regresar_todos_btn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.list_salida,'Value',1);
list = get(handles.list_salida,'String');
if isempty(list)
    return
end
set(handles.list_salida,'String',{});

prev_list = get(handles.list_entrada,'String');
new_list = [prev_list; list];
new_list = sortrows(new_list);
set(handles.list_entrada,'String',new_list);


% --- Executes on button press in guardar.
function guardar_Callback(hObject, eventdata, handles)
% hObject    handle to guardar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of guardar


% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.cancelar = true;
guidata(hObject,handles);
uiresume(handles.figure1);
