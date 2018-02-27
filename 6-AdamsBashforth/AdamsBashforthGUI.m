function varargout = AdamsBashforthGUI(varargin)
% ADAMSBASHFORTHGUI MATLAB code for AdamsBashforthGUI.fig
%      ADAMSBASHFORTHGUI, by itself, creates a new ADAMSBASHFORTHGUI or raises the existing
%      singleton*.
%
%      H = ADAMSBASHFORTHGUI returns the handle to a new ADAMSBASHFORTHGUI or the handle to
%      the existing singleton*.
%
%      ADAMSBASHFORTHGUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in ADAMSBASHFORTHGUI.M with the given input arguments.
%
%      ADAMSBASHFORTHGUI('Property','Value',...) creates a new ADAMSBASHFORTHGUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before AdamsBashforthGUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to AdamsBashforthGUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help AdamsBashforthGUI

% Last Modified by GUIDE v2.5 16-Jan-2018 19:19:18

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @AdamsBashforthGUI_OpeningFcn, ...
                   'gui_OutputFcn',  @AdamsBashforthGUI_OutputFcn, ...
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


% --- Executes just before AdamsBashforthGUI is made visible.
function AdamsBashforthGUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to AdamsBashforthGUI (see VARARGIN)

% Choose default command line output for AdamsBashforthGUI
handles.output = hObject;
handles.n = 10;
handles.f1 = @(x, y1, y2) y1;
handles.f2 = @(x, y1, y2) y2;
handles.y1_p = 0; 
handles.y2_p = 0;
handles.y1_z = @(x) x;
handles.y2_z = @(x) x;
handles.y1_zist = 0;
handles.y2_zist = 0;
handles.a = 0;
handles.b = 1;
set(handles.uitable1,'visible','off');
set(handles.text9,'visible','off');


% Update handles structure
guidata(hObject, handles);
update_StaticText(handles)

% UIWAIT makes AdamsBashforthGUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);

% --- Outputs from this function are returned to the command line.
function varargout = AdamsBashforthGUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


function y1_Callback(hObject, eventdata, handles)
% hObject    handle to y1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of y1 as text
%        str2double(get(hObject,'String')) returns contents of y1 as a double
handles.f1 = vectorize(inline(get(hObject,'string'),'x','y1','y2'));
guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function y1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to y1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function y2_Callback(hObject, eventdata, handles)
% hObject    handle to y2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of y2 as text
%        str2double(get(hObject,'String')) returns contents of y2 as a double
handles.f2 = vectorize(inline(get(hObject,'string'),'x','y1','y2'));
guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function y2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to y2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function y1_pocz_Callback(hObject, eventdata, handles)
% hObject    handle to y1_pocz (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of y1_pocz as text
%        str2double(get(hObject,'String')) returns contents of y1_pocz as a double
handles.y1_p = str2double(get(hObject,'String'));
guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function y1_pocz_CreateFcn(hObject, eventdata, handles)
% hObject    handle to y1_pocz (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function y2_pocz_Callback(hObject, eventdata, handles)
% hObject    handle to y2_pocz (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of y2_pocz as text
%        str2double(get(hObject,'String')) returns contents of y2_pocz as a double
handles.y2_p = str2double(get(hObject,'String'));
guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function y2_pocz_CreateFcn(hObject, eventdata, handles)
% hObject    handle to y2_pocz (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function y1_znane_Callback(hObject, eventdata, handles)
% hObject    handle to y1_znane (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of y1_znane as text
%        str2double(get(hObject,'String')) returns contents of y1_znane as a double
handles.y1_z = vectorize(inline(get(hObject,'string'),'x'));
if (~isempty(get(hObject,'string')))
    handles.y1_zist = 1;
else
    handles.y1_zist = 0;
end
guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function y1_znane_CreateFcn(hObject, eventdata, handles)
% hObject    handle to y1_znane (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function y2_znane_Callback(hObject, eventdata, handles)
% hObject    handle to y2_znane (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of y2_znane as text
%        str2double(get(hObject,'String')) returns contents of y2_znane as a double
handles.y2_z = vectorize(inline(get(hObject,'string'),'x'));
if (~isempty(get(hObject,'string')))
    handles.y2_zist = 1;
else
    handles.y2_zist = 0;
end
guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function y2_znane_CreateFcn(hObject, eventdata, handles)
% hObject    handle to y2_znane (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function n_Callback(hObject, eventdata, handles)
% hObject    handle to n (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of n as text
%        str2double(get(hObject,'String')) returns contents of n as a double
handles.n = str2double(get(hObject,'String'));
guidata(hObject,handles);
update_StaticText(handles);

% --- Executes during object creation, after setting all properties.
function n_CreateFcn(hObject, eventdata, handles)
% hObject    handle to n (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function a_Callback(hObject, eventdata, handles)
% hObject    handle to a (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of a as text
%        str2double(get(hObject,'String')) returns contents of a as a double
handles.a = str2double(get(hObject,'String'));
guidata(hObject,handles);
update_StaticText(handles);

% --- Executes during object creation, after setting all properties.
function a_CreateFcn(hObject, eventdata, handles)
% hObject    handle to a (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function b_Callback(hObject, eventdata, handles)
% hObject    handle to b (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of b as text
%        str2double(get(hObject,'String')) returns contents of b as a double
handles.b = str2double(get(hObject,'String'));
guidata(hObject,handles);
update_StaticText(handles);

% --- Executes during object creation, after setting all properties.
function b_CreateFcn(hObject, eventdata, handles)
% hObject    handle to b (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on button press in pushbutton2.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[ Y1, Y2, X ] = AdamsBashforth( handles.f1, handles.f2, handles.y1_p, handles.y2_p, handles.a, handles.b, handles.n );
tString = sprintf('Wyniki przy kroku ca³kowania h = %4f', (handles.b - handles.a) / handles.n);
set(handles.text9, 'String', tString);
set(handles.uitable1, 'Data', [X' Y1' Y2']);
set(handles.uitable1,'ColumnName',{'x';'~y1(x)';'~y2(x)'})

figure;
plot(X, Y1, '.b', X, Y2, '.r');

if (handles.y1_zist == 1 && handles.y2_zist == 1)
    hold on;
    plot(X, handles.y1_z(X), '-b', X, handles.y2_z(X), '-r');
    legend('~y1(x)','~y2(x)', 'y1(x)', 'y2(x)')
end
if (handles.y1_zist == 1 && handles.y2_zist == 0)
    hold on;
    plot(X, handles.y1_z(X), '-b');
    legend('~y1(x)','~y2(x)', 'y1(x)')
end
if (handles.y2_zist == 1 && handles.y1_zist == 0)
    hold on;
    plot(X, handles.y2_z(X), '-r');
    legend('~y1(x)','~y2(x)', 'y2(x)')
end
if (handles.y1_zist == 0 && handles.y2_zist == 0)
    legend('~y1(x)','~y2(x)')
end

grid on
grid minor
title('Wykres rozwi¹zania uk³adu równañ ró¿niczkowych')
xlabel('x')
ylabel('y')

set(handles.uitable1,'visible','on');
set(handles.text9,'visible','on');

function update_StaticText(handles)
tString = sprintf('y1_pocz = y1(%d) = ', handles.a);
set(handles.text14, 'String', tString);
tString = sprintf('y2_pocz = y2(%d) = ', handles.a);
set(handles.text19, 'String', tString);
tString = sprintf('h = (b - a) / n = %4f', (handles.b - handles.a) / handles.n);
set(handles.text20, 'String', tString);
