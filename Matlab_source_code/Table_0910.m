function varargout = Table_0910(varargin)
% TABLE_0910 MATLAB code for Table_0910.fig
%      TABLE_0910, by itself, creates a new TABLE_0910 or raises the existing
%      singleton*.
%
%      H = TABLE_0910 returns the handle to a new TABLE_0910 or the handle to
%      the existing singleton*.
%
%      TABLE_0910('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in TABLE_0910.M with the given input arguments.
%
%      TABLE_0910('Property','Value',...) creates a new TABLE_0910 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Table_0910_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Table_0910_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Table_0910

% Last Modified by GUIDE v2.5 28-Feb-2014 10:23:12

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Table_0910_OpeningFcn, ...
                   'gui_OutputFcn',  @Table_0910_OutputFcn, ...
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


% --- Executes just before Table_0910 is made visible.
function Table_0910_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Table_0910 (see VARARGIN)

% Choose default command line output for Table_0910
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Table_0910 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Table_0910_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;
