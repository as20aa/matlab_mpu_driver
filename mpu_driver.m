function varargout = mpu_driver(varargin)
% MPU_DRIVER MATLAB code for mpu_driver.fig
%      MPU_DRIVER, by itself, creates a new MPU_DRIVER or raises the existing
%      singleton*.
%
%      H = MPU_DRIVER returns the handle to a new MPU_DRIVER or the handle to
%      the existing singleton*.
%
%      MPU_DRIVER('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MPU_DRIVER.M with the given input arguments.
%
%      MPU_DRIVER('Property','Value',...) creates a new MPU_DRIVER or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before mpu_driver_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to mpu_driver_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help mpu_driver

% Last Modified by GUIDE v2.5 09-Jul-2018 20:16:42

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @mpu_driver_OpeningFcn, ...
                   'gui_OutputFcn',  @mpu_driver_OutputFcn, ...
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


% --- Executes just before mpu_driver is made visible.
function mpu_driver_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to mpu_driver (see VARARGIN)

% Choose default command line output for mpu_driver
handles.output = hObject;
% Set the default paramaters
handles.portn = 'COM1';
handles.baudrate = 9600;
handles.databits = 8;
handles.stopbits = 1;
handles.isOpen = 0;
global flag;
global n;
global x;
global data;
data = zeros(8,3);
flag = 0;
n = 1;
x = [];
handles.s = serial(handles.portn);
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes mpu_driver wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = mpu_driver_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on selection change in portn.
function portn_Callback(hObject, eventdata, handles)
% hObject    handle to portn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns portn contents as cell array
%        contents{get(hObject,'Value')} returns selected item from portn
contents = cellstr(get(hObject,'String'));
val = get(hObject,'Value');
handles.portn = contents{val};
guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function portn_CreateFcn(hObject, eventdata, handles)
% hObject    handle to portn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function baudrate_Callback(hObject, eventdata, handles)
% hObject    handle to baudrate (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of baudrate as text
%        str2double(get(hObject,'String')) returns contents of baudrate as a double
% Set the baudrate by mannual.
handles.baudrate = str2double(get(hObject,'String'));
% Update the hObject.
guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function baudrate_CreateFcn(hObject, eventdata, handles)
% hObject    handle to baudrate (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end




function databits_Callback(hObject, eventdata, handles)
% hObject    handle to databits (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of databits as text
%        str2double(get(hObject,'String')) returns contents of databits as a double
% Set the databits by mannual.
handles.databits = str2double(hObject,'String');
% Update the hObject.
guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function databits_CreateFcn(hObject, eventdata, handles)
% hObject    handle to databits (see GCBO)
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


% --- Executes on button press in cbtn.
function cbtn_Callback(hObject, eventdata, handles)
% hObject    handle to cbtn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Connect the MPU via serial port
delete(instrfindall)
handles.s = serial(handles.portn);
guidata(hObject,handles)
set(handles.s,'BaudRate',handles.baudrate,'StopBits',handles.stopbits,...
    'DataBits',handles.databits,'BytesAvailableFcnMode','byte',...
    'BytesAvailableFcnCount',1,'Terminator',{'CR/LF',''});
handles.s.BytesAvailableFcn={@ReceiveCallback,handles};
fopen(handles.s)
disp('You had opened the serial port')
disp(handles.s)
guidata(hObject,handles)

% --- Executes on button press in discbtn.
function discbtn_Callback(hObject, eventdata, handles)
% hObject    handle to discbtn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% The correct way to close the serila port.
fclose(handles.s);
delete(handles.s);
disp('You had closed the serial port')


function stopbits_Callback(hObject, eventdata, handles)
% hObject    handle to stopbits (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Set the stopbits by manual.
handles.stopbits = str2double(hObject,'String');
guidata(hObject,handles);

% Hints: get(hObject,'String') returns contents of stopbits as text
%        str2double(get(hObject,'String')) returns contents of stopbits as a double


% --- Executes during object creation, after setting all properties.
function stopbits_CreateFcn(hObject, eventdata, handles)
% hObject    handle to stopbits (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes during object creation, after setting all properties.
function figure1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


function ReceiveCallback(hObject, eventdata, handles)
    % If you use the handle to transport the variables,
    % they will not change in this callback function.(why?)
    global flag;
    global n;
    global x;
    global data;
    % disp('Serial port callback function')
    temp = fread(handles.s,1);
    % Assign data to x to save the data sampled from the mpu
    % disp(handles.n)
    x(n) = temp;
    % Judge if we receive the '\r\n' terminator.
    if flag == 1
        if temp == 10
            n = 0;
            % disp('got the terminator')
            % disp(size(x))
            if size(x)<17
                % Show the data x.
                % Just comment it to ignore the output.
                % x
            else
                % Got the right data.
                
                [axis, pos, msg] = Process_data(x(1:17));
                % Write the confine signal to mpu
                fwrite(handles.s, 1);
                % Display the axis.
                % disp(axis)
                % Display the pos for debugging.
                % disp(pos)
                % handles.uitable1.data =  pos;
                if(axis == 61)
                    data(:,2) = pos';
                end
                if(axis == 59)
                    data(:,1) = pos';
                end
                if(axis == 63)
                    data(:,3) = pos';
                end
                % Just for transport the variable betweent windows.
                assignin('base','data',data);
                set(handles.uitable1,'Data',data)
                % Judge the position of palm and hand.
                Judge_palm(handles, data(:,2));
                Judge_hand(handles, data(:,1));
                % disp(axis)
            end
        end
        flag = 0;
    end
    if temp == 13
        flag = 1;
    end
    % Increce the n to store the data one by one.
    n = n + 1;


% --- Executes when entered data in editable cell(s) in uitable1.
function uitable1_CellEditCallback(hObject, eventdata, handles)
% hObject    handle to uitable1 (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.TABLE)
%	Indices: row and column indices of the cell(s) edited
%	PreviousData: previous data for the cell(s) edited
%	EditData: string(s) entered by the user
%	NewData: EditData or its converted form set on the Data property. Empty if Data was not changed
%	Error: error string when failed to convert EditData to appropriate value for Data
% handles    structure with handles and user data (see GUIDATA)


% --- Executes during object creation, after setting all properties.
function uitable1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to uitable1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Judge the position of palm.
function Judge_palm(handles, pos)
    if(pos(1)<0)
        handles.text7.String = '手心向内';
    else
        handles.text7.String = '手心向外';
    end
    
% Judge the position of hand.
function Judge_hand(handles,pos)
    if(pos(1)>0)
        handles.text8.String = '抬起';
    else
        handles.text8.String = '放下';
    end
