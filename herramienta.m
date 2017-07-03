function varargout = herramienta(varargin)
% HERRAMIENTA MATLAB code for herramienta.fig
%      HERRAMIENTA, by itself, creates a new HERRAMIENTA or raises the existing
%      singleton*.
%
%      H = HERRAMIENTA returns the handle to a new HERRAMIENTA or the handle to
%      the existing singleton*.
%
%      HERRAMIENTA('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in HERRAMIENTA.M with the given input arguments.
%
%      HERRAMIENTA('Property','Value',...) creates a new HERRAMIENTA or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before herramienta_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to herramienta_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help herramienta

% Last Modified by GUIDE v2.5 31-May-2017 13:14:11

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @herramienta_OpeningFcn, ...
                   'gui_OutputFcn',  @herramienta_OutputFcn, ...
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


% --- Executes just before herramienta is made visible.
function herramienta_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to herramienta (see VARARGIN)

% Choose default command line output for herramienta
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes herramienta wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = herramienta_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --------------------------------------------------------------------
function Menu_Callback(hObject, eventdata, handles)
% hObject    handle to Menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function menu_nuevo_Callback(hObject, eventdata, handles)
% hObject    handle to menu_nuevo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
out = nuevo();
archivoStrings = strcat(out.ruta,out.archivo);
exp = calcular( out.guardar,'continua',archivoStrings,out.nombres,'exp');
cargar(hObject, eventdata, handles,exp);

function cargar(hObject, eventdata, handles,exp)
limpiar(handles);
set(handles.tabla,'RowName',exp.nombres);
set(handles.tabla,'ColumnName',exp.nombres);
set(handles.tabla,'Data',exp.diagonal);
handles.exp=exp;
guidata(hObject, handles);


% --------------------------------------------------------------------
function menu_abrir_Callback(hObject, eventdata, handles)
% hObject    handle to menu_abrir (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[FileName,PathName] = uigetfile('*.mat');
mat = load(strcat(PathName,FileName),'exp');
cargar(hObject, eventdata, handles,mat.exp);


% --------------------------------------------------------------------
function menu_salir_Callback(hObject, eventdata, handles)
% hObject    handle to menu_abrir (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
delete(handles.figure1);

function limpiar(handles)
if isfield(handles,'s1') && isfield(handles,'s2')
    cla(handles.s1);
    cla(handles.s2);
    delete(handles.t1);
    delete(handles.t2);
end


% --- Executes when selected cell(s) is changed in tabla.
function tabla_CellSelectionCallback(hObject, eventdata, handles)
% hObject    handle to tabla (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.TABLE)
%	Indices: row and column indices of the cell(s) currently selecteds
% handles    structure with handles and user data (see GUIDATA)
if isempty(eventdata.Indices)
    return;
end
uno = eventdata.Indices(1);
dos = eventdata.Indices(2);

if uno >= dos
    limpiar(handles);
else
    exp = handles.exp;
    s1 = subplot(2,1,1,'Parent',handles.panel);
    H = dendrogram(exp.enlaces(uno).enlace,0);
    set(H,'LineWidth',1.5);
    t1 = title(exp.nombres{uno});
    s2 = subplot(2,1,2,'Parent',handles.panel);
    H = dendrogram(exp.enlaces(dos).enlace,0);
    set(H,'LineWidth',1.5);
    t2 = title(exp.nombres{dos});
    handles.s1 = s1;
    handles.s2 = s2;
    handles.t1 = t1;
    handles.t2 = t2;
    guidata(hObject, handles);
end
