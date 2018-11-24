function varargout = MainGUI(varargin)
% MAINGUI M-file for MainGUI.fig
%      MAINGUI, by itself, creates a new MAINGUI or raises the existing
%      singleton*.
%
%      HKFCMPARA = MAINGUI returns the handle to a new MAINGUI or the handle to
%      the existing singleton*.
%
%      MAINGUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MAINGUI.M with the given input arguments.
%
%      MAINGUI('Property','Value',...) creates a new MAINGUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before MainGUI_OpeningFunction gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to MainGUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Copyright 2002-2003 The MathWorks, Inc.
% Edit the above text to modify the response to help MainGUI
% Last Modified by GUIDE v2.5 10-May-2005 12:20:34

% Author: Genial.Rong@USTC.P.R.C
% Email: JGRong@ustc.edu
% URL:  http://genial.yculblog.com


% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @MainGUI_OpeningFcn, ...
                   'gui_OutputFcn',  @MainGUI_OutputFcn, ...
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


% --- Executes just before MainGUI is made visible.
function MainGUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to MainGUI (see VARARGIN)

% Choose default command line output for MainGUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes MainGUI wait for user response (see UIRESUME)
% uiwait(handles.MainFig);

% ����ʱ����ʾ
set(handles.timestr,'string',datestr(now,0));
htimer = timer('StartDelay',1,'TimerFcn',...
    'htimestr=findall(0,''tag'',''timestr'');set(htimestr,''string'',datestr(now,0));',...
    'Period',1,'ExecutionMode','fixedSpacing','tag','showtime');
start(htimer);



% --- Outputs from this function are returned to the command line.
function varargout = MainGUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes during object creation, after setting all properties.
function hslider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to hslider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



% --- Executes during object creation, after setting all properties.
function hedit_fname_CreateFcn(hObject, eventdata, handles)
% hObject    handle to hedit_fname (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes during object creation, after setting all properties.
function hedit_heb_CreateFcn(hObject, eventdata, handles)
% hObject    handle to hedit_heb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes during object creation, after setting all properties.
function hedit_xuhao_CreateFcn(hObject, eventdata, handles)
% hObject    handle to hedit_xuhao (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes during object creation, after setting all properties.
function hedit_zhishu_CreateFcn(hObject, eventdata, handles)
% hObject    handle to hedit_zhishu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes during object creation, after setting all properties.
function hedit_zuixiao_CreateFcn(hObject, eventdata, handles)
% hObject    handle to hedit_zuixiao (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



% --- Executes during object creation, after setting all properties.
function hedit_cishu_CreateFcn(hObject, eventdata, handles)
% hObject    handle to hedit_cishu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes during object creation, after setting all properties.
function hedit_leibie_CreateFcn(hObject, eventdata, handles)
% hObject    handle to hedit_leibie (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



% --- Executes during object creation, after setting all properties.
function hmenu_CreateFcn(hObject, eventdata, handles)
% hObject    handle to hmenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes during object creation, after setting all properties.
function hedit_info_CreateFcn(hObject, eventdata, handles)
% hObject    handle to hedit_info (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



% --- Executes on slider movement.
function hslider_Callback(hObject, eventdata, handles)
% hObject    handle to hslider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

% ��ȡ����������
valMin = get(hObject,'Min'); 
valMax = get(hObject,'Max');
val = get(hObject,'Value');

result = get(handles.btnrun,'UserData'); % ��ȡ�ָ���

cluster_n = get(handles.hedit_leibie,'UserData');   % ��ȡ������Ŀ
eachstep = (valMax - valMin)/(cluster_n-2);  % ÿ��ͼ��Ӧ�Ļ��鲽��
npic = round((val-valMin)/eachstep);    % ��������ĵ�
% set(hObject,'Value',eachstep*npic+valMin);  % �Զ��������ƶ���������

% �õ�axes����ʾ��ͼ�������
I1 = result{npic+1};
I2 = result{npic+2};


% ���ַ�����ʾ��axes
% ���ڵ�һ�����
axes(handles.h1leiaxes);
imshow(I1,[]);
set(gcf,'NextPlot','add'); % This is to cinquer the bug of imshow
% ���ڵڶ������
axes(handles.h2leiaxes);
imshow(I2,[]);
set(gcf,'NextPlot','add'); % This is to cinquer the bug of imshow

% �������ϵ�˵������
h1leitxtstr = ['��',num2str(npic+1),'��ͼ��'];
h2leitxtstr = ['��',num2str(npic+2),'��ͼ��'];
set(handles.h1leitxt,'string',h1leitxtstr);
set(handles.h2leitxt,'string',h2leitxtstr);



% --- Executes on button press in btnOpen.
function btnOpen_Callback(hObject, eventdata, handles)
% hObject    handle to btnOpen (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[filename, pathname] = uigetfile('*.mat', '��ͼ�������ļ�');
if filename~=0
    set(gcf,'Pointer','watch'); % �ı����״̬Ϊ�ȴ�״̬
    drawnow;
    set(handles.hedit_fname,'string',filename);
   % fid=fopen([pathname filename],'r');
   % F=fread(fid,'uint8');
   % fclose(fid);
    load([pathname filename]);
    F = II;
    set(hObject,'UserData',F);
    set(handles.hedit_xuhao,'string',num2str(3));
    % Ĭ����ʾ��2��ͼ
    I=F(1+181*181*(3-1):181*181*3);
    I=reshape(I,181,181);
    I=imrotate(I,90);
    axes(handles.hyuansiaxes);
    himage = imshow(I,[]);
    set(gcf,'NextPlot','add'); % This is to cinquer the bug of imshow
    % in image toolbox ver 5.0.0 and 5.0.1.
    set(handles.hyuansiaxes,'UserData',I);
    set(gcf,'Pointer','arrow');
    set(handles.hslider,'enable','off'); % ������������
    set(handles.btnsave,'enable','off');    % ������水ť������ 
else
    set(handles.hedit_fname,'string','��δ��');
end


function hedit_heb_Callback(hObject, eventdata, handles)
% hObject    handle to hedit_heb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: get(hObject,'String') returns contents of hedit_heb as text
%        str2double(get(hObject,'String')) returns contents of hedit_heb as a double
str = get(hObject,'string');
data = str2num(str);
if isempty(data)  % ���������Ч�Լ��
    errordlg('�������Ϊ��ֵ��','��������');
    set(hObject,'BackgroundColor','r');
else
    set(hObject,'BackgroundColor','w');
    set(hObject,'UserData',data);
end



function hedit_xuhao_Callback(hObject, eventdata, handles)
% hObject    handle to hedit_xuhao (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: get(hObject,'String') returns contents of hedit_xuhao as text
%        str2double(get(hObject,'String')) returns contents of hedit_xuhao as a double
str = get(hObject,'string');
data = str2num(str);
if isempty(data)  % ���������Ч�Լ��
    errordlg('�������Ϊ��ֵ��','��������');
    set(hObject,'BackgroundColor','r');
elseif data<1 || data>7 || data~=round(data) % �����ų�����Χ����������
    errordlg('�������Ϊ����1��7֮���������','��������');
    set(hObject,'BackgroundColor','r');
else
    set(hObject,'BackgroundColor','w');
    % �������������ʾԭͼ
    F = get(handles.btnOpen,'UserData');
    if isempty(F)
        msgbox('��δ��ͼ�������ļ�','��������');
        return;
    else
        I=F(1+181*181*(data-1):181*181*data);
        I=reshape(I,181,181);
        I=imrotate(I,90);
        axes(handles.hyuansiaxes);
        himage = imshow(I,[]);
        set(gcf,'NextPlot','add'); % This is to cinquer the bug of imshow 
                        % in image toolbox ver 5.0.0 and 5.0.1. 
        set(handles.hyuansiaxes,'UserData',I);
        set(handles.hedit_xuhao,'UserData',data);
    end
end



function hedit_zhishu_Callback(hObject, eventdata, handles)
% hObject    handle to hedit_zhishu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: get(hObject,'String') returns contents of hedit_zhishu as text
%        str2double(get(hObject,'String')) returns contents of hedit_zhishu as a double
str = get(hObject,'string');
data = str2num(str);
if isempty(data)  % ���������Ч�Լ��
    errordlg('�������Ϊ��ֵ��','��������');
    set(hObject,'BackgroundColor','r');
elseif data<=1 % ���ָ��������1
    errordlg('����������1','��������');
    set(hObject,'BackgroundColor','r');
else    
    set(hObject,'BackgroundColor','w');
    set(hObject,'UserData',data);
end



function hedit_zuixiao_Callback(hObject, eventdata, handles)
% hObject    handle to hedit_zuixiao (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: get(hObject,'String') returns contents of hedit_zuixiao as text
%        str2double(get(hObject,'String')) returns contents of hedit_zuixiao as a double
str = get(hObject,'string');
data = str2num(str);
if isempty(data)  % ���������Ч�Լ��
    errordlg('�������Ϊ��ֵ��','��������');
    set(hObject,'BackgroundColor','r');
elseif data<0 % ���ָ��������1
    errordlg('����������0','��������');
    set(hObject,'BackgroundColor','r');
else    
    set(hObject,'BackgroundColor','w');
    set(hObject,'UserData',data);
end



function hedit_cishu_Callback(hObject, eventdata, handles)
% hObject    handle to hedit_cishu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: get(hObject,'String') returns contents of hedit_cishu as text
%        str2double(get(hObject,'String')) returns contents of hedit_cishu as a double
str = get(hObject,'string');
data = str2num(str);
if isempty(data)  % ���������Ч�Լ��
    errordlg('�������Ϊ��ֵ��','��������');
    set(hObject,'BackgroundColor','r');
elseif data<1 || data~=round(data) % �����ų�����Χ����������
    errordlg('�������Ϊ���ڵ���1��������','��������');
    set(hObject,'BackgroundColor','r');
else    
    set(hObject,'BackgroundColor','w');
    set(hObject,'UserData',data);
    
end




function hedit_leibie_Callback(hObject, eventdata, handles)
% hObject    handle to hedit_leibie (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: get(hObject,'String') returns contents of hedit_leibie as text
%        str2double(get(hObject,'String')) returns contents of hedit_leibie as a double
str = get(hObject,'string');
data = str2num(str);
if isempty(data)  % ���������Ч�Լ��
    errordlg('�������Ϊ��ֵ��','��������');
    set(hObject,'BackgroundColor','r');
elseif data<2 || data~=round(data) % �����ų�����Χ����������
    errordlg('�������Ϊ���ڵ���2��������','��������');
    set(hObject,'BackgroundColor','r');
else    
    set(hObject,'BackgroundColor','w');
    set(hObject,'UserData',data);    
end


% --- Executes on button press in btnrun.
function btnrun_Callback(hObject, eventdata, handles)
% hObject    handle to btnrun (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% ���Ľ���ؼ�״̬
set(handles.hedit_info,'enable','on');  % ��Ϣ����༭�����
set(handles.btnsave,'enable','on');    % ������水ť����

expo = get(handles.hedit_zhishu,'UserData');    % ָ��m
max_iter = get(handles.hedit_cishu,'UserData'); % ����������
min_impro = get(handles.hedit_zuixiao,'UserData');  % Ŀ�꺯����С�ı���
cluster_n = get(handles.hedit_leibie,'UserData');   % ������Ŀ
display = get(handles.chkbx,'UserData');    % ÿ�ε����Ƿ������Ϣ
algorithm = get(handles.hmenu,'UserData');  % ѡ����㷨����

data = get(handles.hyuansiaxes,'UserData'); % ��ȡԭʼͼ������
data = data(:);
data_n = size(data, 1); % ���data�ĵ�һά(rows)��,����������
in_n = size(data, 2);   % ���data�ĵڶ�ά(columns)����������ֵ����

obj_fcn = zeros(max_iter, 1);	% ��ʼ���������obj_fcn
infostr = '';
if algorithm==1 % FCMͼ��ָ�
    U = initfcm(cluster_n, data_n);     % ��ʼ��ģ���������,ʹU�����������Ϊ1,
    % Main loop  ��Ҫѭ��
    for i = 1:max_iter,
        %�ڵ�k��ѭ���иı��������ceneter,�ͷ��亯��U��������ֵ;
        [U, center, obj_fcn(i)] = stepfcm(data, U, cluster_n, expo);
        if display,
            infostr =sprintf([infostr 'FCM:Interate count = %d \n\t obj.fcn = %f\n'],i,obj_fcn(i));
            set(handles.hedit_info,'String',infostr);
            drawnow;
        end
        % ��ֹ�����б�
        if i > 1,
            if abs(obj_fcn(i) - obj_fcn(i-1)) < min_impro,
                break;
            end,
        end
    end
    iter_n = i;	% ʵ�ʵ�������
    obj_fcn(iter_n+1:max_iter) = [];
    if display,
            infostr =sprintf([infostr 'FCM:Actual iterations= %d \n\t obj.fcn = %f\n'],iter_n,obj_fcn(i));
            set(handles.hedit_info,'String',infostr);
            drawnow;
    end       
else    % KFCMͼ��ָ�
    kernel_b = get(handles.hedit_heb,'UserData');   % ��ȡ��˹�˲���
    U = initkfcm(cluster_n, data_n);	% ��ʼ��ģ���������,ʹU�����������Ϊ1
    % ��ʼ���������ģ����������ݵ�������ѡȡcluster_n��������Ϊ�������ġ���Ȼ��
    % �������ĳЩ����֪ʶѡȡ���Ļ����ܹ��ﵽ�ӿ��ȶ���Ч������Ŀǰ���߱��⹦��
    index = randperm(data_n);   % �����������������
    center_old = data(index(1:cluster_n),:);  % ѡȡ������е�������ǰcluster_n��
    % Main loop  ��Ҫѭ��
    for i = 1:max_iter,
        %�ڵ�k��ѭ���иı��������ceneter,�ͷ��亯��U��������ֵ;
        [U, center, obj_fcn(i)] = stepkfcm(data,U,center_old, expo, kernel_b);
        if display,
            infostr =sprintf([infostr 'KFCM:Interate count = %d \n\t obj.fcn = %f\n'],i,obj_fcn(i));
            set(handles.hedit_info,'String',infostr);
            drawnow;
        end
        center_old = center;    % ���µľ������Ĵ����ϵľ�������
        % ��ֹ�����б�
        if i > 1,
            if abs(obj_fcn(i) - obj_fcn(i-1)) < min_impro, break; end,
        end
    end
    iter_n = i;	% ʵ�ʵ�������
    obj_fcn(iter_n+1:max_iter) = [];
    if display,
        infostr =sprintf([infostr 'KFCM:Actual iterations= %d \n\t obj.fcn = %f\n'],iter_n,obj_fcn(i));
        set(handles.hedit_info,'String',infostr);
        drawnow;
    end
end

% �ָ�����ʾ
maxU = max(U);
data = data';
wholeD = zeros(size(data));
for k = 1:cluster_n
    indexk = (U(k,:) == maxU);
    Ik = indexk.*data;
    Ik = reshape(Ik,181,181);
    result{k} = Ik;
    wholeG(indexk) = k-1;
end   
wholeG = reshape(wholeG,181,181);
result{end+1} = wholeG;
set(handles.btnrun,'UserData',result);

% ��ʾ�ָ������ͼ
axes(handles.hzhengtiaxes);
imshow(wholeG,[]);
set(gcf,'NextPlot','add');

% ��ʾ��һ��
axes(handles.h1leiaxes);
imshow(result{1},[]);
set(gcf,'NextPlot','add');

% ��ʾ�ڶ���
axes(handles.h2leiaxes);
imshow(result{2},[]);
set(gcf,'NextPlot','add');

set(handles.hslider,'enable','on'); % ����������





% --- Executes on button press in btnhelp.
function btnhelp_Callback(hObject, eventdata, handles)
% hObject    handle to btnhelp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



% --- Executes on button press in btnsave.
function btnsave_Callback(hObject, eventdata, handles)
% hObject    handle to btnsave (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

result = get(handles.btnrun,'UserData');

ButtonName=questdlg('������Ϊ������ʽ?', ...
                       '�ָ�������', ...
                       'JPGͼƬ','MAT�ļ�','MAT�ļ�');
switch ButtonName,
     case 'MAT�ļ�',
         [fname,path] = uiputfile('*.mat','����Ϊ');
         if path==0  % ȡ���ļ��������
             return;
         end
         save([path fname],'result','-v6');         
     case 'JPGͼƬ',
         directoryname = uigetdir;
         if directoryname == 0 % canceled
             return;
         end
         pwdir = pwd; % ��õ�ǰĿ¼
         cd(directoryname); % ת��ѡ��Ŀ¼
         fnametmp = datestr(now,31);
         fnametmp = strrep(fnametmp,':','-');   % �ļ����в��ܹ���:��
         fnametmp = strrep(fnametmp,' ','_');
         for k = 1:length(result)-1
             fnamestr = [fnametmp 'Kind',num2str(k),'.jpg'];
             fcell ={fnamestr};
             tmpM = result{k};
             imwrite(tmpM,fcell{1},'jpg');
         end
         fnamestr = [fnametmp,'Whole.jpg'];
         fcell ={fnamestr};
         tmpM = result{end};
         imwrite(tmpM,fcell{1},'jpg');
         cd(pwdir);
end % switch                   
 



% --- Executes on button press in btnquit.
function btnquit_Callback(hObject, eventdata, handles)
% hObject    handle to btnquit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% selection = questdlg(['�˳� ' get(handles.MainFig,'Name') '?'],...
%                      ['�˳� ...'],...
%                      '��','��','��');
% if strcmp(selection,'��')
%     return;
% end
htimer = timerfind('tag','showtime');
stop(htimer);
delete(htimer);
delete(handles.MainFig);



% --- Executes on selection change in hmenu.
function hmenu_Callback(hObject, eventdata, handles)
% hObject    handle to hmenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = get(hObject,'String') returns hmenu contents as cell array
%        contents{get(hObject,'Value')} returns selected item from hmenu

val = get(hObject,'Value');
set(hObject,'UserData',val);
if  val == 1
    set(handles.hbtxt,'Visible','off');
    set(handles.hedit_heb,'Visible','off');
elseif val == 2
    set(handles.hbtxt,'Visible','on');
    set(handles.hedit_heb,'Visible','on');
else
    msgbox('�����ܳ��ֵİ�');
end


% --- Executes on button press in chkbx.
function chkbx_Callback(hObject, eventdata, handles)
% hObject    handle to chkbx (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of chkbx

val = get(hObject,'Value');
set(hObject,'UserData',val);
if val==0
    set(handles.hedit_info,'string',{' ';'�������Ϣ';' '});
else
    set(handles.hedit_info,'string',{' ';'��δ���зָ����';' '});
end


% --------------------------------------------------------------------
function hinfosave_Callback(hObject, eventdata, handles)
% hObject    handle to hinfosave (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

infostr = get(handles.hedit_info,'string');
[fname,path] = uiputfile('*.txt','����Ϊ');
if path==0  % ȡ���ļ��������
    return;
end
fid = fopen([path fname],'w');
if fid == -1    % ���ܹ����ļ�
    msgbox({'���ܴ��ļ�' fname},'�ļ��������','error');
    return;
end

% ������Ϣ
fprintf(fid,'\r\n=====%s=====\r\n\r\n',datestr(now,31));
for k = 1:size(infostr,1)
    fprintf(fid,'%s',infostr(k,:));
    fprintf(fid,'\r\n');
end
fclose(fid);




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% FCM ��Ҫ���Ӻ���

% �Ӻ���
function U = initfcm(cluster_n, data_n)
% ��ʼ��fcm�������Ⱥ�������
% ����:
%   cluster_n   ---- �������ĸ���
%   data_n      ---- ��������
% �����
%   U           ---- ��ʼ���������Ⱦ���
U = rand(cluster_n, data_n);
col_sum = sum(U);
U = U./col_sum(ones(cluster_n, 1), :);


% �Ӻ���
function [U_new, center, obj_fcn] = stepfcm(data, U, cluster_n, expo)
% ģ��C��ֵ����ʱ������һ��
% ���룺
%   data        ---- nxm����,��ʾn������,ÿ����������m��ά����ֵ
%   U           ---- �����Ⱦ���
%   cluster_n   ---- ����,��ʾ�ۺ�������Ŀ,�������
%   expo        ---- �����Ⱦ���U��ָ��                      
% �����
%   U_new       ---- ������������µ������Ⱦ���
%   center      ---- ������������µľ�������
%   obj_fcn     ---- Ŀ�꺯��ֵ
mf = U.^expo;       % �����Ⱦ������ָ��������
center = mf*data./((ones(size(data, 2), 1)*sum(mf'))'); % �¾�������(5.4)ʽ
dist = distfcm(center, data);       % ����������
obj_fcn = sum(sum((dist.^2).*mf));  % ����Ŀ�꺯��ֵ (5.1)ʽ
tmp = dist.^(-2/(expo-1));     
U_new = tmp./(ones(cluster_n, 1)*sum(tmp));  % �����µ������Ⱦ��� (5.3)ʽ


% �Ӻ���
function out = distfcm(center, data)
% �������������������ĵľ���
% ���룺
%   center     ---- ��������
%   data       ---- ������
% �����
%   out        ---- ����
out = zeros(size(center, 1), size(data, 1));
for k = 1:size(center, 1), % ��ÿһ����������
    % ÿһ��ѭ��������������㵽һ���������ĵľ���
    out(k, :) = sqrt(sum(((data-ones(size(data,1),1)*center(k,:)).^2)',1));
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% KFCM ��Ҫ���Ӻ���

% �Ӻ���
function U = initkfcm(cluster_n, data_n)
% ��ʼ��fcm�������Ⱥ�������
% ����:
%   cluster_n   ---- �������ĸ���
%   data_n      ---- ��������
% �����
%   U           ---- ��ʼ���������Ⱦ���
U = rand(cluster_n, data_n);
col_sum = sum(U);
U = U./col_sum(ones(cluster_n, 1), :);


% �Ӻ���
function [U_new,center_new,obj_fcn] = stepkfcm(data,U,center,expo,kernel_b)
% ģ��C��ֵ����ʱ������һ��
% ���룺
%   data        ---- nxm����,��ʾn������,ÿ����������m��ά����ֵ
%   U           ---- �����Ⱦ���
%   center      ---- ��������
%   expo        ---- �����Ⱦ���U��ָ��         
%   kernel_b    ---- ��˹�˺����Ĳ���
% �����
%   U_new       ---- ������������µ������Ⱦ���
%   center_new  ---- ������������µľ�������
%   obj_fcn     ---- Ŀ�꺯��ֵ
feature_n = size(data,2);  % ����ά��
cluster_n = size(center,1); % �������
mf = U.^expo;       % �����Ⱦ������ָ�����㣨c��n��)

% �����µľ�������;����(5.15��ʽ
KernelMat = gaussKernel(center,data,kernel_b); % �����˹�˾���(c��n��)
num = mf.*KernelMat * data;   % ʽ(5.15)�ķ���(c��p��,pΪ����ά��)
den = sum(mf.*KernelMat,2);   % ʽ��(5.15)�ķ��ӣ�(c��,1��,��δ��չ)
center_new = num./(den*ones(1,feature_n)); % �����µľ�������(c��p��,c������)

% �����µ������Ⱦ��󣻸���(5.14)ʽ��
kdist = distkfcm(center_new, data, kernel_b);    % ����������
obj_fcn = sum(sum((kdist.^2).*mf));  % ����Ŀ�꺯��ֵ (5.11)ʽ
tmp = kdist.^(-1/(expo-1));     
U_new = tmp./(ones(cluster_n, 1)*sum(tmp)); 


% �Ӻ���
function out = distkfcm(center, data, kernel_b)
% �������������������ĵľ���
% ���룺
%   center     ---- ��������
%   data       ---- ������
% �����
%   out        ---- ����
cluster_n = size(center, 1);
data_n = size(data, 1);
out = zeros(cluster_n, data_n);
for i = 1:cluster_n % ��ÿ���������� 
    vi = center(i,:);
    out(i,:) = 2-2*gaussKernel(vi,data,kernel_b);
end


% �Ӻ���
function out = gaussKernel(center,data,kernel_b)
% ��˹�˺�������
% ����:
%   center      ---- ģ����������
%   data        ---- �������ݵ�
%   kernel_b    ---- ��˹�˲���
% �����
%   out         ---- ��˹�˼�����
if nargin == 2
    kernel_b = 150;
end
dist = zeros(size(center, 1), size(data, 1));
for k = 1:size(center, 1), % ��ÿһ����������
    % ÿһ��ѭ��������������㵽һ���������ĵľ���
    dist(k, :) = sqrt(sum(((data-ones(size(data,1),1)*center(k,:)).^2)',1));
end
out = exp(-dist.^2/kernel_b^2);



 



