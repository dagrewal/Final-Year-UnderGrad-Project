function varargout = NewcastleGUI(varargin)
% NEWCASTLEGUI MATLAB code for NewcastleGUI.fig
%      NEWCASTLEGUI, by itself, creates a new NEWCASTLEGUI or raises the existing
%      singleton*.
%
%      H = NEWCASTLEGUI returns the handle to a new NEWCASTLEGUI or the handle to
%      the existing singleton*.
%
%      NEWCASTLEGUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in NEWCASTLEGUI.M with the given input arguments.
%
%      NEWCASTLEGUI('Property','Value',...) creates a new NEWCASTLEGUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before NewcastleGUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to NewcastleGUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help NewcastleGUI

% Last Modified by GUIDE v2.5 01-May-2014 18:40:47

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @NewcastleGUI_OpeningFcn, ...
                   'gui_OutputFcn',  @NewcastleGUI_OutputFcn, ...
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


% --- Executes just before NewcastleGUI is made visible.
function NewcastleGUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to NewcastleGUI (see VARARGIN)

% Choose default command line output for NewcastleGUI
handles.output = hObject;
axes(handles.axes1)
points = [61 58 55 52 51 50 50 47 44 41 40 39 38 38 35 32 29 28 25 24 21 18 18 17 14 14 13 12 9 6 3 3];
pointsFlip = fliplr(points);
plot(pointsFlip,'Color','y','Marker','.');
box off;
title({'vs. Newcastle United';'Head-to-Head'},'color','w');
xlabel('Games Played');
ylabel('Points');
xlim([1 32]);
ylim([0 70]);
set(handles.axes1,'XTick',1:1:32,'YTick',0:5:70,'YGrid','on','Color',[.33,.33,.33],'xcolor','w','ycolor','w');

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes NewcastleGUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = NewcastleGUI_OutputFcn(hObject, eventdata, handles) 
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
