using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace WindowsFormsApplication1
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void Form1_Load(object sender, EventArgs e)
        {

        }

        private void button1_Click(object sender, EventArgs e)
        {
            double Hiz = Convert.ToDouble(textBox1.Text);
            double Cıkıs_Gucu = Convert.ToDouble(textBox2.Text);
            double Giris_Gucu = Convert.ToDouble(textBox3.Text);
            double Voltaj = Convert.ToDouble(textBox4.Text);
            double Enduvi_Direnc = Convert.ToDouble(textBox5.Text);
            double Verim = Convert.ToDouble(textBox6.Text);
            double Alan_Sargısı = Convert.ToDouble(textBox7.Text);
            double Doner_Kaybı = Convert.ToDouble(textBox8.Text);
            double Akım = Convert.ToDouble(textBox9.Text);
            double Tork = Convert.ToDouble(textBox10.Text);
            

            double pi = 3.14;
            double w = (2 * pi * Hiz) / (60);
            double Cıkıs_Gucu1 = Cıkıs_Gucu * 746;
            double If = Voltaj / Alan_Sargısı;
            double Ia = Akım - If;
            if (radioButton1.Checked == true && radioButton2.Checked == false) 
            {
                double Ec = Voltaj - ((Enduvi_Direnc * Akım) + (Alan_Sargısı * Akım));
                Giris_Gucu = Ec * Akım;
                Doner_Kaybı = Giris_Gucu - Cıkıs_Gucu1;
                double toplam_guc = Voltaj * Akım;
                Verim = Cıkıs_Gucu1 / toplam_guc * 100;
                Tork = Giris_Gucu / w;
                

            }
            if (radioButton1.Checked == false && radioButton2.Checked == true)
            {
                
                double Ec = Voltaj - (Enduvi_Direnc * Akım);
                Giris_Gucu = Ec * Akım;
                Doner_Kaybı = Giris_Gucu - Cıkıs_Gucu1;
                double toplam_guc = Voltaj * Akım;
                Verim = Cıkıs_Gucu1 / toplam_guc * 100;
                Tork = Giris_Gucu / w;
               
            }

            double MaksGuc = Voltaj * Voltaj / (4 * (Enduvi_Direnc + Alan_Sargısı));
            double MaksAkım = Voltaj/ (2 * (Enduvi_Direnc + Alan_Sargısı));
            double verimicinakim = Math.Sqrt((Doner_Kaybı / (Enduvi_Direnc + Alan_Sargısı)));
            double alankayip = If * If * Alan_Sargısı;
            double endkayip = Ia * Ia * Enduvi_Direnc;

            label2.Text = Hiz.ToString();
            label3.Text = Cıkıs_Gucu1.ToString();
            label5.Text = Giris_Gucu.ToString();
            label7.Text = Voltaj.ToString();
            label9.Text = Enduvi_Direnc.ToString();
            label11.Text = Verim.ToString();
            label13.Text = Alan_Sargısı.ToString();
            label15.Text = Doner_Kaybı.ToString();
            label17.Text = Akım.ToString();
            label19.Text = Tork.ToString();
            label27.Text = MaksGuc.ToString();
            label25.Text = MaksAkım.ToString();
            label29.Text = verimicinakim.ToString();
            label22.Text = endkayip.ToString();
            label23.Text = alankayip.ToString();
        }

        private void label19_Click(object sender, EventArgs e)
        {

        }

        private void label20_Click(object sender, EventArgs e)
        {

        }

        private void label21_Click(object sender, EventArgs e)
        {

        }
    }
}
