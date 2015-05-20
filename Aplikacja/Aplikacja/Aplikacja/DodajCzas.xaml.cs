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
    /// Interaction logic for DodajCzas.xaml
    /// </summary>
    public partial class DodajCzas : Window
    {
        public DodajCzas()
        {
            InitializeComponent();
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                Czasopismo obiekt = new Czasopismo();
                string tytul,rok,numer,id;
                tytul = tytulb.Text;
                rok = rokb.Text;
                numer = nrb.Text;
                id = idb.Text;
                obiekt.dodaj(id,tytul, rok, numer);
                this.Close();
            }
            catch(System.InvalidOperationException exc){
                Console.WriteLine("IOperation",exc);
            }
        }

        private void Button_Click_1(object sender, RoutedEventArgs e)
        {
            this.Close();
        }
    }
}
