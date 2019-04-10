clc;
clear all;
close all;
addpath('support');
cd TRAIN
[J  P]=uigetfile('.jpg','select the test Image');
I=imread(strcat(P,J));
cd ..
if size(I,3)>1
    I=rgb2gray(I);
end
[a h v d]=dwt2(I,'haar');
vr=std2(a);
er=sum(sum(a(:).^2))/numel(a).^2;
Hg=Homogeneity(a);    
fq2=[vr er Hg];   
load SS
load fv1
st{1}='striped';st{2}='irregular';st{3}='patternless';st{4}='plaid';
rst1=multisvmtest(fq2,4,SS)
for ii=1:length(fv1)
[matchLoc1{ii} matchLoc2{ii}] = siftMatch(fv1{ii},a);
 D(ii)=numel(matchLoc1{ii});
end
id=find(max(D)==D);
load F
if strcmp(F(id+2,1:4),'stri')==1
         gp=1;
     end
      if strcmp(F(id+2,1:4),'irre')==1
         gp=2;
      end
       if strcmp(F(id+2,1:4),'patt')==1
         gp=3;
       end
       if strcmp(F(id+2,1:4),'plai')==1
         gp=4;
       end     
if rst1 == gp
    msgbox(['Cloth type is ', st{rst1}]);
end

NET.addAssembly('System.Speech');
speak = System.Speech.Synthesis.SpeechSynthesizer;
speak.Volume = 100;
speak.Speak(['Cloth type is  ','   ', st{rst1}]);
 