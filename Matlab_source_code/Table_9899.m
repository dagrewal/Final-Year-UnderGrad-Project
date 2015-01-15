function varargout = Table_9899(varargin)
% TABLE_9899 MATLAB code for Table_9899.fig
%      TABLE_9899, by itself, creates a new TABLE_9899 or raises the existing
%      singleton*.
%
%      H = TABLE_9899 returns the handle to a new TABLE_9899 or the handle to
%      the existing singleton*.
%
%      TABLE_9899('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in TABLE_9899.M with the given input arguments.
%
%      TABLE_9899('Property','Value',...) creates a new TABLE_9899 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Table_9899_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Table_9899_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Table_9899

% Last Modified by GUIDE v2.5 24-Feb-2014 16:31:16

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Table_9899_OpeningFcn, ...
                   'gui_OutputFcn',  @Table_9899_OutputFcn, ...
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


% --- Executes just before Table_9899 is made visible.
function Table_9899_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Table_9899 (see VARARGIN)

% Choose default command line output for Table_9899
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Table_9899 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Table_9899_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

%table properties
data(pIndex) = 
