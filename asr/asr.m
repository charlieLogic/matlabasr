fs = 20000
R = audiorecorder( fs, 16 ,1) ;
%����һ��������Ƶ��Ϣ�Ķ��������������ʣ�ʱ���¼�Ƶ���Ƶ��Ϣ�ȵȡ�
%44100��ʾ����Ϊ44100Hz���ɸ�Ϊ8000, 11025, 22050�ȣ�����ֵԽ��¼�����������Խ�ã���Ӧ��Ҫ�Ĵ洢�ռ�Խ��
%16Ϊ��16bits�洢��2Ϊ��ͨ������������Ҳ���Ը�Ϊ1������������
record(R,20);
%��ʼ¼�ƣ���ʱ������˷�˵�����ɡ�
pause(R);
%��ͣ¼�ơ�
play(R)
%����¼�Ƶ�������
resume(R);
%����¼��.
stop(R);
%ֹͣ¼��
myspeech = getaudiodata(R);
%�õ���n*2�����־���洢�ĸ�¼�Ƶ���Ƶ�źš�
%�����������Ϳ����ø����˲������д��������߰����ͱ����Ƶ�����ȵȡ���Ҳ���Ի������Ĳ��Σ����ʱ��ϳ������ο��ܻỨ��ʱ�䣩��
plot(myspeech)

Fs=fs;    %Ƶ��
T=1/Fs;   %����
N1=length(myspeech);
n1=0:N1-1;
t1=n1*T;
myspeech=myspeech/max(abs(myspeech));  %ʱ���һ��
X1 = fft(myspeech)
X1=X1/max(abs(X1));  %Ƶ���һ��
f1=n1*Fs/N1;         %��Ƶ��ͼ�ĺ����껻Ϊs���룩
E1=sum(abs(X1).^2)%/M1           %����Ƶ���������
A1=100;                         %����Ƶ�ʷ�Χ
A2=400;
n1=round(A1*N1/fs);             %�Ի����Ժ�ĳ��Ƚ���ȡ�� 
n2=round(A2*N1/fs);   
Xx=X1(n1:n2,1:1);                %��ȡһ��Ƶ�ʷ�Χ�ڵĵ�
E2=sum(abs(Xx).^2)              %�����ȡ��Χ�ڵ�����
E3=E2/E1*100                   %�����ȡ��Χ�ڵ�����ռ�������İٷֱ�

A3=500;                         %����Ƶ�ʷ�Χ
A4=1000;
n3=round(A3*N1/fs);             %�Ի����Ժ�ĳ��Ƚ���ȡ�� 
n4=round(A4*N1/fs);   
Xx=X1(n3:n4,1:1);                %��ȡһ��Ƶ�ʷ�Χ�ڵĵ�
E4=sum(abs(Xx).^2)              %�����ȡ��Χ�ڵ�����
E5=E4/E1*100                   %�����ȡ��Χ�ڵ�����ռ�������İٷֱ�


subplot 211;plot(t1,myspeech),axis([1,2,-1,1]);title('1 ʱ��ͼ��'),xlabel('s');
subplot 212;plot(f1,abs(X1)),axis([0,Fs/2,0,1]);title('1 Ƶ��ͼ��'),xlabel('Hz');
%plot(f1,abs(X1))



%��������
%������뱣�����ʹ��
%audiowrite('my.wav',myspeech,8000)
%myspeech��ʾҪ����Ĳ��ξ���44100�������ʣ�16 Ϊ��16bits�洢��'myspeech'Ϊ�洢���ļ�����