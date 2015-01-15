function varargout = TottenhamGUI(varargin)
% TOTTENHAMGUI MATLAB code for TottenhamGUI.fig
%      TOTTENHAMGUI, by itself, creates a new TOTTENHAMGUI or raises the existing
%      singleton*.
%
%      H = TOTTENHAMGUI returns the handle to a new TOTTENHAMGUI or the handle to
%      the existing singleton*.
%
%      TOTTENHAMGUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in TOTTENHAMGUI.M with the given input arguments.
%
%      TOTTENHAMGUI('Property','Value',...) creates a new TOTTENHAMGUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before TottenhamGUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to TottenhamGUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help TottenhamGUI

% Last Modified by GUIDE v2.5 01-May-2014 19:08:27

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @TottenhamGUI_OpeningFcn, ...
                   'gui_OutputFcn',  @TottenhamGUI_OutputFcn, ...
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


% --- Executes just before TottenhamGUI is made visible.
function TottenhamGUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to TottenhamGUI (see VARARGIN)

% Choose default command line output for TottenhamGUI
handles.output = hObject;
axes(handles.axes1)
points = [59 59 56 53 53 52 52 52 49 48 47 44 41 40 37 36 35 32 29 28 25 24 21 18 17 14 13 10 10 7 6 5 4 3];
pointsFlip = fliplr(points);
plot(pointsFlip,'Color','y','Marker','.');
box off;
title({'vs. Tottenham Hotspur';'Head-to-Head'},'color','w');
xlabel('Games Played');
ylabel('Points');
xlim([1 34]);
ylim([0 70]);
set(handles.axes1,'XTick',1:2:34,'YTick',0:5:70,'YGrid','on','Color',[.33,.33,.33],'xcolor','w','ycolor','w');

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes TottenhamGUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = TottenhamGUI_OutputFcn(hObject, eventdata, handles) 
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
