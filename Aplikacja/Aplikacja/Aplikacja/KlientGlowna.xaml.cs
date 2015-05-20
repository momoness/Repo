using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;

namespace Aplikacja
{
    /// <summary>
    /// Interaction logic for KlientGlowna.xaml
    /// </summary>
    public partial class KlientGlowna : Window
    {
        public KlientGlowna()
        {
            InitializeComponent();


        }

        private void Button_Click(object sender, RoutedEventArgs e)//wyloguj
        {
            try
            {
                MainWindow main = new MainWindow();
                main.Show();
                this.Close();
            }
            catch (System.InvalidOperationException exc)
            {
                Console.WriteLine("Invalid Opertaion", exc);
            }
        }

        private void Button_Click_1(object sender, RoutedEventArgs e)//wyjdz
        {
            this.Close();
        }

        private void Button_Click_2(object sender, RoutedEventArgs e)//o porgramie
        {
            try
            {
                OProgramie pr = new OProgramie();
                pr.Show();
            }
            catch (System.InvalidOperationException exc)
            {
                Console.WriteLine("Invalid Opertaion", exc);
            }
        }

        private void Button_Click_3(object sender, RoutedEventArgs e)
        {
            try
            {
                przegK pk = new przegK();
                pk.Show();
            }
            catch (System.InvalidOperationException exc)
            {
                Console.WriteLine("Invalid operation", exc);
            }
        }

        private void Button_Click_4(object sender, RoutedEventArgs e)
        {
            try
            {
                PrzC pc = new PrzC();
                pc.Show();
                this.Close();
            }
            catch(System.InvalidOperationException exc)
            {
                Console.WriteLine("Invalid opperation"+exc);
            }
        }

        private void Button_Click_5(object sender, RoutedEventArgs e)
        {
            try
            {
                PrzI pi = new PrzI();
                pi.Show();
                this.Close();
            }
            catch (System.InvalidOperationException exc)
            {
                Console.WriteLine("Invalid opperation" + exc);
            }
        }

        private void Button_Click_6(object sender, RoutedEventArgs e)//wypozycz
        {
            try
            {
                wypozycz wyp = new wypozycz();
                wyp.Show();
            }
            catch (System.InvalidOperationException exc)
            {
                Console.WriteLine("Invalid opperation" + exc);
            }
        }

        private void Button_Click_7(object sender, RoutedEventArgs e)//przegladaj ywp
        {
            PrzegWyp pw = new PrzegWyp();
            pw.Show();
        }

        private void Button_Click_8(object sender, RoutedEventArgs e)
        {
            Dostepne dos = new Dostepne();
            dos.Show();
        }
    }
}
