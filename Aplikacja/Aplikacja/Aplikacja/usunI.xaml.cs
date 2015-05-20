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
    /// Interaction logic for usunI.xaml
    /// </summary>
    public partial class usunI : Window
    {
        public usunI()
        {
            InitializeComponent();
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                if (albumB.IsChecked == true)
                {
                    Album obiekt = new Album();
                    string us = usunB.Text;
                    Console.WriteLine(us);
                    int wynik = obiekt.usun(us);
                    if (wynik > 0)
                    {
                        wynikB.AppendText("Usuwanie ok");
                    }
                }
                else if (kalB.IsChecked == true)
                {
                    Kalendarz obiekt = new Kalendarz();
                    string us = usunB.Text;
                    Console.WriteLine(us);
                    int wynik = obiekt.usun(us);
                    if (wynik > 0)
                    {
                        wynikB.AppendText("Usuwanie ok");
                    }
                }
                else if (mapaB.IsChecked == true)
                {
                    Mapy obiekt = new Mapy();
                    string us = usunB.Text;
                    Console.WriteLine(us);
                    int wynik = obiekt.usun(us);
                    if (wynik > 0)
                    {
                        wynikB.AppendText("Usuwanie ok");
                    }
                }
                else if (atlasB.IsChecked == true)
                {
                    Atlasy obiekt = new Atlasy();
                    string us = usunB.Text;
                    Console.WriteLine(us);
                    int wynik = obiekt.usun(us);
                    if (wynik > 0)
                    {
                        wynikB.AppendText("Usuwanie ok");
                    }
                }
                else if (przB.IsChecked == true)
                {
                    Przewodnik obiekt = new Przewodnik();
                    string us = usunB.Text;
                    Console.WriteLine(us);
                    int wynik = obiekt.usun(us);
                    if (wynik>0)
                    {
                        wynikB.AppendText("Usuwanie ok");
                    }
                }
            }
            catch (System.InvalidOperationException exc)
            {
                Console.WriteLine("Invalid operation exc", exc);
            }
            catch (System.IO.IOException exc)
            {
                Console.WriteLine("IO", exc);
            }
        }

        private void Button_Click_1(object sender, RoutedEventArgs e)
        {
            this.Close();
        }
    }
}
