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
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace Aplikacja
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();


        }

        

        public bool sprawdzKlienta(string login, string password)
        {
            if (login == "klient" & password == "klient")
                return true;
            else
                return false;
        }

        public bool sprawdzAdmina(string login, string password)
        {
            if (login == "admin" & password == "admin")
                return true;
            else
                return false;
        }

        private void loginB_Click(object sender, RoutedEventArgs e)
        {
            string uzytkownik = this.nameText.Text;
            string haslo = this.passText.Password;

            if (klRB.IsChecked == true)
            {
                if (sprawdzKlienta(uzytkownik, haslo) == true)
                {
                    try
                    {
                        Console.WriteLine("Zalogowano");
                        KlientGlowna kl = new KlientGlowna();
                        kl.Show();
                        this.Close();
                    }
                    catch (System.InvalidOperationException exc)
                    {
                        Console.WriteLine("Invalid Operation Exception", exc);
                    }
                }
                else
                {
                    try
                    {
                        Console.WriteLine("Blad");
                        blad bl = new blad();
                        bl.Show();
                        this.Close();
                    }
                    catch (System.InvalidOperationException exc)
                        {
                        Console.WriteLine("Invalid Operation Exception", exc);
                    }
                }
            }
            else if (adRB.IsChecked == true)
            {
                if (sprawdzAdmina(uzytkownik, haslo) == true)
                {
                    try
                    {
                        Console.WriteLine("Zalogowano");
                        AdminGlowna ad = new AdminGlowna();
                        ad.Show();
                        this.Close();
                    }
                    catch(System.IO.IOException exc)
                    {
                        Console.WriteLine("IOException", exc);
                    }
                    catch (System.InvalidOperationException exc)
                    {
                        Console.WriteLine("System Invalid Opeartion Exception", exc);
                    }
                }
                else
                {
                    try
                    {
                        Console.WriteLine("Blad");
                        blad bl = new blad();
                        bl.Show();
                        this.Close();
                    }
                    catch (System.IO.IOException exc)
                    {
                        Console.WriteLine("IOException", exc);
                    }
                    catch (System.InvalidOperationException exc)
                    {
                        Console.WriteLine("System Invalid Opeartion Exception", exc);
                    }
                }
            }
            else
            {
                try
                {
                    Console.WriteLine("Blad");
                    blad bl = new blad();
                    bl.Show();
                                    }
                catch (System.IO.IOException exc)
                {
                    Console.WriteLine("IOException", exc);
                }
                catch (System.InvalidOperationException exc)
                {
                    Console.WriteLine("System Invalid Opeartion Exception", exc);
                }
            }
        }

        private void exitB_Click(object sender, RoutedEventArgs e)
        {
            this.Close();
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                OProgramie pr = new OProgramie();
                pr.Show();
            }
            catch (System.InvalidOperationException exc)
            {
                Console.WriteLine("Inavalid Opertion", exc);
            }
        }
    }


}
