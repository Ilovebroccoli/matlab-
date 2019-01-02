clear all;
close all;

a=newfis('smc_fuzz');%����ģ������ϵͳ

f1=5;
a=addvar(a,'input','sds',[-3*f1,3*f1]); %��ģ������ϵͳ��������ֺ�����   % Parameter e
a=addmf(a,'input',1,'NB','zmf',[-3*f1,-1*f1]);%  Z�ͺ���
a=addmf(a,'input',1,'NM','trimf',[-3*f1,-2*f1,0]);%������
a=addmf(a,'input',1,'Z','trimf',[-2*f1,0,2*f1]);
a=addmf(a,'input',1,'PM','trimf',[0,2*f1,3*f1]);
a=addmf(a,'input',1,'PB','smf',[1*f1,3*f1]);  % s��

f2=0.5;
a=addvar(a,'output','dk',[-3*f2,3*f2]);    %Parameter u
a=addmf(a,'output',1,'NB','zmf',[-3*f2,-1*f2]);
a=addmf(a,'output',1,'NM','trimf',[-2*f2,-1*f2,0]);
a=addmf(a,'output',1,'Z','trimf',[-1*f2,0,1*f2]);
a=addmf(a,'output',1,'PM','trimf',[0,1*f2,2*f2]);
a=addmf(a,'output',1,'PB','smf',[1*f2,3*f2]);

rulelist=[1 1 1 1;   %Edit rule base  ���룬 �����  Ȩ�� ��and
          2 2 1 1;    
          3 3 1 1;    
          4 4 1 1;
          5 5 1 1];    
         
a1=addrule(a,rulelist);
a1=setfis(a1,'DefuzzMethod','centroid');  %Defuzzy  ���ķ�
writefis(a1,'smc_fuzz');
a1=readfis('smc_fuzz');

figure(1);
plotmf(a1,'input',1);
figure(2);
plotmf(a1,'output',1);