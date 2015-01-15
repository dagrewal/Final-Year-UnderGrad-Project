function varargout = Season1112(varargin)
% SEASON1112 MATLAB code for Season1112.fig
%      SEASON1112, by itself, creates a new SEASON1112 or raises the existing
%      singleton*.
%
%      H = SEASON1112 returns the handle to a new SEASON1112 or the handle to
%      the existing singleton*.
%
%      SEASON1112('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SEASON1112.M with the given input arguments.
%
%      SEASON1112('Property','Value',...) creates a new SEASON1112 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Season1112_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Season1112_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Season1112

% Last Modified by GUIDE v2.5 01-May-2014 17:16:23

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Season1112_OpeningFcn, ...
                   'gui_OutputFcn',  @Season1112_OutputFcn, ...
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


% --- Executes just before Season1112 is made visible.
function Season1112_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Season1112 (see VARARGIN)

% Choose default command line output for Season1112
handles.output = hObject;
set(handles.axes3,'visible','off'); %set axes3 visibility to off when gui is loaded
axes(handles.axes1); %focus on axes 1
Points_1112 = [1;1;1;4;4;7;7;10;13;16;19;22;23;26;29;29;32;33;36;36;36;36;37;40;43;46;49;52;55;58;58;61;64;64;65;66;67;70]; %data
plot(Points_1112,'Color','y','Marker','.'); %plot data and change style
box off; %turn off z-axis
title('2011-2012','color','w'); %plot title
xlim([0 38]); %x-axis limits
ylim([0 100]);%y-axis limits
xlabel('Games Played'); %x-axis label
ylabel('Points');%y-axis label
%labels = [1 6 11 16 21 26 31 ]; %x-axis tick labels to be set in next line of code
set(handles.axes1,'YGrid','on','XTick',0:2:38,'YTick',0:5:100,'Color',[.33,.33,.33],'ycolor','w','xcolor','w');
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Season1112 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Season1112_OutputFcn(hObject, eventdata, handles) 
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

% --- Executes on button press in standings.
function standings_Callback(hObject, eventdata, handles)
% hObject    handle to standings (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.axes3,'visible','on'); %make axes visible when button is pressed
axes(handles.axes3); %reference to the axes on the gui
league_pos = [3;1;2;2;2;1;2;1;2;4;4;3;4;3;4;3;4]; %the data
plot(league_pos,'color','y','Marker','.','MarkerEdgeColor','b'); %data to plot as well as style conditions
xlim ([1 17]) % x-axis params
ylim([1 20]) %y-axis params
% set conditions for the graph including tick names, tick markers,background color etc.
set (gca,'Color',[.33,.33,.33], 'XTick', 1:1:17, 'XGrid', 'on', 'XTickLabel', {'96-97', '97-98', '98-99', '99-00', '00-01', '01-02', '02-03', '03-04', '04-05', '05-06', '06-07', '07-08', '08-09', '09-10', '10-11', '11-12', '12-13'}, 'YTick', 1:1:20, 'YDir', 'reverse', 'YGrid', 'on','ycolor','w','xcolor','w') 
xlabel('Seasons') %x-axis label
ylabel('League Positions') % y-axis label
box off %take off z-axis and top line
