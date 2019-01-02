function [sys,x0,str,ts]=s_function(t,x,u,flag)
switch flag,
case 0,
    [sys,x0,str,ts]=mdlInitializeSizes;
case 1,
    sys=mdlDerivatives(t,x,u);
case 3,
    sys=mdlOutputs(t,x,u);
case {2, 4, 9 }
    sys = [];
otherwise
    error(['Unhandled flag = ',num2str(flag)]);
end
function [sys,x0,str,ts]=mdlInitializeSizes   %采样时间 初始条件
sizes = simsizes;
sizes.NumContStates  = 2;   %连续状态的个数
sizes.NumOutputs     = 3;  % 输出
sizes.NumInputs      = 1;  %输入
sizes.DirFeedthrough = 0;% 布莱尔变量
sizes.NumSampleTimes = 0;  %采样时间
sys=simsizes(sizes);
x0=[0.15,0];
str=[];
ts=[];
function sys=mdlDerivatives(t,x,u)   %计算连续状态变量的微分方程
%bi=0.05;ci=5; 
bi=0.5;ci=5;
dt=200*exp(-(t-ci)^2/(2*bi^2));   %rbf_func.m
%dt=0;

sys(1)=x(2);
sys(2)=-25*x(2)+133*u+dt; 
function sys=mdlOutputs(t,x,u)  %S函数的输出
%bi=0.05;ci=5;
bi=0.5;ci=5;
dt=200*exp(-(t-ci)^2/(2*bi^2));   %rbf_func.m
%dt=0;

sys(1)=x(1);
sys(2)=x(2);
sys(3)=dt;