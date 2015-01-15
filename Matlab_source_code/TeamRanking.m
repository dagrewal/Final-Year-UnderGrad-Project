function varargout = TeamRanking(varargin)
% TEAMRANKING MATLAB code for TeamRanking.fig
%      TEAMRANKING, by itself, creates a new TEAMRANKING or raises the existing
%      singleton*.
%
%      H = TEAMRANKING returns the handle to a new TEAMRANKING or the handle to
%      the existing singleton*.
%
%      TEAMRANKING('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in TEAMRANKING.M with the given input arguments.
%
%      TEAMRANKING('Property','Value',...) creates a new TEAMRANKING or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before TeamRanking_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to TeamRanking_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help TeamRanking

% Last Modified by GUIDE v2.5 20-Apr-2014 00:05:11

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @TeamRanking_OpeningFcn, ...
                   'gui_OutputFcn',  @TeamRanking_OutputFcn, ...
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


% --- Executes just before TeamRanking is made visible.
function TeamRanking_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to TeamRanking (see VARARGIN)

% Choose default command line output for TeamRanking
handles.output = hObject;
imageAxis = axes('unit', 'normalized', 'position', [0 0 1 1]);
bg = imread('premier-league-slide1.jpg');imagesc(bg);
set(imageAxis,'handlevisibility','off','visible','off');
uistack(imageAxis,'bottom');
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes TeamRanking wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = TeamRanking_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;
