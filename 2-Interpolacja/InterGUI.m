function varargout = InterGUI(varargin)
% INTERGUI MATLAB code for InterGUI.fig
%      INTERGUI, by itself, creates a new INTERGUI or raises the existing
%      singleton*.
%
%      H = INTERGUI returns the handle to a new INTERGUI or the handle to
%      the existing singleton*.
%
%      INTERGUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in INTERGUI.M with the given input arguments.
%
%      INTERGUI('Property','Value',...) creates a new INTERGUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before InterGUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to InterGUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help InterGUI

% Last Modified by GUIDE v2.5 07-Nov-2017 23:19:39

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @InterGUI_OpeningFcn, ...
                   'gui_OutputFcn',  @InterGUI_OutputFcn, ...
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


% --- Executes just before InterGUI is made visible.
function InterGUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to InterGUI (see VARARGIN)

% Choose default command line output for InterGUI
handles.output = hObject;
handles.a = 0;
handles.b = 0;
handles.n = 2;
handles.fun = @(x,y) x.^2 + y.^2;
set(handles.text9,'visible','off');
set(handles.uitable1,'visible','off');

% Update handles structure
guidata(hObject, handles);
update_StaticText(handles)

% UIWAIT makes InterGUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);

% --- Outputs from this function are returned to the command line.
function varargout = InterGUI_OutputFcn(hObject, eventdata, handles) 
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
tString = sprintf('Podzielonym na 2n^2 = %d trójk¹tów przystaj¹cych', 2*handles.n*handles.n);
set(handles.text7, 'String', tString);
tString = sprintf(', (%d, %d), (%d, %d), (%d, %d)', handles.a+1, handles.b, handles.a, handles.b+1, handles.a+1, handles.b+1);
set(handles.text6, 'String', tString);


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[W, err] = InterpolacjaKwadratowymiNaKwadracie(handles.fun,handles.a,handles.b,handles.n);
tString = sprintf('Maksymalny otrzymany b³¹d bezwzglêdny: %d', err);
set(handles.text9, 'String', tString);
set(handles.uitable1, 'Data', W);
set(handles.uitable1,'ColumnName',{'x';'y';'f(x,y)';'inter(x,y)';'b³¹d bezwzglêdny';'b³¹d wzglêdny'})

figure
p = plot3(W(:,1),W(:,2),W(:,3),'g',W(:,1),W(:,2),W(:,4),'r');
title('Wykres funkcji f(x,y) i funkcji interpolowanej');
xlabel('x');
ylabel('y');
legend('f(x,y)','funkcja interpolowana');
grid on;

set(handles.text9,'visible','on');
set(handles.uitable1,'visible','on');
