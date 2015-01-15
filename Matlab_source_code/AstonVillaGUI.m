function varargout = AstonVillaGUI(varargin)
% ASTONVILLAGUI MATLAB code for AstonVillaGUI.fig
%      ASTONVILLAGUI, by itself, creates a new ASTONVILLAGUI or raises the existing
%      singleton*.
%
%      H = ASTONVILLAGUI returns the handle to a new ASTONVILLAGUI or the handle to
%      the existing singleton*.
%
%      ASTONVILLAGUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in ASTONVILLAGUI.M with the given input arguments.
%
%      ASTONVILLAGUI('Property','Value',...) creates a new ASTONVILLAGUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before AstonVillaGUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to AstonVillaGUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help AstonVillaGUI

% Last Modified by GUIDE v2.5 25-Apr-2014 11:10:58

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @AstonVillaGUI_OpeningFcn, ...
                   'gui_OutputFcn',  @AstonVillaGUI_OutputFcn, ...
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


% --- Executes just before AstonVillaGUI is made visible.
function AstonVillaGUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to AstonVillaGUI (see VARARGIN)

% Choose default command line output for AstonVillaGUI
handles.output = hObject;
axes(handles.axes1)
points = [68 65 65 62 61 58 55 55 52 51 48 47 47 46 43 40 39 36 35 32 29 26 23 22 19 16 13 12 9 8 5 2 2 2 1];
pointsAV = fliplr(points);
plot(pointsAV,'Color','y','Marker','.');
box off;
title({'vs. Aston Villa';'Head-to-Head'},'color','w');
xlabel('Games Played');
ylabel('Points');
xlim([1 33]);
ylim([0 70]);
set(handles.axes1,'XTick',1:1:33,'YTick',0:5:70,'YGrid','on','Color',[.33,.33,.33],'xcolor','w','ycolor','w');

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes AstonVillaGUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = AstonVillaGUI_OutputFcn(hObject, eventdata, handles) 
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
