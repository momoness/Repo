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
    /// Interaction logic for usunK.xaml
    /// </summary>
    public partial class usunK : Window
    {
        public usunK()
        {
            InitializeComponent();
        }

        private void Button_Click(object sender, RoutedEventArgs e)//usun
        {
            try
            {
                if (dramatB1.IsChecked == true)
                {
                    Dramat obiekt = new Dramat();
                    string us = usunBox.Text;
                    Console.WriteLine(us);
                    int wynik = obiekt.usun(us);
                    if (wynik>0)
                    {
                        wynikBox.AppendText("Usuwanie ok");
                    }
                }
                else if (fantasyB.IsChecked == true)
                {
                    Fantasy obiekt = new Fantasy();

                    string us = usunBox.Text;
                    Console.WriteLine(us);
                    int wynik = obiekt.usun(us);
                    if (wynik > 0)
                    {
                        wynikBox.AppendText("Usuwanie ok");
                    }

                }
                else if (historycznaB.IsChecked == true)
                {
                    Hist obiekt = new Hist();
                    string us = usunBox.Text;
                    Console.WriteLine(us);
                    int wynik = obiekt.usun(us);
                    if (wynik > 0)
                    {
                        wynikBox.AppendText("Usuwanie ok");
                    }

                }
                else if (horrorB.IsChecked == true)
                {
                    Horror obiekt = new Horror();

                    string us = usunBox.Text;
                    Console.WriteLine(us);
                    int wynik = obiekt.usun(us);
                    if (wynik > 0)
                    {
                        wynikBox.AppendText("Usuwanie ok");
                    }
                }
                else if (inneB.IsChecked == true)
                {
                    Inne obiekt = new Inne();

                    string us = usunBox.Text;
                    Console.WriteLine(us);
                    int wynik = obiekt.usun(us);
                    if (wynik > 0)
                    {
                        wynikBox.AppendText("Usuwanie ok");
                    }
                }
                else if (komediaB.IsChecked == true)
                {
                    Komedia obiekt = new Komedia();

                    string us = usunBox.Text;
                    Console.WriteLine(us);
                    int wynik = obiekt.usun(us);
                    if (wynik > 0)
                    {
                        wynikBox.AppendText("Usuwanie ok");
                    }
                }
                else if (kuchniaB.IsChecked == true)
                {
                    Kuchnia obiekt = new Kuchnia();

                    string us = usunBox.Text;
                    Console.WriteLine(us);
                    int wynik = obiekt.usun(us);
                    if (wynik > 0)
                    {
                        wynikBox.AppendText("Usuwanie ok");
                    }
                }
                else if (pieknaB.IsChecked == true)
                {
                    LPiekna obiekt = new LPiekna();

                    string us = usunBox.Text;
                    Console.WriteLine(us);
                    int wynik = obiekt.usun(us);
                    if (wynik > 0)
                    {
                        wynikBox.AppendText("Usuwanie ok");
                    }
                }
                else if (MilitariaB.IsChecked == true)
                {
                    Militaria obiekt = new Militaria();

                    string us = usunBox.Text;
                    Console.WriteLine(us);
                    int wynik = obiekt.usun(us);
                    if (wynik > 0)
                    {
                        wynikBox.AppendText("Usuwanie ok");
                    }
                }
                else if (naukaB.IsChecked == true)
                {
                    Nauka obiekt = new Nauka();

                    string us = usunBox.Text;
                    Console.WriteLine(us);
                    int wynik = obiekt.usun(us);
                    if (wynik > 0)
                    {
                        wynikBox.AppendText("Usuwanie ok");
                    }
                }
                else if (podB.IsChecked == true)
                {
                    Podreczniki obiekt = new Podreczniki();

                    string us = usunBox.Text;
                    Console.WriteLine(us);
                    int wynik = obiekt.usun(us);
                    if (wynik > 0)
                    {
                        wynikBox.AppendText("Usuwanie ok");
                    }
                }
                else if (powiescB.IsChecked == true)
                {
                    Powiesc obiekt = new Powiesc();

                    string us = usunBox.Text;
                    Console.WriteLine(us);
                    int wynik = obiekt.usun(us);
                    if (wynik > 0)
                    {
                        wynikBox.AppendText("Usuwanie ok");
                    }
                }
                else if (przygB.IsChecked == true)
                {
                    Przyg obiekt = new Przyg();

                    string us = usunBox.Text;
                    Console.WriteLine(us);
                    int wynik = obiekt.usun(us);
                    if (wynik > 0)
                    {
                        wynikBox.AppendText("Usuwanie ok");
                    }
                }
                else if (religiaB.IsChecked == true)
                {
                    Religijne obiekt = new Religijne();

                    string us = usunBox.Text;
                    Console.WriteLine(us);
                    int wynik = obiekt.usun(us);
                    if (wynik > 0)
                    {
                        wynikBox.AppendText("Usuwanie ok");
                    }
                }
                else if (romansB.IsChecked == true)
                {
                    Romans obiekt = new Romans();

                    string us = usunBox.Text;
                    Console.WriteLine(us);
                    int wynik = obiekt.usun(us);
                    if (wynik > 0)
                    {
                        wynikBox.AppendText("Usuwanie ok");
                    }
                }
                else if (sensacjaB.IsChecked == true)
                {
                    Sensacja obiekt = new Sensacja();

                    string us = usunBox.Text;
                    Console.WriteLine(us);
                    int wynik = obiekt.usun(us);
                    if (wynik > 0)
                    {
                        wynikBox.AppendText("Usuwanie ok");
                    }
                }
                else if (sportB.IsChecked == true)
                {
                    Sport obiekt = new Sport();

                    string us = usunBox.Text;
                    Console.WriteLine(us);
                    int wynik = obiekt.usun(us);
                    if (wynik > 0)
                    {
                        wynikBox.AppendText("Usuwanie ok");
                    }
                }
            }
            catch (System.InvalidOperationException exc)
            {
                Console.WriteLine("Invalid Operation", exc);
            }

        }

        private void Button_Click_1(object sender, RoutedEventArgs e)
        {
            this.Close();
        }
    }
}
