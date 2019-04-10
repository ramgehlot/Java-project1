clc;
clear all;
close all;
addpath('support');
F=dir('TRAIN');
F=char(F.name);
sz=size(F,1)-2;
hh=waitbar(0,'Please wait system is training..');
for ii=1:sz
    st=F(ii+2,:);
    cd TRAIN
    I=imread(st);
    cd ..
    if size(I,3)>1
        I=rgb2gray(I);
    end
    [a h v d]=dwt2(I,'haar');
    vr=std2(a);
    er=sum(sum(a(:).^2))/numel(a).^2;
    Hg=Homogeneity(a);    
    fv1{ii}=a;
    fv2(ii,:)=[vr er Hg];   
     if strcmp(st(1:4),'stri')==1
         grp(ii)=1;
     end
      if strcmp(st(1:4),'irre')==1
         grp(ii)=2;
      end
       if strcmp(st(1:4),'patt')==1
         grp(ii)=3;
       end
       if strcmp(st(1:4),'plai')==1
         grp(ii)=4;
       end
     waitbar(ii/sz);
end
close(hh);
SS=multisvmtrain(fv2',grp);
save SS SS
save fv1 fv1 
save F F



    