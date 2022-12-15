function varargout = Peningkatan_Citra(varargin)
% PENINGKATAN_CITRA MATLAB code for Peningkatan_Citra.fig
%      PENINGKATAN_CITRA, by itself, creates a new PENINGKATAN_CITRA or raises the existing
%      singleton*.
%
%      H = PENINGKATAN_CITRA returns the handle to a new PENINGKATAN_CITRA or the handle to
%      the existing singleton*.
%
%      PENINGKATAN_CITRA('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PENINGKATAN_CITRA.M with the given input arguments.
%
%      PENINGKATAN_CITRA('Property','Value',...) creates a new PENINGKATAN_CITRA or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Peningkatan_Citra_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Peningkatan_Citra_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Peningkatan_Citra

% Last Modified by GUIDE v2.5 06-May-2021 00:08:03

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Peningkatan_Citra_OpeningFcn, ...
                   'gui_OutputFcn',  @Peningkatan_Citra_OutputFcn, ...
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


% --- Executes just before Peningkatan_Citra is made visible.
function Peningkatan_Citra_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Peningkatan_Citra (see VARARGIN)

% Choose default command line output for Peningkatan_Citra
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Peningkatan_Citra wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Peningkatan_Citra_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in bukacitra_pushbutton1.
function bukacitra_pushbutton1_Callback(hObject, eventdata, handles)
%Mencari file citra
 [filename, pathname] = uigetfile('*.*', 'Pick a MATLAB code file');
    if isequal(filename,0) || isequal(pathname,0)
       disp('User pressed cancel')
    else
        filename=strcat(pathname,filename);
        a=imread(filename); %membaca file citra
        axes(handles.axes1);
        imshow(a);  %menampilkan citra pada axes1
        
        hold on
        
        axes(handles.axes2);
        imhist(a);  %menampilkan histogram citra pada axes2
        
        handles.a=a;
        guidata(hObject, handles);
    end


% --- Executes on button press in reset_pushbutton4.
function reset_pushbutton4_Callback(hObject, eventdata, handles)

%reset untuk membuat gambar tida menumpuk ketika memanggil gambar lain
axes(handles.axes1)
cla reset
set(gca,'XTick',[])
set(gca,'YTick',[])

axes(handles.axes2)
cla reset
set(gca,'XTick',[])
set(gca,'YTick',[])

axes(handles.axes3)
cla reset
set(gca,'XTick',[])
set(gca,'YTick',[])

axes(handles.axes4)
cla reset
set(gca,'XTick',[])
set(gca,'YTick',[])

axes(handles.axes5)
cla reset
set(gca,'XTick',[])
set(gca,'YTick',[])

axes(handles.axes6)
cla reset
set(gca,'XTick',[])
set(gca,'YTick',[])


% --- Executes on button press in histeq_pushbutton2.
function histeq_pushbutton2_Callback(hObject, eventdata, handles)

J=handles.a;

J=histeq(J);    %perintah untuk proses histogram equalization
axes(handles.axes3);
imshow(J);  %menampilkan citra yang sudah diproses histeq pada axes3
imwrite(J,'hasil_histeq.png');  %menyimpan file citra histeq

hold on;

axes(handles.axes4);
imhist(J);      %menampilkan histogram dari citra histeq pada axes4

handles.J=J;
guidata(hObject, handles);


% --- Executes on button press in inadjust_pushbutton3.
function inadjust_pushbutton3_Callback(hObject, eventdata, handles)

L=handles.a;

L=imadjust(L,[0.3 0.7],[]); %perintah untuk proses intensity adjustment
axes(handles.axes5);
imshow(L);  %menampilkan citra yang sudah diproses pada axes5
imwrite(L,'hasil_inadj.png');  %menyimpan file citra inadjust 

hold on;

axes(handles.axes6); 
imhist(L);                  %menampilkan histogram citra inadjust

handles.L=L;
guidata(hObject, handles);
