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
    /// Interaction logic for dodajI.xaml
    /// </summary>
    public partial class dodajI : Window
    {
        public dodajI()
        {
            InitializeComponent();
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            this.Close();
        }

        private void Button_Click_1(object sender, RoutedEventArgs e)
        {
            try
            {
                if (albumB.IsChecked == true)
                {
                    Atlasy obiekt = new Atlasy();
                    obiekt.dodaj(tytB.Text, nazB.Text, imieB.Text, rokB.Text);
                    this.Close();
                }
                else if (kalB.IsChecked == true)
                {
                    Kalendarz obiekt = new Kalendarz();
                    obiekt.dodaj(tytB.Text, nazB.Text, imieB.Text, rokB.Text);
                    this.Close();
                }
                else if (mapaB.IsChecked == true)
                {
                    Mapy obiekt = new Mapy();
                    obiekt.dodaj(tytB.Text, nazB.Text, imieB.Text, rokB.Text);
                    this.Close();
                }
                else if (albumB.IsChecked == true)
                {
                    Album obiekt = new Album();
                    obiekt.dodaj(tytB.Text, nazB.Text, imieB.Text, rokB.Text);
                    this.Close();
                }
                else if (przewB.IsChecked == true)
                {
                    Przewodnik obiekt = new Przewodnik();
                    obiekt.dodaj(tytB.Text, nazB.Text, imieB.Text, rokB.Text);
                    this.Close();
                }
            }
            catch (System.InvalidOperationException exc)
            {
                Console.WriteLine("Invalid Opertaion", exc);
            }
        }
    }
}
