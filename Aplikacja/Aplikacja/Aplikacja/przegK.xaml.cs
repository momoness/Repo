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
    /// Interaction logic for przegK.xaml
    /// </summary>
    public partial class przegK : Window
    {
        public przegK()
        {
            InitializeComponent();
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            if (wszystkoB.IsChecked == true)
            {
                box.AppendText("Tytul Nazwisko Imie Autora");
                box.AppendText("\n");
                Dramat obiekt = new Dramat();
                Fantasy obiekt1 = new Fantasy();
                Hist obiekt2 = new Hist();
                Horror obiekt3 = new Horror();
                Inne obiekt4 = new Inne();
                Komedia obiekt5 = new Komedia();
                Kuchnia obiekt6 = new Kuchnia();
                LPiekna obiekt7 = new LPiekna();
                Militaria obiekt8 = new Militaria();
                Nauka obiekt9 = new Nauka();
                Podreczniki obiekt10 = new Podreczniki();
                Powiesc obiekt11 = new Powiesc();
                Przyg obiekt12 = new Przyg();
                Religijne obiekt13 = new Religijne();
                Romans obiekt14 = new Romans();
                Sensacja obiekt15 = new Sensacja();
                Sport obiekt16 = new Sport();
                obiekt.wypisz(box);
                obiekt1.wypisz(box);
                obiekt2.wypisz(box);
                obiekt3.wypisz(box);
                obiekt4.wypisz(box);
                obiekt5.wypisz(box);
                obiekt6.wypisz(box);
                obiekt7.wypisz(box);
                obiekt8.wypisz(box);
                obiekt9.wypisz(box);
                obiekt10.wypisz(box);
                obiekt11.wypisz(box);
                obiekt12.wypisz(box);
                obiekt13.wypisz(box);
                obiekt14.wypisz(box);
                obiekt15.wypisz(box);
                obiekt16.wypisz(box);
                box.AppendText("~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~");
                box.AppendText("\n");
            }
            else if (dramatB1.IsChecked == true)
            {
                Dramat obiekt = new Dramat();
                obiekt.wypisz(box);
                box.AppendText("~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~");
                box.AppendText("\n");
            }
            else if (horrorB.IsChecked == true)
            {
                Horror obiekt = new Horror();
                obiekt.wypisz(box);
                box.AppendText("~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~");
                box.AppendText("\n");
            }
            else if (fantasyB.IsChecked == true)
            {
                Fantasy obiekt = new Fantasy();
                obiekt.wypisz(box);
                box.AppendText("~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~");
                box.AppendText("\n");
            }
            else if (historycznaB.IsChecked == true)
            {
                Hist obiekt = new Hist();
                obiekt.wypisz(box);
                box.AppendText("~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~");
                box.AppendText("\n");
            }
            else if (inneB.IsChecked == true)
            {
                Inne obiekt = new Inne();
                obiekt.wypisz(box);
                box.AppendText("~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~");
                box.AppendText("\n");
            }
            else if (pieknaB.IsChecked == true)
            {
                LPiekna obiekt = new LPiekna();
                obiekt.wypisz(box);
                box.AppendText("~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~");
                box.AppendText("\n");
            }
            else if (MilitariaB.IsChecked == true)
            {
                Militaria obiekt = new Militaria();
                obiekt.wypisz(box);
                box.AppendText("~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~");
                box.AppendText("\n");
            }
            else if (naukaB.IsChecked == true)
            {
                Nauka obiekt = new Nauka();
                obiekt.wypisz(box);
                box.AppendText("~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~");
                box.AppendText("\n");
            }
            else if (podB.IsChecked == true)
            {
                Podreczniki obiekt = new Podreczniki();
                obiekt.wypisz(box);
                box.AppendText("~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~");
                box.AppendText("\n");
            }
            else if (powiescB.IsChecked == true)
            {
                Powiesc obiekt = new Powiesc();
                obiekt.wypisz(box);
                box.AppendText("~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~");
                box.AppendText("\n");               
            }
            else if (przygB.IsChecked == true)
            {
                Przyg obiekt = new Przyg();
                obiekt.wypisz(box);
                box.AppendText("~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~");
                box.AppendText("\n");
            }
            else if (religiaB.IsChecked == true)
            {
                Religijne obiekt = new Religijne();
                obiekt.wypisz(box);
                box.AppendText("~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~");
                box.AppendText("\n");
            }
            else if (romansB.IsChecked == true)
            {
                Romans obiekt = new Romans();
                obiekt.wypisz(box);
                box.AppendText("~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~");
                box.AppendText("\n");
            }
            else if (sensacjaB.IsChecked == true)
            {
                Sensacja obiekt = new Sensacja();
                obiekt.wypisz(box);
                box.AppendText("~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~");
                box.AppendText("\n");
            }
            else if (sportB.IsChecked == true)
            {
                Sport obiekt = new Sport();
                obiekt.wypisz(box);
                box.AppendText("~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~");
                box.AppendText("\n");
            }
        }
    }
}
