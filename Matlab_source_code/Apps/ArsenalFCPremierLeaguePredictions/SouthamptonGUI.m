function varargout = SouthamptonGUI(varargin)
% SOUTHAMPTONGUI MATLAB code for SouthamptonGUI.fig
%      SOUTHAMPTONGUI, by itself, creates a new SOUTHAMPTONGUI or raises the existing
%      singleton*.
%
%      H = SOUTHAMPTONGUI returns the handle to a new SOUTHAMPTONGUI or the handle to
%      the existing singleton*.
%
%      SOUTHAMPTONGUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SOUTHAMPTONGUI.M with the given input arguments.
%
%      SOUTHAMPTONGUI('Property','Value',...) creates a new SOUTHAMPTONGUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before SouthamptonGUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to SouthamptonGUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help SouthamptonGUI

% Last Modified by GUIDE v2.5 01-May-2014 18:50:02

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @SouthamptonGUI_OpeningFcn, ...
                   'gui_OutputFcn',  @SouthamptonGUI_OutputFcn, ...
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


% --- Executes just before SouthamptonGUI is made visible.
function SouthamptonGUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to SouthamptonGUI (see VARARGIN)

% Choose default command line output for SouthamptonGUI
handles.output = hObject;
axes(handles.axes1)
points = [42 41 38 37 36 33 30 27 27 26 23 23 20 17 14 13 12 9 6 3];
pointsFlip = fliplr(points);
plot(pointsFlip,'Color','y','Marker','.');
box off;
title({'vs. Southampton';'Head-to-Head'},'color','w');
xlabel('Games Played');
ylabel('Points');
xlim([1 20]);
ylim([0 60]);
set(handles.axes1,'XTick',1:1:20,'YTick',0:5:60,'YGrid','on','Color',[.33,.33,.33],'xcolor','w','ycolor','w');

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes SouthamptonGUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = SouthamptonGUI_OutputFcn(hObject, eventdata, handles) 
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
