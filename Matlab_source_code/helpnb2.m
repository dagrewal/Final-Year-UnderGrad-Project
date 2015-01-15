function varargout = helpnb2(varargin)
% HELPNB2 MATLAB code for helpnb2.fig
%      HELPNB2, by itself, creates a new HELPNB2 or raises the existing
%      singleton*.
%
%      H = HELPNB2 returns the handle to a new HELPNB2 or the handle to
%      the existing singleton*.
%
%      HELPNB2('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in HELPNB2.M with the given input arguments.
%
%      HELPNB2('Property','Value',...) creates a new HELPNB2 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before helpnb2_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to helpnb2_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help helpnb2

% Last Modified by GUIDE v2.5 16-Jun-2014 22:33:32

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @helpnb2_OpeningFcn, ...
                   'gui_OutputFcn',  @helpnb2_OutputFcn, ...
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


% --- Executes just before helpnb2 is made visible.
function helpnb2_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to helpnb2 (see VARARGIN)

% Choose default command line output for helpnb2
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes helpnb2 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = helpnb2_OutputFcn(hObject, eventdata, handles) 
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
close(gcf);
