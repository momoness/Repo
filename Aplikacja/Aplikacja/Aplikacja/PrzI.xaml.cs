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
    /// Interaction logic for PrzI.xaml
    /// </summary>
    public partial class PrzI : Window
    {
        public PrzI()
        {
            InitializeComponent();
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                if (albumB.IsChecked == true)
                {
                    Atlasy obiekt = new Atlasy();
                    obiekt.wypisz(box);
                    box.AppendText("~*~*~*~*~*~*~*~*~*~*~*~*~*~*~");
                    box.AppendText("\n");
                }
                else if (kalB.IsChecked == true)
                {
                    Kalendarz obiekt = new Kalendarz();
                    obiekt.wypisz(box);
                    box.AppendText("~*~*~*~*~*~*~*~*~*~*~*~*~*~*~");
                    box.AppendText("\n");
                }
                else if (mapaB.IsChecked == true)
                {
                    Mapy obiekt = new Mapy();
                    obiekt.wypisz(box);
                    box.AppendText("~*~*~*~*~*~*~*~*~*~*~*~*~*~*~");
                    box.AppendText("\n");
                }
                else if (albumB.IsChecked == true)
                {
                    Album obiekt = new Album();
                    obiekt.wypisz(box);
                    box.AppendText("~*~*~*~*~*~*~*~*~*~*~*~*~*~*~");
                    box.AppendText("\n");
                }
                else if (przewB.IsChecked == true)
                {
                    Przewodnik obiekt = new Przewodnik();
                    obiekt.wypisz(box);
                    box.AppendText("~*~*~*~*~*~*~*~*~*~*~*~*~*~*~");
                    box.AppendText("\n");
                }
                else if (inneB.IsChecked == true)
                {
                    Atlasy obiekt1 = new Atlasy();
                    Kalendarz obiekt2 = new Kalendarz();
                    Mapy obiekt3 = new Mapy();
                    Album obiekt4 = new Album();
                    Przewodnik obiekt5 = new Przewodnik();
                    obiekt1.wypisz(box); obiekt2.wypisz(box); obiekt3.wypisz(box); obiekt4.wypisz(box); obiekt5.wypisz(box);
                    box.AppendText("~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~");
                    box.AppendText("\n");
                }
            }
            catch (System.InvalidOperationException exc)
            {
                Console.WriteLine("Invalid Opertaion", exc);
            }
        }

        private void Button_Click_1(object sender, RoutedEventArgs e)
        {
            try
            {
                KlientGlowna kg = new KlientGlowna();
                kg.Show();
                this.Close();
            }
            catch (System.InvalidOperationException exc)
            {
                Console.WriteLine("Invalid opertaion" + exc);
            }
        }
    }
}
