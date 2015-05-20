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
    /// Interaction logic for usunC.xaml
    /// </summary>
    public partial class usunC : Window
    {
        public usunC()
        {
            InitializeComponent();
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            this.Close();
        }

        private void Button_Click_1(object sender, RoutedEventArgs e)
        {
                Czasopismo obiekt = new Czasopismo();
                int wynik = obiekt.usun(usunBox.Text);
                if (wynik > 0)
                    wynikB.AppendText("Usuwanie ok");
                else
                    wynikB.AppendText("Blad!");
        }
    }
}
