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
    /// Interaction logic for Wyszukaj.xaml
    /// </summary>
    public partial class Wyszukaj : Window
    {
        public Wyszukaj()
        {
            InitializeComponent();
        }

        private void SzukajButton_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                Dramat obiekt = new Dramat(); Czasopismo obiekt1 = new Czasopismo(); Fantasy obiekt2 = new Fantasy();
                Hist obiekt3 = new Hist(); Horror obiekt4 = new Horror(); Inne obiekt5 = new Inne();
                Komedia obiekt6 = new Komedia(); Kuchnia obiekt7 = new Kuchnia(); LPiekna obiekt8 = new LPiekna();
                Militaria obiekt9 = new Militaria(); Nauka obiekt10 = new Nauka(); Podreczniki obiekt11 = new Podreczniki();
                Powiesc obiekt12 = new Powiesc(); Przyg obiekt13 = new Przyg(); Religijne obiekt14 = new Religijne();
                Romans obiekt15 = new Romans(); Sensacja obiekt16 = new Sensacja(); Sport obiekt17 = new Sport();
                Album ob = new Album(); Kalendarz ob1 = new Kalendarz(); Mapy ob2 = new Mapy();
                Atlasy ob3 = new Atlasy(); Przewodnik ob4 = new Przewodnik();
                string wynik = obiekt.szukaj(SzukajBox.Text);
                wynikiBox.AppendText("\n");
                if (wynik != null)
                    wynikiBox.AppendText(wynik);
                string wynik1 = obiekt1.szukaj(SzukajBox.Text);
                wynikiBox.AppendText("\n");
                if (wynik1 != null)
                    wynikiBox.AppendText(wynik); 
                string wynik2 = obiekt2.szukaj(SzukajBox.Text);
                wynikiBox.AppendText("\n");
                if (wynik2 != null)
                    wynikiBox.AppendText(wynik); 
                string wynik3 = obiekt3.szukaj(SzukajBox.Text);
                wynikiBox.AppendText("\n");
                if (wynik3 != null)
                    wynikiBox.AppendText(wynik); 
                string wynik4 = obiekt4.szukaj(SzukajBox.Text);
                wynikiBox.AppendText("\n");
                if (wynik4 != null)
                    wynikiBox.AppendText(wynik); 
                string wynik5 = obiekt5.szukaj(SzukajBox.Text);
                wynikiBox.AppendText("\n");
                if (wynik5 != null)
                    wynikiBox.AppendText(wynik); 
                string wynik6 = obiekt6.szukaj(SzukajBox.Text);
                wynikiBox.AppendText("\n");
                if (wynik6 != null)
                    wynikiBox.AppendText(wynik); 
                string wynik7 = obiekt7.szukaj(SzukajBox.Text);
                wynikiBox.AppendText("\n");
                if (wynik7 != null)
                    wynikiBox.AppendText(wynik); 
                string wynik8 = obiekt8.szukaj(SzukajBox.Text);
                wynikiBox.AppendText("\n");
                if (wynik8 != null)
                    wynikiBox.AppendText(wynik); 
                string wynik9 = obiekt9.szukaj(SzukajBox.Text);
                wynikiBox.AppendText("\n");
                if (wynik9 != null)
                    wynikiBox.AppendText(wynik); 
                string wynik10 = obiekt10.szukaj(SzukajBox.Text);
                wynikiBox.AppendText("\n");
                if (wynik10 != null)
                    wynikiBox.AppendText(wynik); 
                string wynik11 = obiekt11.szukaj(SzukajBox.Text);
                wynikiBox.AppendText("\n");
                if (wynik11 != null)
                    wynikiBox.AppendText(wynik); 
                string wynik12 = obiekt12.szukaj(SzukajBox.Text);
                wynikiBox.AppendText("\n");
                if (wynik12 != null)
                    wynikiBox.AppendText(wynik);
                string wynik13 = obiekt13.szukaj(SzukajBox.Text);
                wynikiBox.AppendText("\n");
                if (wynik13 != null)
                    wynikiBox.AppendText(wynik);
                string wynik14 = obiekt14.szukaj(SzukajBox.Text);
                wynikiBox.AppendText("\n");
                if (wynik14 != null)
                    wynikiBox.AppendText(wynik);
                string wynik15 = obiekt15.szukaj(SzukajBox.Text);
                wynikiBox.AppendText("\n");
                if (wynik15 != null)
                    wynikiBox.AppendText(wynik);
                string wynik16 = obiekt16.szukaj(SzukajBox.Text);
                wynikiBox.AppendText("\n");
                if (wynik16 != null)
                    wynikiBox.AppendText(wynik);
                string wynik17 = obiekt17.szukaj(SzukajBox.Text);
                wynikiBox.AppendText("\n");
                if (wynik17 != null)
                    wynikiBox.AppendText(wynik);
                string wynik18 = ob.szukaj(SzukajBox.Text);
                wynikiBox.AppendText("\n");
                if (wynik18 != null)
                    wynikiBox.AppendText(wynik);
                string wynik19 = ob1.szukaj(SzukajBox.Text);
                wynikiBox.AppendText("\n");
                if (wynik19 != null)
                    wynikiBox.AppendText(wynik);
                string wynik20 = ob2.szukaj(SzukajBox.Text);
                wynikiBox.AppendText("\n");
                if (wynik20 != null)
                    wynikiBox.AppendText(wynik);
                string wynik21 = ob3.szukaj(SzukajBox.Text);
                wynikiBox.AppendText("\n");
                if (wynik21 != null)
                    wynikiBox.AppendText(wynik);
                string wynik22 = ob4.szukaj(SzukajBox.Text);
                wynikiBox.AppendText("\n");
                if (wynik22 != null)
                    wynikiBox.AppendText(wynik);
                    
                wynikiBox.AppendText(" Wyszukiwanie ok");

            }
            catch (System.InvalidOperationException exc)
            {
                Console.WriteLine("Invalid opertion", exc);
;            }
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                Wyszukaj szukaj = new Wyszukaj();
                szukaj.Show();
                this.Close();
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
