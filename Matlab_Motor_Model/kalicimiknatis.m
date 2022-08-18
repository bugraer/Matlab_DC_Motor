clear
P_rated=24;
V_rated =12;
n_nl =4550;
Km=0.0247;
Tstall=0.32;

Ia_stall = Tstall/Km;
Ra=V_rated/Ia_stall;
w_nl=n_nl*pi/30;
Ea_nl=w_nl*Km;
Ia_nl=(V_rated-Ea_nl)/Ra;
Prot_nl=Ea_nl*Ia_nl;
K_load=20;
n_fl=3750;

Vt(1)=4;
Ea(1)=Ea_nl/3;
n(1)=Ea(1)/Km*(30/pi);
Pa(1)=K_load*(n(1)/n_fl)*(n(1)/n_fl);
Ia(1)=Pa(1)/Ea(1);

Vt(2)=8;
Ea(2)=Ea_nl/1.5;
n(2)=Ea(2)/Km*(30/pi);
Pa(2)=K_load*(n(2)/n_fl)*(n(2)/n_fl);
Ia(2)=Pa(2)/Ea(2);

Vt(3)=12;
Ea(3)=Ea_nl/1;
n(3)=Ea(3)/Km*(30/pi);
Pa(3)=K_load*(n(3)/n_fl);
Ia(3)=Pa(3)/Ea(3);

figure(1)
plot(Vt,n)
xlim([4 12])
ylim([0 5000])
xlabel('\itV_{t}');
ylabel('\itn');
title('Kalici miknatisli Da motoru gerilim-hiz degisimi');

figure(2)
plot(Ia,Pa)
xlabel('\itI_{a}');
ylabel('\itP_{a}');
title('Kalici miknatisli Da motoru akim-guc degisimi');


