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
    /// Interaction logic for PrzC.xaml
    /// </summary>
    public partial class PrzC : Window
    {
        public PrzC()
        {
            InitializeComponent();
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                KlientGlowna kg = new KlientGlowna();
                kg.Show();
                this.Close();
            }
            catch (System.InvalidOperationException exc)
            {
                Console.WriteLine("Invalid Operation " + exc);
            }
        }

        private void Button_Click_1(object sender, RoutedEventArgs e)
        {
            box.AppendText("Id Tytul Rok Numer");
            Czasopismo obiekt = new Czasopismo();
            obiekt.wypisz(box);
        }
    }
}
