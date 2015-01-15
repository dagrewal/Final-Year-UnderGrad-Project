function varargout = SwanseaGUI(varargin)
% SWANSEAGUI MATLAB code for SwanseaGUI.fig
%      SWANSEAGUI, by itself, creates a new SWANSEAGUI or raises the existing
%      singleton*.
%
%      H = SWANSEAGUI returns the handle to a new SWANSEAGUI or the handle to
%      the existing singleton*.
%
%      SWANSEAGUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SWANSEAGUI.M with the given input arguments.
%
%      SWANSEAGUI('Property','Value',...) creates a new SWANSEAGUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before SwanseaGUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to SwanseaGUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help SwanseaGUI

% Last Modified by GUIDE v2.5 01-May-2014 19:03:51

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @SwanseaGUI_OpeningFcn, ...
                   'gui_OutputFcn',  @SwanseaGUI_OutputFcn, ...
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


% --- Executes just before SwanseaGUI is made visible.
function SwanseaGUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to SwanseaGUI (see VARARGIN)

% Choose default command line output for SwanseaGUI
handles.output = hObject;
axes(handles.axes1)
points = [6 3 3 3];
pointsFlip = fliplr(points);
plot(pointsFlip,'Color','y','Marker','.');
box off;
title({'vs. Swansea City';'Head-to-Head'},'color','w');
xlabel('Games Played');
ylabel('Points');
xlim([1 4]);
ylim([0 10]);
set(handles.axes1,'XTick',1:1:4,'YTick',0:1:10,'YGrid','on','Color',[.33,.33,.33],'xcolor','w','ycolor','w');

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes SwanseaGUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = SwanseaGUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in exit.
function exit_Callback(hObject, eventdata, handles)
% hObject    handle to exit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close(gcf);
menu_GUI;
