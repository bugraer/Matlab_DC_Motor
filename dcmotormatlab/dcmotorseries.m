clear
P_rated =30000;
V_rated = 400;
Ra = 0.7;
Rs = 0.3;
A =200;
B = 5;
V_nl = 410;
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
legend('Motor', 'reduktor');
xlabel('Motor ve reduktor hýzý');
ylabel('Tork');axis ([0 900 0 1000]);

io=0;
i=1;
while io==0
    if Tp(i) >= Tm(i)
        io = i;
    end
    i=i+1;
end
fprintf('%g d/d hýzdaki calýsma torku %g Nm.\n',n(io),Tm(io));
title([num2str(n(io)),'d/d hýzdaki calýsma torku', num2str(Tm(io)),'Nm']);
I_rated = P_rated/V_rated;
fprintf('motor anma akýmý%g A.\n',I_rated);
Istart = 2*I_rated;
Vstart = I_rated*(Ra+Rs);
fprintf('Sýnýrlanmýþ akým %g A.\n',I_rated);
Tstart = Km * Istart^2;
fprintf ('Sinirlanmis akýmýn ürettiði baþlangýc torku %g Nm.\n',Tstart);
Tpompa_start=A;
fprintf('pompanýn gerek duyduðu en düsük baslama torku %g Nm.\n',A);
if Tstart >= Tpompa_start
    fprintf('reduktor sýnýrlanmýs akým ile baslayabilir.\n');
else
    fprintf('reduktor sýnýrlanmýþ akým ile baslayamaz.\n 1');
end
