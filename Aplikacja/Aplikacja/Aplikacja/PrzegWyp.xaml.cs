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
    /// Interaction logic for PrzegWyp.xaml
    /// </summary>
    public partial class PrzegWyp : Window
    {
        public PrzegWyp()
        {
            InitializeComponent();
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                StreamReader czytaj = new StreamReader("C:\\Users\\User\\Documents\\Visual Studio 2013\\Projects\\Aplikacja\\Aplikacja\\bin\\Wypozyczone.txt");

                string bufor = czytaj.ReadLine();
                box.AppendText(bufor);

                while (bufor != null)
                {
                    if (bufor.StartsWith("-"))
                    {
                        box.AppendText("\n");
                    }
                    box.AppendText(bufor);
                    bufor = czytaj.ReadLine();
                    
                }
            }
            catch (System.InvalidOperationException exc)
            {
                Console.WriteLine("Invalid Operation" + exc);
            }
            catch (System.ArgumentNullException exc)
            {
                Console.WriteLine("Argument Null", exc);
            }
            catch (System.IO.IOException exc)
            {
                Console.WriteLine("IOE", exc);
            }
        }

        private void Button_Click_1(object sender, RoutedEventArgs e)
        {
            string wynik = null;
            try
            {
                StreamReader rd = new StreamReader("C:\\Users\\User\\Documents\\Visual Studio 2013\\Projects\\Aplikacja\\Aplikacja\\bin\\Wypozyczone.txt");
                string bufor = "a";
                string co = linijka.Text;


                while (bufor != null)
                {
                    bufor = rd.ReadLine();
                    if (bufor.StartsWith(co))
                    {
                        wynik = bufor;
                        bufor = null;
                    }
                }
                linijka.AppendText(wynik);



            }
            catch (System.InvalidOperationException exc)
            {
                Console.WriteLine("Invalid Operation", exc);
            }
            catch (System.ArgumentException exc)
            {
                Console.WriteLine("Argument", exc);
            }
            catch (System.IO.FileNotFoundException exc)
            {
                Console.WriteLine("File not found", exc);
            }
            catch (System.IO.DirectoryNotFoundException exc)
            {
                Console.WriteLine("Directory not found", exc);
            }
            catch (System.IO.IOException exc)
            {
                Console.WriteLine("IO", exc);
            }
            catch (System.OutOfMemoryException exc)
            {
                Console.WriteLine("Out of memory", exc);
            }
        }
    }
}
