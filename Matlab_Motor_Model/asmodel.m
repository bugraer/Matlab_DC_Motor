clear all;
clc;
%Sabit parametre tanýmlamalarý
T=100e-6;
Rs=3.03;
Rr=2.53;
Lm=0.1269;
Lls=0.0116;
Llr=0.0174;
Ls=Lm+Lls;
Lr=Lm+Llr;
Lsigma=Ls-(Lm^2)/Lr;
Pp=3;
jL=0.055;
bL=0.0019;
Vrms=220;
Irms=5.5;
cosq=0.76;
P=2200;
nnom=950;
tLnom=20;
fs=50;
%Durumlarýn baþlangýç koþullarýnýn tanýmlanmasý
vsa(1)=0;vsb(1)=0;vsc(1)=0; % Üç faz stator gerilimlerinbaþlangýç koþulu
vsalp(1)=0;vsbet(1)=0; % Stator gerilimlerinin alpha betabileþenlerinin baþlangýç koþulu
isalp(1)=0;isbet(1)=0; % Stator akýmýnýn alpha betabileþenlerinin baþlangýç koþulu
psialp(1)=0;psibet(1)=0; % Stator akýsýnýn alpha betabileþenlerinin baþlangýç koþulu
wm(1)=0; % Rotor mekanik açýsal hýzýnýn baþlangýç koþulu
Nm(1)=0; % Rotor mekanik hýzýnýn baþlangýç koþulu
tL(1)=0; % Rotor miline uygulanan yük momentinin baþlangýçkoþulu
time(1)=0; % Zamanýn baþlangýç koþulu
for k=1:10000
 time(k)=T*k;
 vsa(k)=Vrms*sqrt(2)*cos(2*pi*fs*time(k));
 vsb(k)=Vrms*sqrt(2)*cos(2*pi*fs*time(k)-2*pi/3);
 vsc(k)=Vrms*sqrt(2)*cos(2*pi*fs*time(k)-4*pi/3);
 vsalp(k)=(2*vsa(k)-vsb(k)-vsc(k))/3;
 vsbet(k)=(vsb(k)-vsc(k))/sqrt(3);
 if(k<5000)
 tL(k)=0;
 else
 tL(k)=20;
 end
 isalp(k+1)=(1-(Rs/Lsigma+Lm^2*Rr/(Lsigma*Lr^2))*T)*isalp(k)-Pp*wm(k)*T*isbet(k)+Rr*T*psialp(k)/(Lr*Lsigma)+Pp*wm(k)*T*psibet(k)/Lsigma+vsalp(k)*T/Lsigma;

 isbet(k+1)=(1-(Rs/Lsigma+Rr*Ls/(Lsigma*Lr))*T)*isbet(k)+Pp*wm(k)*T*isalp(k)+Rr*T*psibet(k)/(Lr*Lsigma)-Pp*wm(k)*T*psialp(k)/Lsigma+vsbet(k)*T/Lsigma;
 psialp(k+1)=(vsalp(k)-Rs*isalp(k))*T+psialp(k);
 psibet(k+1)=(vsbet(k)-Rs*isbet(k))*T+psibet(k);
 wm(k+1)= (3*Pp*T*(psialp(k)*isbet(k)-psibet(k)*isalp(k))/(2*jL))-tL(k)*T/jL+(1-bL*T/jL)*wm(k);
 Nm(k+1)=60*wm(k+1)/(2*pi); % Rotor mekanik hýzýnýn dev/dkcinsinden hesabý
 isalp(k)=isalp(k+1);
 isbet(k)=isbet(k+1);
 psialp(k)=psialp(k+1);
 psibet(k)=psibet(k+1);
 wm(k)=wm(k+1);
 time(k+1)=time(k);
% vsa(k+1)=vsa(k);
% vsb(k+1)=vsb(k);
% vsc(k+1)=vsc(k);
% vsalp(k+1)=vsalp(k);
% vsbet(k+1)=vsbet(k);
end
subplot(3,1,1)
plot(time,isalp,'k')
hold on
plot(time,isbet,'r')
subplot(3,1,2)
plot(time,psialp,'k')
hold on
plot(time,psibet,'r')
subplot(3,1,3)
plot(time,Nm,'k')