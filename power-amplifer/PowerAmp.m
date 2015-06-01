function varargout = PowerAmp(varargin)
% POWERAMP MATLAB code for PowerAmp.fig
%      POWERAMP, by itself, creates a new POWERAMP or raises the existing
%      singleton*.
%
%      H = POWERAMP returns the handle to a new POWERAMP or the handle to
%      the existing singleton*.
%
%      POWERAMP('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in POWERAMP.M with the given input arguments.
%
%      POWERAMP('Property','Value',...) creates a new POWERAMP or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before PowerAmp_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to PowerAmp_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help PowerAmp

% Last Modified by GUIDE v2.5 05-May-2015 15:06:39

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @PowerAmp_OpeningFcn, ...
                   'gui_OutputFcn',  @PowerAmp_OutputFcn, ...
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


% --- Executes just before PowerAmp is made visible.
function PowerAmp_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to PowerAmp (see VARARGIN)

% Choose default command line output for PowerAmp
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes PowerAmp wait for user response (see UIRESUME)
% uiwait(handles.power_amp);


% --- Outputs from this function are returned to the command line.
function varargout = PowerAmp_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function voltage_Callback(hObject, eventdata, handles)
% hObject    handle to voltage (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of voltage as text
%        str2double(get(hObject,'String')) returns contents of voltage as a double


% --- Executes during object creation, after setting all properties.
function voltage_CreateFcn(hObject, eventdata, handles)
% hObject    handle to voltage (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function id_Callback(hObject, eventdata, handles)
% hObject    handle to id (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of id as text
%        str2double(get(hObject,'String')) returns contents of id as a double


% --- Executes during object creation, after setting all properties.
function id_CreateFcn(hObject, eventdata, handles)
% hObject    handle to id (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in reset.
function reset_Callback(hObject, eventdata, handles)
% hObject    handle to reset (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
hFigure = handles.power_amp;
IsPowerAmpExisting = existPowerAmp(hFigure);
PowerAmpId = str2double(get(handles.id,'String'));
if IsPowerAmpExisting
    PowerAmp = getappdata(hFigure,'power_amp');
    if flagSendToAllPowerAmps(PowerAmpId)
        if resetAllPowerAmp(PowerAmp)
            set(handles.status,'String','RESET SUCCESSFULLY');
        else
            set(handles.status,'String','EXCEPTION');
        end
    else
        if resetSinglePowerAmp(PowerAmp,PowerAmpId)
            set(handles.status,'String','RESET SUCCESSFULLY');
        else
            set(handles.status,'String','EXCEPTION');
        end
    end
else
    set(handles.status,'String','EXCEPTION');
end


% --- Executes on button press in start.
function start_Callback(hObject, eventdata, handles)
% hObject    handle to start (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
hFigure = handles.power_amp;
IsPowerAmpExisting = existPowerAmp(hFigure);
PowerAmpId = str2double(get(handles.id,'String'));
Volt = str2double(get(handles.voltage,'String'));
if IsPowerAmpExisting
    PowerAmp = getappdata(hFigure,'power_amp');
    if flagSendToAllPowerAmps(PowerAmpId)
        if startAllPowerAmp(PowerAmp,Volt)
            set(handles.status,'String','STARTED SUCCESSFULLY');
        else
            set(handles.status,'String','EXCEPTION');
        end
    else
        if startSinglePowerAmp(PowerAmp,PowerAmpId,Volt)
            set(handles.status,'String','STARTED SUCCESSFULLY');
        else
            set(handles.status,'String','EXCEPTION');
        end
    end
else
    set(handles.status,'String','EXCEPTION');
end

% --- Executes on button press in echo.
function echo_Callback(hObject, eventdata, handles)
% hObject    handle to echo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
hFigure = handles.power_amp;
IsPowerAmpExisting = existPowerAmp(hFigure);
PowerAmpId = str2double(get(handles.id,'String'));
if IsPowerAmpExisting
    PowerAmp = getappdata(hFigure,'power_amp');
    Volt = echoPowerAmp(PowerAmp,PowerAmpId);
    if ~isempty(Volt)
        set(handles.status,'String',num2str(Volt));
    else
        set(handles.status,'String','EXCEPTION');
    end
else
    set(handles.status,'String','EXCEPTION');
end
