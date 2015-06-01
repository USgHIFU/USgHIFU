function varargout = client_terminal(varargin)
% CLIENT_TERMINAL MATLAB code for client_terminal.fig
%      CLIENT_TERMINAL, by itself, creates a new CLIENT_TERMINAL or raises the existing
%      singleton*.
%
%      H = CLIENT_TERMINAL returns the handle to a new CLIENT_TERMINAL or the handle to
%      the existing singleton*.
%
%      CLIENT_TERMINAL('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in CLIENT_TERMINAL.M with the given input arguments.
%
%      CLIENT_TERMINAL('Property','Value',...) creates a new CLIENT_TERMINAL or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before client_terminal_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to client_terminal_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help client_terminal

% Last Modified by GUIDE v2.5 25-Mar-2015 12:38:33

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @client_terminal_OpeningFcn, ...
                   'gui_OutputFcn',  @client_terminal_OutputFcn, ...
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


% --- Executes just before client_terminal is made visible.
function client_terminal_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to client_terminal (see VARARGIN)

% Choose default command line output for client_terminal
handles.output = hObject;

Server = newServer;
hFigure = handles.figure1;
Server.Tcpip.BytesAvailableFcn = {@readServer,hFigure};
setappdata(hFigure,'server',Server);

Plan = newTreatmentPlan;
setappdata(hFigure,'plan',Plan);

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes client_terminal wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = client_terminal_OutputFcn(hObject, eventdata, handles) 
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


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
hFigure = handles.figure1;
TreatmentPlan = getappdata(hFigure,'tp');
disp(TreatmentPlan)

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

set(handles.text4,'String','Disconnected ...');
Server = getappdata(0,'Server');
if strcmp(Server.Status,'open')
    fclose(Server);
    ServerParam = getServerParam;
    deleteServer(ServerParam.ServerAddress,ServerParam.ServerPort);
else
    return;
end

guidata(hObject,handles);


function client_terminal_DeleteFcn(hObject,eventdata,handles)

hFigure = handles.figure1;
deleteServer(hFigure);

% record(Server,'off');
