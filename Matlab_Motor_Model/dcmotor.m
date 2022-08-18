clear
P_rated =1400;
V_rated = 24;
Ra = 0.17;
Rs = 0.03;
A =200;
B = 5;
V_nl = 25;
I_nl=3.0;
n_nl =900;
w_nl=2*pi*n_nl/60;
E_nl = V_nl-I_nl*(Ra+Rs);
Km=E_nl/(I_nl*w_nl);
Vt=V_rated;
n= 0: 900;
w=2*pi*n/60;
Ia=Vt./(Ra+Rs+Km*w);
Tm=Km*Ia.^2;
Tp =A+B*w;

plot (n, Tm,'k',n, Tp, 'k--');
legend('Motor', 'Pompa');
xlabel('Motor ve pompa hızı');
ylabel('Tork');axis ([0 900 0 1000]);

io=0;
i=1;
while io==0
    if Tp(i) >= Tm(i)
        io = i;
    end
    i=i+1;
end
fprintf('%g d/d hızdaki calısma torku %g Nm.\n',n(io),Tm(io));
title([num2str(n(io)),'d/d hızdaki calısma torku', num2str(Tm(io)),'Nm']);
I_rated = P_rated/V_rated;
fprintf('motor anma akımı%g A.\n',I_rated);
Istart = 2*I_rated;
Vstart = I_rated*(Ra+Rs);
fprintf('Sınırlanmış akım %g A.\n',I_rated);
Tstart = Km * Istart^2;
fprintf ('Sinirlanmis akımın ürettiği başlangıc torku %g Nm.\n',Tstart);
Tpompa_start=A;
fprintf('pompanın gerek duyduğu en düsük baslama torku %g Nm.\n',A);
if Tstart >= Tpompa_start
    fprintf('pompa sınırlanmıs akım ile baslayabilir.\n');
else
    fprintf('pompa sınırlanmış akım ile baslayamaz.\n 1');
end
