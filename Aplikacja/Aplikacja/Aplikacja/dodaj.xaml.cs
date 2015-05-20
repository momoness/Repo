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
    /// Interaction logic for dodaj.xaml
    /// </summary>
    public partial class dodaj : Window
    {
        public dodaj()
        {
            InitializeComponent();
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            string tytul, nazwisko, imie;
            

            if (dramatB1.IsChecked == true)
            {
                Dramat obiekt = new Dramat();

                tytul = tytulText.Text;
                nazwisko = nazwiskoText.Text;
                imie = ImieText.Text;

                obiekt.dodaj(tytul, nazwisko, imie);

            }
            else if (fantasyB.IsChecked == true)
            {
                Fantasy obiekt = new Fantasy();

                tytul = tytulText.Text;
                nazwisko = nazwiskoText.Text;
                imie = ImieText.Text;

                obiekt.dodaj(tytul, nazwisko, imie);

            }
            else if (historycznaB.IsChecked == true)
            {
                Hist obiekt = new Hist();

                tytul = tytulText.Text;
                nazwisko = nazwiskoText.Text;
                imie = ImieText.Text;

                obiekt.dodaj(tytul, nazwisko, imie);

            }
            else if (horrorB.IsChecked == true)
            {
                Horror obiekt = new Horror();

                tytul = tytulText.Text;
                nazwisko = nazwiskoText.Text;
                imie = ImieText.Text;

                obiekt.dodaj(tytul, nazwisko, imie);

            }
            else if (inneB.IsChecked == true)
            {
                Inne obiekt = new Inne();

                tytul = tytulText.Text;
                nazwisko = nazwiskoText.Text;
                imie = ImieText.Text;

                obiekt.dodaj(tytul, nazwisko, imie);

            }
            else if (komediaB.IsChecked == true)
            {
                Komedia obiekt = new Komedia();

                tytul = tytulText.Text;
                nazwisko = nazwiskoText.Text;
                imie = ImieText.Text;

                obiekt.dodaj(tytul, nazwisko, imie);

            }
            else if (kuchniaB.IsChecked == true)
            {
                Kuchnia obiekt = new Kuchnia();

                tytul = tytulText.Text;
                nazwisko = nazwiskoText.Text;
                imie = ImieText.Text;

                obiekt.dodaj(tytul, nazwisko, imie);

            }
            else if (pieknaB.IsChecked == true)
            {
                LPiekna obiekt = new LPiekna();

                tytul = tytulText.Text;
                nazwisko = nazwiskoText.Text;
                imie = ImieText.Text;

                obiekt.dodaj(tytul, nazwisko, imie);

            }
            else if (MilitariaB.IsChecked == true)
            {
                Militaria obiekt = new Militaria();

                tytul = tytulText.Text;
                nazwisko = nazwiskoText.Text;
                imie = ImieText.Text;

                obiekt.dodaj(tytul, nazwisko, imie);

            }
            else if (naukaB.IsChecked == true)
            {
                Nauka obiekt = new Nauka();

                tytul = tytulText.Text;
                nazwisko = nazwiskoText.Text;
                imie = ImieText.Text;

                obiekt.dodaj(tytul, nazwisko, imie);

            }
            else if (podB.IsChecked == true)
            {
                Podreczniki obiekt = new Podreczniki();

                tytul = tytulText.Text;
                nazwisko = nazwiskoText.Text;
                imie = ImieText.Text;

                obiekt.dodaj(tytul, nazwisko, imie);

            }
            else if (powiescB.IsChecked == true)
            {
                Powiesc obiekt = new Powiesc();

                tytul = tytulText.Text;
                nazwisko = nazwiskoText.Text;
                imie = ImieText.Text;

                obiekt.dodaj(tytul, nazwisko, imie);

            }
            else if (przygB.IsChecked == true)
            {
                Przyg obiekt = new Przyg();

                tytul = tytulText.Text;
                nazwisko = nazwiskoText.Text;
                imie = ImieText.Text;

                obiekt.dodaj(tytul, nazwisko, imie);

            }
            else if (religiaB.IsChecked == true)
            {
                Religijne obiekt = new Religijne();

                tytul = tytulText.Text;
                nazwisko = nazwiskoText.Text;
                imie = ImieText.Text;

                obiekt.dodaj(tytul, nazwisko, imie);

            }
            else if (romansB.IsChecked == true)
            {
                Romans obiekt = new Romans();

                tytul = tytulText.Text;
                nazwisko = nazwiskoText.Text;
                imie = ImieText.Text;

                obiekt.dodaj(tytul, nazwisko, imie);

            }
            else if (sensacjaB.IsChecked == true)
            {
                Sensacja obiekt = new Sensacja();

                tytul = tytulText.Text;
                nazwisko = nazwiskoText.Text;
                imie = ImieText.Text;

                obiekt.dodaj(tytul, nazwisko, imie);

            }
            else if (sportB.IsChecked == true)
            {
                Sport obiekt = new Sport();

                tytul = tytulText.Text;
                nazwisko = nazwiskoText.Text;
                imie = ImieText.Text;

                obiekt.dodaj(tytul, nazwisko, imie);

            }

            this.Close();
        }

        

        
    }
}
