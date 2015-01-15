function varargout = menu_GUI(varargin)
% MENU_GUI MATLAB code for menu_GUI.fig
%      MENU_GUI, by itself, creates a new MENU_GUI or raises the existing
%      singleton*.
%
%      H = MENU_GUI returns the handle to a new MENU_GUI or the handle to
%      the existing singleton*.
%
%      MENU_GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MENU_GUI.M with the given input arguments.
%
%      MENU_GUI('Property','Value',...) creates a new MENU_GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before menu_GUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to menu_GUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help menu_GUI

% Last Modified by GUIDE v2.5 05-May-2014 23:29:36

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @menu_GUI_OpeningFcn, ...
                   'gui_OutputFcn',  @menu_GUI_OutputFcn, ...
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


% --- Executes just before menu_GUI is made visible.
function menu_GUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to menu_GUI (see VARARGIN)

% Choose default command line output for menu_GUI
handles.output = hObject;
imageAxis = axes('unit', 'normalized', 'position', [0 0 1 1]);
bg = imread('Arsenal-12.jpg');imagesc(bg);
set(imageAxis,'handlevisibility','off','visible','off');
uistack(imageAxis,'bottom');
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes menu_GUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = menu_GUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in menuTag1.
function menuTag1_Callback(hObject, eventdata, handles)
% hObject    handle to menuTag1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.prediction,'visible','on');
set(handles.text1,'visible','on');

% --- Executes on button press in menuTag2.
function menuTag2_Callback(hObject, eventdata, handles)
% hObject    handle to menuTag2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.leagueHistTag,'visible','on');

% --- Executes on button press in menuTag3.
function menuTag3_Callback(hObject, eventdata, handles)
% hObject    handle to menuTag3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    set(handles.oppositionTag,'Visible','On')


% --- Executes on button press in menuTagExit.
function menuTagExit_Callback(hObject, eventdata, handles)
% hObject    handle to menuTagExit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
exitAppGUI;

% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over menuTagExit.
function menuTagExit_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to menuTagExit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in exitOppTag.
function exitOppTag_Callback(hObject, eventdata, handles)
% hObject    handle to exitOppTag (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.oppositionTag,'visible','off');


% --- Executes on button press in exitSeasonsTag.
function exitSeasonsTag_Callback(hObject, eventdata, handles)
% hObject    handle to exitSeasonsTag (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.leagueHistTag,'visible','off');


% --- Executes when selected object is changed in oppositionTag.
function oppositionTag_SelectionChangeFcn(hObject, eventdata, handles)
% hObject    handle to the selected object in oppositionTag 
% eventdata  structure with the following fields (see UIBUTTONGROUP)
%	EventName: string 'SelectionChanged' (read only)
%	OldValue: handle of the previously selected object or empty if none was selected
%	NewValue: handle of the currently selected object
% handles    structure with handles and user data (see GUIDATA)
if hObject == handles.Aston
    AstonVillaGUI;
elseif hObject == handles.Chelsea
    ChelseaGUI;
elseif hObject == handles.Everton
    EvertonGUI;
elseif hObject == handles.Fulham
    FulhamGUI;
elseif hObject == handles.Hull
    HullGUI;
elseif hObject == handles.Liverpool
    LiverpoolGUI;
elseif hObject == handles.ManU
    ManUnitedGUI;
elseif hObject == handles.ManC
    ManCityGUI;
elseif hObject == handles.Newcastle
    NewcastleGUI;
elseif hObject == handles.Norwich
    NorwichGUI;
elseif hObject == handles.Southampton
    SouthamptonGUI;
elseif hObject == handles.Stoke
    StokeGUI;
elseif hObject == handles.Sunderland
    SunderlandGUI;
elseif hObject == handles.Swansea
    SwanseaGUI;
elseif hObject == handles.Tottenham
    TottenhamGUI;
elseif hObject == handles.WestBrom
    WestBromGUI;
elseif hObject == handles.WestHam
    WestHamGUI;
end;



% --- Executes when selected object is changed in leagueHistTag.
function leagueHistTag_SelectionChangeFcn(hObject, eventdata, handles)
% hObject    handle to the selected object in leagueHistTag 
% eventdata  structure with the following fields (see UIBUTTONGROUP)
%	EventName: string 'SelectionChanged' (read only)
%	OldValue: handle of the previously selected object or empty if none was selected
%	NewValue: handle of the currently selected object
% handles    structure with handles and user data (see GUIDATA)
if hObject == handles.tag96;
    Season9697GUI;
elseif hObject == handles.tag97;
    Season9798;
elseif hObject == handles.tag98;
    Season9899;
elseif hObject == handles.tag99;
    Season9900;
elseif hObject == handles.tag00;
    Season0001;
elseif hObject == handles.tag01;
    Season0102;
elseif hObject == handles.tag02;
    Season0203;
elseif hObject == handles.tag03;
    Season0304;
elseif hObject == handles.tag04;
    Season0405;
elseif hObject == handles.tag05;
    Season0506;
elseif hObject == handles.tag06;
    Season0607;
elseif hObject == handles.tag07;
    Season0708;
elseif hObject == handles.tag08;
    Season0809;
elseif hObject == handles.tag09;
    Season0910;
elseif hObject == handles.tag10;
    Season1011;
elseif hObject == handles.tag11;
    Season1112;
elseif hObject == handles.tag12;
    Season1213;
end;


% --- Executes on button press in pushbutton11.
function pushbutton11_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.prediction,'visible','off');

% --- Executes when selected object is changed in prediction.
function prediction_SelectionChangeFcn(hObject, eventdata, handles)
% hObject    handle to the selected object in prediction 
% eventdata  structure with the following fields (see UIBUTTONGROUP)
%	EventName: string 'SelectionChanged' (read only)
%	OldValue: handle of the previously selected object or empty if none was selected
%	NewValue: handle of the currently selected object
% handles    structure with handles and user data (see GUIDATA)
if hObject == handles.nb1
    NB_Season_GUI;
elseif hObject == handles.nb2
    NB_Season_GUI2;
elseif hObject == handles.nb3
    NB_Season_GUI3;
elseif hObject == handles.nb4
    NB_Season_GUI4;
elseif hObject == handles.nb5
    NB_Season_GUI5;
elseif hObject == handles.ar
    AutoRegressionGUI;
elseif hObject == handles.compare
    NaiveBayesAllView;
end;
