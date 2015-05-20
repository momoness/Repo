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
    /// Interaction logic for wypozycz.xaml
    /// </summary>
    public partial class wypozycz : Window
    {
        public wypozycz()
        {
            InitializeComponent();
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                Wyszukaj w = new Wyszukaj();
                w.Show();
            }
            catch(System.InvalidOperationException exc)
            {
                Console.WriteLine("Invalid opperation"+exc);
            }
        }

        private void Button_Click_1(object sender, RoutedEventArgs e)//wypozycz
        {
            string co = box.Text+"@";

            klient kl = new klient();
            kl.run(co);
            this.Close();
        }
    }
}
