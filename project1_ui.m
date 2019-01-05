function varargout = project1_ui(varargin)

gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @project1_ui_OpeningFcn, ...
                   'gui_OutputFcn',  @project1_ui_OutputFcn, ...
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


% --- Executes just before project1_ui is made visible.
function project1_ui_OpeningFcn(hObject, eventdata, handles, varargin)
 [x,y,z,w]=file_reader('accel_data.txt');

axes(handles.axes1)
plot(x,'r')
axes(handles.axes2)
plot(y,'r')
axes(handles.axes3)
plot(z,'r')
axes(handles.axes4)
plot(w,'r')

% Choose default command line output for project1_ui
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);


% --- Outputs from this function are returned to the command line.
function varargout = project1_ui_OutputFcn(hObject, eventdata, handles) 

varargout{1} = handles.output;



function edit1_Callback(hObject, eventdata, handles)

% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
 [x,y,z,w]=file_reader('accel_data.txt');

edit_text=get(handles.edit1,'string');
window_number=str2double(edit_text);

v = get(handles.popupmenu2,'Value'); %get currently selected option from menu
if v == 1
    smooth_x=moving_average_filter(x,window_number);
    smooth_y=moving_average_filter(y,window_number);
    smooth_z=moving_average_filter(z,window_number);
    smooth_w=moving_average_filter(w,window_number);
elseif v == 2
    smooth_x=Gaussion_Filter(x,window_number);
    smooth_y=Gaussion_Filter(y,window_number);
    smooth_z=Gaussion_Filter(z,window_number);
    smooth_w=Gaussion_Filter(w,window_number);    
end




axes(handles.axes5)
plot(smooth_x)
axes(handles.axes6)
plot(smooth_y)
axes(handles.axes7)
plot(smooth_z)
axes(handles.axes8)
plot(smooth_w)


% --- Executes on selection change in popupmenu2.
function popupmenu2_Callback(hObject, eventdata, handles)


% --- Executes during object creation, after setting all properties.
function popupmenu2_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
