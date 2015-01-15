function varargout = ChelseaGUI(varargin)
% CHELSEAGUI MATLAB code for ChelseaGUI.fig
%      CHELSEAGUI, by itself, creates a new CHELSEAGUI or raises the existing
%      singleton*.
%
%      H = CHELSEAGUI returns the handle to a new CHELSEAGUI or the handle to
%      the existing singleton*.
%
%      CHELSEAGUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in CHELSEAGUI.M with the given input arguments.
%
%      CHELSEAGUI('Property','Value',...) creates a new CHELSEAGUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before ChelseaGUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to ChelseaGUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help ChelseaGUI

% Last Modified by GUIDE v2.5 01-May-2014 17:37:09

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @ChelseaGUI_OpeningFcn, ...
                   'gui_OutputFcn',  @ChelseaGUI_OutputFcn, ...
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


% --- Executes just before ChelseaGUI is made visible.
function ChelseaGUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to ChelseaGUI (see VARARGIN)

% Choose default command line output for ChelseaGUI
handles.output = hObject;
axes(handles.axes1)
points = [52 52 52 51 48 45 45 45 45 45 42 42 39 38 37 37 37 36 35 32 29 26 25 22 21 20 19 16 13 10 9 6 3];
pointsFlip = fliplr(points);
plot(pointsFlip,'Color','y','Marker','.');
box off;
title({'vs. Chelsea';'Head-to-Head'},'color','w');
xlabel('Games Played');
ylabel('Points');
xlim([1 33]);
ylim([0 70]);
set(handles.axes1,'XTick',1:1:33,'YTick',0:5:70,'YGrid','on','Color',[.33,.33,.33],'xcolor','w','ycolor','w');

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes ChelseaGUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = ChelseaGUI_OutputFcn(hObject, eventdata, handles) 
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
