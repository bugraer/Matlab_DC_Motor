
#include <TimerOne.h>
unsigned int sayac=0;
  
int in1 = 9; 
int in2 = 5; 
 int ena = 10;
void say() // sayma işlemi
{
 sayac++; // sayacı bir arttır
} 
  
void timerIsr()
{
 Timer1.detachInterrupt(); //zamanlayıcıyı durdur
 Serial.print("Motor hızı: "); 
 int devir = (sayac / 2); // buradaki 15 sayısı encoderdeki boşluk veya delik sayısıdır. Sizdeki kaç delik ise o sayıyı yazın.
 Serial.print(devir,DEC); 
 Serial.println(" Saniyedeki Devir Sayısı"); 
 sayac=0; // sayacı sıfırla
 Timer1.attachInterrupt( timerIsr ); //zamanlayıcıyı etkinleştir
}
  
void setup() 
{
 Serial.begin(9600);
  
 pinMode(in1, OUTPUT); 
 pinMode(in2, OUTPUT); 
 pinMode(ena, OUTPUT);
 digitalWrite(in1, HIGH); 
 digitalWrite(in2, LOW); 
 Timer1.initialize(1000000); // zamanlayıcıyı bir saniyeye ayarla
 attachInterrupt(0, say, RISING); // Sensör pini high olduğunda sayacı bir arttır.
 Timer1.attachInterrupt( timerIsr ); // timerIsr zamanlayıcıyı etkinleştir
} 
  
void loop()
{
 int pot_deger = analogRead(0); // Potansiyometreden veri okuma 
 int motor_hizi = map(pot_deger, 0, 680, 255, 0); // hız değerini hesapla
 analogWrite(ena, motor_hizi); // hız değerini yazdır.
  
}
