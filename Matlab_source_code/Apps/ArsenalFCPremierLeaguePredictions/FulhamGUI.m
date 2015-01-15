function varargout = FulhamGUI(varargin)
% FULHAMGUI MATLAB code for FulhamGUI.fig
%      FULHAMGUI, by itself, creates a new FULHAMGUI or raises the existing
%      singleton*.
%
%      H = FULHAMGUI returns the handle to a new FULHAMGUI or the handle to
%      the existing singleton*.
%
%      FULHAMGUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in FULHAMGUI.M with the given input arguments.
%
%      FULHAMGUI('Property','Value',...) creates a new FULHAMGUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before FulhamGUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to FulhamGUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help FulhamGUI

% Last Modified by GUIDE v2.5 01-May-2014 18:02:05

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @FulhamGUI_OpeningFcn, ...
                   'gui_OutputFcn',  @FulhamGUI_OutputFcn, ...
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


% --- Executes just before FulhamGUI is made visible.
function FulhamGUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to FulhamGUI (see VARARGIN)

% Choose default command line output for FulhamGUI
handles.output = hObject;
axes(handles.axes1)
points = [53 50 49 49 48 47 44 41 38 37 37 34 31 28 28 25 22 19 16 13 12 9 6 3];
pointsFlip = fliplr(points);
plot(pointsFlip,'Color','y','Marker','.');
box off;
title({'vs. Fulham';'Head-to-Head'},'color','w');
xlabel('Games Played');
ylabel('Points');
xlim([1 24]);
ylim([0 70]);
set(handles.axes1,'XTick',1:1:24,'YTick',0:5:70,'YGrid','on','Color',[.33,.33,.33],'xcolor','w','ycolor','w');

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes FulhamGUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = FulhamGUI_OutputFcn(hObject, eventdata, handles) 
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
