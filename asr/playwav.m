%matlab 读取文件
% RR = audioread('my.wav')
% plot(RR)
% sound(RR,8000,16)

myspeech = audioread('Saved RTP Audio.au')
plot(myspeech)
sound(myspeech,8000,16)


Fs=fs;    %频率
T=1/Fs;   %周期
N1=length(myspeech);
n1=0:N1-1;
t1=n1*T;
myspeech=myspeech/max(abs(myspeech));  %时域归一化
X1 = fft(myspeech)
X1=X1/max(abs(X1));  %频域归一化
f1=n1*Fs/N1;         %将频域图的横坐标换为s（秒）
E1=sum(abs(X1).^2)%/M1           %计算频域的总能量
A1=100;                         %设置频率范围
A2=400;
n1=round(A1*N1/fs);             %对换算以后的长度进行取整 
n2=round(A2*N1/fs);   
Xx=X1(n1:n2,1:1);                %截取一段频率范围内的点
E2=sum(abs(Xx).^2)              %计算截取范围内的能量
E3=E2/E1*100                   %计算截取范围内的能量占总能量的百分比

A3=500;                         %设置频率范围
A4=1000;
n3=round(A3*N1/fs);             %对换算以后的长度进行取整 
n4=round(A4*N1/fs);   
Xx=X1(n3:n4,1:1);                %截取一段频率范围内的点
E4=sum(abs(Xx).^2)              %计算截取范围内的能量
E5=E4/E1*100                   %计算截取范围内的能量占总能量的百分比


subplot 211;plot(t1,myspeech),axis([1,2,-1,1]);title('1 时域图像'),xlabel('s');
subplot 212;plot(f1,abs(X1)),axis([0,Fs/2,0,1]);title('1 频域图像'),xlabel('Hz');



