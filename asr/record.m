%matlab 录音
R = audiorecorder( 8000, 16 ,1) ;
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
%画出波形
%如果你想保存可以使用
audiowrite('my.wav',myspeech,8000)
%myspeech表示要存入的波形矩阵，44100表采样率，16 为以16bits存储，'myspeech'为存储的文件名。


matlab 读取文件
RR = audioread('my.wav')
plot(RR)
sound(RR,8000,16)

TT = [1,2,3]
plot(TT)


