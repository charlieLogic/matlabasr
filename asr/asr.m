fs = 20000
R = audiorecorder( fs, 16 ,1) ;
%创建一个保存音频信息的对象，它包含采样率，时间和录制的音频信息等等。
%44100表示采样为44100Hz（可改为8000, 11025, 22050等，此数值越大，录入的声音质量越好，相应需要的存储空间越大）
%16为用16bits存储，2为两通道即立体声（也可以改为1即单声道）。
record(R,20);
%开始录制，此时对着麦克风说话即可。
pause(R);
%暂停录制。
play(R)
%播放录制的声音。
resume(R);
%继续录制.
stop(R);
%停止录制
myspeech = getaudiodata(R);
%得到以n*2列数字矩阵存储的刚录制的音频信号。
%对这个矩阵你就可以用各种滤波器进行处理，或者把它和别的音频混音等等。你也可以画出它的波形（如果时间较长画波形可能会花点时间）。
plot(myspeech)

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
%plot(f1,abs(X1))



%画出波形
%如果你想保存可以使用
%audiowrite('my.wav',myspeech,8000)
%myspeech表示要存入的波形矩阵，44100表采样率，16 为以16bits存储，'myspeech'为存储的文件名。