function varargout = CalkaGUI(varargin)
% CALKAGUI MATLAB code for CalkaGUI.fig
%      CALKAGUI, by itself, creates a new CALKAGUI or raises the existing
%      singleton*.
%
%      H = CALKAGUI returns the handle to a new CALKAGUI or the handle to
%      the existing singleton*.
%
%      CALKAGUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in CALKAGUI.M with the given input arguments.
%
%      CALKAGUI('Property','Value',...) creates a new CALKAGUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before CalkaGUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to CalkaGUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help CalkaGUI

% Last Modified by GUIDE v2.5 19-Nov-2017 23:39:18

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @CalkaGUI_OpeningFcn, ...
                   'gui_OutputFcn',  @CalkaGUI_OutputFcn, ...
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


% --- Executes just before CalkaGUI is made visible.
function CalkaGUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to CalkaGUI (see VARARGIN)

% Choose default command line output for CalkaGUI
handles.output = hObject;
handles.n = 2;
handles.fun = @(x,y) x + 3*y - 1;
set(handles.uitable1,'visible','off');
set(handles.text9,'visible','off');


% Update handles structure
guidata(hObject, handles);
update_StaticText(handles)

% UIWAIT makes CalkaGUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);

% --- Outputs from this function are returned to the command line.
function varargout = CalkaGUI_OutputFcn(hObject, eventdata, handles) 
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
handles.fun = vectorize(inline(get(hObject,'string'),'x','y'));
guidata(hObject,handles);


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
handles.a = str2double(get(hObject,'String'));
guidata(hObject,handles);
update_StaticText(handles);

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
handles.b = str2double(get(hObject,'String'));
guidata(hObject,handles);
update_StaticText(handles);

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
handles.n = str2double(get(hObject,'String'));
guidata(hObject,handles);
update_StaticText(handles);

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

function update_StaticText(handles)
tString = sprintf('Podzielonym na 4n^2 = %d trójk¹tów przystaj¹cych', 4*handles.n*handles.n);
set(handles.text7, 'String', tString);


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[ W wyn ] = ObliczCalke(handles.fun, handles.n);
tString = sprintf('Obliczona ca³ka podwójna z f(x,y) na obszarze D wynosi: %d', wyn);
set(handles.text9, 'String', tString);
set(handles.uitable1, 'Data', W);
set(handles.uitable1,'ColumnName',{'x1';'y1';'x2';'y2';'x3';'y3';'obliczona ca³ka'})

figure;
plot([W(:,1) W(:,3) W(:,5)], [W(:,2) W(:,4) W(:,6)],'*r');
hold on
xlabel('x')
ylabel('y')
title('Podzia³ obszaru D na 4n^2 trójk¹tów przystaj¹cych')
legend('wierzcho³ki trójk¹tów')
grid on
grid minor
axis([-1.5 1.5 -1.5 1.5])

set(handles.uitable1,'visible','on');
set(handles.text9,'visible','on');
