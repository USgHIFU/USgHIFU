function varargout = server_terminal(varargin)
% SERVER_TERMINAL MATLAB code for server_terminal.fig
%      SERVER_TERMINAL, by itself, creates a new SERVER_TERMINAL or raises the existing
%      singleton*.
%
%      H = SERVER_TERMINAL returns the handle to a new SERVER_TERMINAL or the handle to
%      the existing singleton*.
%
%      SERVER_TERMINAL('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SERVER_TERMINAL.M with the given input arguments.
%
%      SERVER_TERMINAL('Property','Value',...) creates a new SERVER_TERMINAL or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before server_terminal_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to server_terminal_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help server_terminal

% Last Modified by GUIDE v2.5 17-May-2015 15:13:08

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @server_terminal_OpeningFcn, ...
                   'gui_OutputFcn',  @server_terminal_OutputFcn, ...
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


% --- Executes just before server_terminal is made visible.
function server_terminal_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to server_terminal (see VARARGIN)

% Choose default command line output for server_terminal
handles.output = hObject;

% network initialization
Client = newClient;
setappdata(hObject,'client',Client);

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes server_terminal wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = server_terminal_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

hFigure = handles.figure1;
IsClientExisting = existClient(hFigure);

if ~IsClientExisting
    return
else
    Client = getappdata(hFigure,'client');
end

TreatmentPlan = newTreatmentPlan;
SessionType = getSessionType;
Client.SessionType = SessionType.Plan;
setappdata(hFigure,'client',Client);
if startSession(Client.Tcpip,SessionType.Plan)
    set(handles.status,'String','Sending data ...');
    [Success,Err] = sendPlan(Client.Tcpip,TreatmentPlan);
    Success = Success && finishSession(Client.Tcpip);
else
    set(handles.status,'String','Error');
    return
end

if Success
    set(handles.status,'String','Complete the process of sending');
else
    set(handles.status,'String',Err);
end


% --- Executes during object deletion, before destroying properties.
function server_terminal_DeleteFcn(hObject, eventdata, handles)
% hObject    handle to server_terminal (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

ClientParam = getClientParam;
deleteClient(ClientParam.ClientAddress,ClientParam.ClientPort);

% record(Client,'off');


% --- Executes on button press in pushbutton_start.
function pushbutton_start_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_start (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

hFigure = handles.figure1;
IsClientExisting = existClient(hFigure);

if ~IsClientExisting
    return
else
    Client = getappdata(hFigure,'client');
end
SessionType = getSessionType;
Client.SessionType = SessionType.Command;
setappdata(hFigure,'client',Client);
if startSession(Client.Tcpip,SessionType.Command)
    set(handles.status,'String','Sending Command ...');
    Cmd = getCommand;
    Success = sendString(Client.Tcpip,Cmd.Start);
    Success = Success && finishSession(Client.Tcpip);
else
    set(handles.status,'String','Error');
    return
end

if Success
    set(handles.status,'String','Complete the process of sending');
else
    set(handles.status,'String',Err);
end