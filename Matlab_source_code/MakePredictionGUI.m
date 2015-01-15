function varargout = MakePredictionGUI(varargin)
% MAKEPREDICTIONGUI MATLAB code for MakePredictionGUI.fig
%      MAKEPREDICTIONGUI, by itself, creates a new MAKEPREDICTIONGUI or raises the existing
%      singleton*.
%
%      H = MAKEPREDICTIONGUI returns the handle to a new MAKEPREDICTIONGUI or the handle to
%      the existing singleton*.
%
%      MAKEPREDICTIONGUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MAKEPREDICTIONGUI.M with the given input arguments.
%
%      MAKEPREDICTIONGUI('Property','Value',...) creates a new MAKEPREDICTIONGUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before MakePredictionGUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to MakePredictionGUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help MakePredictionGUI

% Last Modified by GUIDE v2.5 17-Jun-2014 13:03:42

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @MakePredictionGUI_OpeningFcn, ...
                   'gui_OutputFcn',  @MakePredictionGUI_OutputFcn, ...
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


% --- Executes just before MakePredictionGUI is made visible.
function MakePredictionGUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to MakePredictionGUI (see VARARGIN)

% Choose default command line output for MakePredictionGUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes MakePredictionGUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = MakePredictionGUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in menu.
function menu_Callback(hObject, eventdata, handles)
% hObject    handle to menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close(gcf);
menu_GUI;

% --- Executes on button press in help1.
function help1_Callback(hObject, eventdata, handles)
% hObject    handle to help1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
helpnb1;

% --- Executes on button press in help2.
function help2_Callback(hObject, eventdata, handles)
% hObject    handle to help2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
helpnb2;

% --- Executes on button press in help3.
function help3_Callback(hObject, eventdata, handles)
% hObject    handle to help3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
helpnb3;

% --- Executes on button press in help4.
function help4_Callback(hObject, eventdata, handles)
% hObject    handle to help4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
helpnb4;

% --- Executes on button press in help5.
function help5_Callback(hObject, eventdata, handles)
% hObject    handle to help5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
helpnb5;

% --- Executes when selected object is changed in predPanel.
function predPanel_SelectionChangeFcn(hObject, eventdata, handles)
% hObject    handle to the selected object in predPanel 
% eventdata  structure with the following fields (see UIBUTTONGROUP)
%	EventName: string 'SelectionChanged' (read only)
%	OldValue: handle of the previously selected object or empty if none was selected
%	NewValue: handle of the currently selected object
% handles    structure with handles and user data (see GUIDATA)
% select which menu to produce depending on which button is clicked
if hObject == handles.nb1
    nb1Pred;
elseif hObject == handles.nb2
    nb2Pred;
elseif hObject == handles.nb3
    nb3Pred;
elseif hObject == handles.nb4
    nb4Pred;
elseif hObject == handles.nb5
    nb5Pred;
end


% --- Executes on button press in compare.
function compare_Callback(hObject, eventdata, handles)
% hObject    handle to compare (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close(gcf);
NaiveBayesAllView;
