function varargout = projekt(varargin)
% PROJEKT MATLAB code for projekt.fig
%      PROJEKT, by itself, creates a new PROJEKT or raises the existing
%      singleton*.
%
%      H = PROJEKT returns the handle to a new PROJEKT or the handle to
%      the existing singleton*.
%
%      PROJEKT('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PROJEKT.M with the given input arguments.
%
%      PROJEKT('Property','Value',...) creates a new PROJEKT or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before projekt_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to projekt_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help projekt

% Last Modified by GUIDE v2.5 15-Jun-2020 23:04:04

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @projekt_OpeningFcn, ...
                   'gui_OutputFcn',  @projekt_OutputFcn, ...
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


% --- Executes just before projekt is made visible.
function projekt_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to projekt (see VARARGIN)

% Choose default command line output for projekt
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes projekt wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = projekt_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in most_cases.
function most_cases_Callback(hObject, eventdata, handles)
    mostcasesper1000

% --- Executes on button press in least_cases.
function least_cases_Callback(hObject, eventdata, handles)
    leastcasesper1000

% --- Executes on button press in most_deaths.
function most_deaths_Callback(hObject, eventdata, handles)
    mostdeathsper1000

% --- Executes on button press in least_deaths.
function least_deaths_Callback(hObject, eventdata, handles)
    leastdeathsper1000

% --- Executes on button press in cases_continents.
function cases_continents_Callback(hObject, eventdata, handles)
    cases_continents

% --- Executes on button press in deaths_continents.
function deaths_continents_Callback(hObject, eventdata, handles)
    deaths_continents

% --- Executes on button press in map.
function map_Callback(hObject, eventdata, handles)
    draw_map

% --- Executes on button press in cases1.
function cases1_Callback(hObject, eventdata, handles)

% --- Executes on button press in deaths1.
function deaths1_Callback(hObject, eventdata, handles)

% --- Executes on button press in cases2.
function cases2_Callback(hObject, eventdata, handles)

% --- Executes on button press in deaths2.
function deaths2_Callback(hObject, eventdata, handles)

% --- Executes on button press in beds2.
function beds2_Callback(hObject, eventdata, handles)

% --- Executes on button press in age2.
function age2_Callback(hObject, eventdata, handles)

% --- Executes on button press in pkb2.
function pkb2_Callback(hObject, eventdata, handles)


% --- Executes on button press in correllation.
function correllation_Callback(hObject, eventdata, handles)
    reset(handles.axes1)
    
    hSelectedObj1=get(handles.uibuttongroup1, 'SelectedObject');
    selectedObjTag1=get(hSelectedObj1, 'Tag');
    hSelectedObj2=get(handles.uibuttongroup2, 'SelectedObject');
    selectedObjTag2=get(hSelectedObj2, 'Tag');

    switch selectedObjTag1
        case 'cases1'
            tag1 = 5;
        case 'deaths1'
            tag1 = 6;
    end
    switch selectedObjTag2
        case 'cases2'
            tag2 = 5;
        case 'deaths2'
            tag2 = 6;
        case 'pkb2'
            tag2 = 12;
        case 'beds2'
            tag2 = 13;
        case 'age2'
            tag2 = 14;
        case 'departures2'
            tag2 = 11;
        case 'temperature2'
            tag2 = 3;
    end
    
    f = general_correllations(tag1,tag2);
    set(handles.correllation_output, 'String', string(f));
    title('Korelacja zaznaczonych danych')    
            

% --- Executes on button press in close.
function close_Callback(hObject, eventdata, handles)
    close

% --- Executes on button press in temperature2.
function temperature2_Callback(hObject, eventdata, handles)

% --- Executes on button press in departures2.
function departures2_Callback(hObject, eventdata, handles)