function varargout = NaiveBayesAllView(varargin)
% NaiveBayesAllView MATLAB code for NaiveBayesAllView.fig
%      NaiveBayesAllView, by itself, creates a new NaiveBayesAllView or raises the existing
%      singleton*.
%
%      H = NaiveBayesAllView returns the handle to a new NaiveBayesAllView or the handle to
%      the existing singleton*.
%
%      NaiveBayesAllView('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in NaiveBayesAllView.M with the given input arguments.
%
%      NaiveBayesAllView('Property','Value',...) creates a new NaiveBayesAllView or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before NaiveBayesAllView_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to NaiveBayesAllView_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help NaiveBayesAllView

% Last Modified by GUIDE v2.5 03-May-2014 15:39:30

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @NaiveBayesAllView_OpeningFcn, ...
                   'gui_OutputFcn',  @NaiveBayesAllView_OutputFcn, ...
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


% --- Executes just before NaiveBayesAllView is made visible.
function NaiveBayesAllView_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to NaiveBayesAllView (see VARARGIN)

% Choose default command line output for NaiveBayesAllView
handles.output = hObject;
axes(handles.axes1);
xlim([0 38])
ylim([0 100])
xlabel('Games Played')
ylabel('Points')
box off;
set(handles.axes1,'color',[.33,.33,.33],'ycolor','w','xcolor','w','YGrid','on','XGrid','off','XTick',1:1:38,'YTick',0:5:100)
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes NaiveBayesAllView wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = NaiveBayesAllView_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes when selected object is changed in uipanel1.
function uipanel1_SelectionChangeFcn(hObject, eventdata, handles)
% hObject    handle to the selected object in uipanel1 
% eventdata  structure with the following fields (see UIBUTTONGROUP)
%	EventName: string 'SelectionChanged' (read only)
%	OldValue: handle of the previously selected object or empty if none was selected
%	NewValue: handle of the currently selected object
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in checkbox1.
function checkbox1_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox1

nb1 = [3 6 9 12 15 15 18 21 24 25 25 28 31 34 37 40 43 46 46 49 52 52 53 56 56 56 59 59 60 61 64 67 70 73 76 79 82 85];
p1 = plot(nb1,'color','r');
set(p1,'tag','p1')
axes(handles.axes1);
    xlim([1 38])
    ylim([0 100])
    xlabel('Games Played')
    ylabel('Points')
    set(p1,'Visible','On')
    hold on;
    set(handles.axes1,'color',[.33,.33,.33],'ycolor','w','xcolor','w','YGrid','on','XGrid','off','XTick',1:1:38,'YTick',0:5:100,'box','off')
if (((get(handles.checkbox1,'Value') == get(handles.checkbox1,'Min'))))
    delete(findobj('tag','p1'))
end

% --- Executes on button press in checkbox2.
function checkbox2_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
nb2 = [1 4 7 10 13 13 16 19 22 23 24 27 30 33 36 39 42 45 48 51 54 54 55 58 58 58 61 61 62 63 66 66 69 72 75 78 81 84];
p2 = plot(nb2,'color','b');
set(p2,'tag','p2')
axes(handles.axes1);
    xlim([1 38])
    ylim([0 100])
    xlabel('Games Played')
    ylabel('Points')
    set(p2,'Visible','On')
    hold on;
    set(handles.axes1,'color',[.33,.33,.33],'ycolor','w','xcolor','w','YGrid','on','XGrid','off','XTick',1:1:38,'YTick',0:5:100,'box','off')
if (((get(handles.checkbox2,'Value') == get(handles.checkbox2,'Min'))))
    delete(findobj('tag','p2'))
end
% Hint: get(hObject,'Value') returns toggle state of checkbox2


% --- Executes on button press in checkbox3.
function checkbox3_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
nb3 = [0 1 2 3 3 3 4 5 8 8 11 12 15 18 18 18 19 22 22 25 25 28 28 31 32 34 37 38 38 38 41 42 45 45 45 45 46 49];
p3 = plot(nb3,'color','y');
set(p3,'tag','p3')
axes(handles.axes1);
    xlim([1 38])
    ylim([0 100])
    xlabel('Games Played')
    ylabel('Points')
    set(p3,'Visible','On')
    hold on;
    set(handles.axes1,'color',[.33,.33,.33],'ycolor','w','xcolor','w','YGrid','on','XGrid','off','XTick',1:1:38,'YTick',0:5:100,'box','off')
if (((get(handles.checkbox3,'Value') == get(handles.checkbox3,'Min'))))
    delete(findobj('tag','p3'))
end
% Hint: get(hObject,'Value') returns toggle state of checkbox3


% --- Executes on button press in checkbox4.
function checkbox4_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
nb4 = [0 0 0 3 3 3 6 9 12 12 12 12 15 18 18 18 18 18 18 21 21 21 21 24 24 24 27 28 28 28 28 28 28 28 31 31 34 37];
p4 = plot(nb4,'color','m');
set(p4,'tag','p4')
axes(handles.axes1);
    xlim([1 38])
    ylim([0 100])
    xlabel('Games Played')
    ylabel('Points')
    set(p4,'Visible','On')
    hold on;
    set(handles.axes1,'color',[.33,.33,.33],'ycolor','w','xcolor','w','YGrid','on','XGrid','off','XTick',1:1:38,'YTick',0:5:100,'box','off')
if (((get(handles.checkbox4,'Value') == get(handles.checkbox4,'Min'))))
    delete(findobj('tag','p4'))
end
% Hint: get(hObject,'Value') returns toggle state of checkbox4


% --- Executes on button press in checkbox5.
function checkbox5_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
nb5 = [3 4 7 10 13 13 16 19 22 25 26 29 32 35 38 41 41 44 45 48 51 54 57 60 60 60 63 66 66 67 70 73 76 77 80 81 84 87];
p5 = plot(nb5,'color','g');
set(p5,'tag','p5')
axes(handles.axes1);
    xlim([1 38])
    ylim([0 100])
    xlabel('Games Played')
    ylabel('Points')
    set(p5,'Visible','On')
    hold on;
    set(handles.axes1,'color',[.33,.33,.33],'ycolor','w','xcolor','w','YGrid','on','XGrid','off','XTick',1:1:38,'YTick',0:5:100,'box','off')
if (((get(handles.checkbox5,'Value') == get(handles.checkbox5,'Min'))))
    delete(findobj('tag','p5'))
end
% Hint: get(hObject,'Value') returns toggle state of checkbox5


% --- Executes on button press in checkbox6.
function checkbox6_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
actual = [0 3 6 9 12 15 16 19 22 25 25 28 31 34 35 35 36 39 42 45 48 51 52 55 55 56 59 59 62 62 63 64 64 67 70 73 76];
p6 = plot(actual,'color','c');
set(p6,'tag','p6')
axes(handles.axes1);
    xlim([1 38])
    ylim([0 100])
    xlabel('Games Played')
    ylabel('Points')
    set(p6,'Visible','On')
    hold on;
    set(handles.axes1,'color',[.33,.33,.33],'ycolor','w','xcolor','w','YGrid','on','XGrid','off','XTick',1:1:38,'YTick',0:5:100,'box','off')
if (((get(handles.checkbox6,'Value') == get(handles.checkbox6,'Min'))))
    delete(findobj('tag','p6'))
end
% Hint: get(hObject,'Value') returns toggle state of checkbox6


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close(gcf);
menu_GUI;


% --- Executes on button press in checkbox7.
function checkbox7_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
auto = [3 4 5 8 11 14 17 18 21 22 23 24 27 30 31 31 31 34 37 40 41 44 47 50 53 53 56 59 60 61 62 62 63 66 69 72 75 76 79];
p7 = plot(auto,'color','w');
set(p7,'tag','p7')
axes(handles.axes1);
    xlim([1 38])
    ylim([0 100])
    xlabel('Games Played')
    ylabel('Points')
    set(p7,'Visible','On')
    hold on;
    set(handles.axes1,'color',[.33,.33,.33],'ycolor','w','xcolor','w','YGrid','on','XGrid','off','XTick',1:1:38,'YTick',0:5:100,'box','off')
if (((get(handles.checkbox7,'Value') == get(handles.checkbox7,'Min'))))
    delete(findobj('tag','p7'))
end
% Hint: get(hObject,'Value') returns toggle state of checkbox7
