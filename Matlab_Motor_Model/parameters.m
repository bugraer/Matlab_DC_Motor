clear; clc;

Rs = 3.04;
Rr = 2.54;
Ls = 0.1466;
Lr = 0.1524;
Lm = 0.135;

Lsigma=Ls-(Lm^2)/Lr;

Jt = 0.055;
Bt=1e-3;

Pp=3;
T=100e-6;
V_amp=220*sqrt(2);
we=2*pi*50;