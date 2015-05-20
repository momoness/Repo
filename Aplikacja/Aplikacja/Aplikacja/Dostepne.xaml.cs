using System;
using System.Collections.Generic;
using System.IO;
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
    /// Interaction logic for Dostepne.xaml
    /// </summary>
    public partial class Dostepne : Window
    {
        public Dostepne()
        {
            InitializeComponent();
        }

        private void Button_Click(object sender, RoutedEventArgs e)//wczytaj
        {
            StreamReader rd = new StreamReader("C:\\Users\\User\\Documents\\Visual Studio 2013\\Projects\\Aplikacja\\Aplikacja\\bin\\Dostepne.txt");
            string bufor;

            bufor = rd.ReadLine();

            while (bufor != null)
            {
                boxx.AppendText(bufor);
                boxx.AppendText("\n");
                bufor = rd.ReadLine();
            }
            rd.Close();
        }

        private void Button_Click_1(object sender, RoutedEventArgs e)
        {
            string wynik = null;
            
            StreamReader rd = new StreamReader("C:\\Users\\User\\Documents\\Visual Studio 2013\\Projects\\Aplikacja\\Aplikacja\\bin\\Dostepne.txt");
            string bufor = "a";
            string co = wyszukajBox.Text;
            while (bufor != null)
                {
                    if (bufor.StartsWith(co))
                    {
                        wynik = bufor;
                        bufor = null;
                    }
                    bufor = rd.ReadLine();
                }
            if (wynik != null)
                wyszukajBox.AppendText("Znaleziono");
            else
                wyszukajBox.AppendText("Nie znaleziono");
        }
    }
}
