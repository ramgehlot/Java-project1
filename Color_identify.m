clc;
clear all;
close all;
addpath('support');
cd TRAIN
[J  P]=uigetfile('.jpg','select the test Image');
I=imread(strcat(P,J));
cd ..
H=rgb2hsv(I);
red=[345 360]./360;
or=[0 9]./360;
ye=[10 37]./360;
gre=[38 75]./360;
cy=[161 200]./360;
blu=[201 280]./360;
pur=[281 315]./360;
pink=[316 344]./360;
%============================
[HH PP]=imhist(H(:,:,1));
rd=0;orr=0;yee=0;gg=0;ccy=0;bb=0;pr=0;pk=0;
for ii=1:length(PP)
    if PP(ii)>=red(1) && PP(ii)<=red(2)
        rd=rd+HH(ii);
    end
      if PP(ii)>=or(1) && PP(ii)<=or(2)
        orr=orr+HH(ii);
      end
      if PP(ii)>=ye(1) && PP(ii)<=ye(2)
        yee=yee+HH(ii);
      end
       if PP(ii)>=gre(1) && PP(ii)<=gre(2)
        gg=gg+HH(ii);
       end
      if PP(ii)>=cy(1) && PP(ii)<=cy(2)
        ccy=ccy+HH(ii);
      end
      if PP(ii)>=blu(1) && PP(ii)<=blu(2)
        bb=bb+HH(ii);
      end
        if PP(ii)>=pur(1) && PP(ii)<=pur(2)
        pr=pr+HH(ii);
        end
         if PP(ii)>=pink(1) && PP(ii)<=pink(2)
        pk=pk+HH(ii);
         end    
end

st={'red','Orange','Yellow','Green','Cyan','blue','purple','Pink'};
D=[rd orr yee gg ccy bb pr pk];
SS=sort(D,'descend');
d1=find(SS(1)==D);
d2=find(SS(2)==D);
d3=find(SS(3)==D);
['The colors is ', st{d1},' with ', num2str(D(d1)/numel(H(:,:,1))*100 ),' Percent']
['The colors is ', st{d2},' with ', num2str(D(d2)/numel(H(:,:,1))*100 ),' Percent']
['The colors is ', st{d3},' with ', num2str(D(d3)/numel(H(:,:,1))*100 ),' Percent']
% NET.addAssembly('System.Speech');
% speak = System.Speech.Synthesis.SpeechSynthesizer;
% speak.Volume = 100;
% speak.Speak(['Cloth color is combination of  ','', st{d1},st{d2},st{d3}]);

