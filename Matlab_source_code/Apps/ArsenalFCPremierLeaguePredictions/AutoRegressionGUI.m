function varargout = AutoRegressionGUI(varargin)
% AUTOREGRESSIONGUI MATLAB code for AutoRegressionGUI.fig
%      AUTOREGRESSIONGUI, by itself, creates a new AUTOREGRESSIONGUI or raises the existing
%      singleton*.
%
%      H = AUTOREGRESSIONGUI returns the handle to a new AUTOREGRESSIONGUI or the handle to
%      the existing singleton*.
%
%      AUTOREGRESSIONGUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in AUTOREGRESSIONGUI.M with the given input arguments.
%
%      AUTOREGRESSIONGUI('Property','Value',...) creates a new AUTOREGRESSIONGUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before AutoRegressionGUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to AutoRegressionGUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help AutoRegressionGUI

% Last Modified by GUIDE v2.5 06-May-2014 14:41:55

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @AutoRegressionGUI_OpeningFcn, ...
                   'gui_OutputFcn',  @AutoRegressionGUI_OutputFcn, ...
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


% --- Executes just before AutoRegressionGUI is made visible.
function AutoRegressionGUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to AutoRegressionGUI (see VARARGIN)

% Choose default command line output for AutoRegressionGUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes AutoRegressionGUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = AutoRegressionGUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



% --- Executes on button press in showActualTag.
function showActualTag_Callback(hObject, eventdata, handles)
% hObject    handle to showActualTag (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of showActualTag
%set the actual results table visibility dependent on user toggle of checkbox
set(handles.actualTableTag,'Visible','Off')
if (((get(handles.showActualTag,'Value') == get(handles.showActualTag,'Max'))))
    actual = actual_function; %a function script containing cell array of data
    set(handles.actualTableTag,'Visible','On','Data',actual)
else
    set(handles.actualTableTag,'Visible','Off')
end


% --- Executes on button press in exit.
function exit_Callback(hObject, eventdata, handles)
% hObject    handle to exit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%close current screen and go back to menu
close(gcf);
menu_GUI;


% --- Executes on button press in predict.
function predict_Callback(hObject, eventdata, handles)
% hObject    handle to predict (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
regression = AutoRegressive;%function file containing array of predicted results
set(handles.arTableTag,'visible','on','Data',regression); %show predicted results on button click
