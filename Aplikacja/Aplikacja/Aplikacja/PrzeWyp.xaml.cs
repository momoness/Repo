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
    /// Interaction logic for PrzeWyp.xaml
    /// </summary>
    public partial class PrzeWyp : Window
    {
        public PrzeWyp()
        {
            InitializeComponent();
        }

        private void Button_Click(object sender, RoutedEventArgs e)//przejrzyj
        {
            try
            {
                StreamReader czytaj = new StreamReader("C:\\Users\\User\\Documents\\Visual Studio 2013\\Projects\\Aplikacja\\Aplikacja\\bin\\Do_wypozyczenia.txt");

                string bufor = czytaj.ReadLine();

                while (bufor != null)
                {
                    box.AppendText(bufor);
                    box.AppendText("\n");
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

        
        private void Button_Click_2(object sender, RoutedEventArgs e)///wyp poj
        {
            try
            {
                string co = linijka.Text;
                Console.WriteLine(co);
                if (!File.Exists("C:\\Users\\User\\Documents\\Visual Studio 2013\\Projects\\Aplikacja\\Aplikacja\\bin\\Wypozyczone.txt"))
                {
                    File.CreateText("C:\\Users\\User\\Documents\\Visual Studio 2013\\Projects\\Aplikacja\\Aplikacja\\bin\\Wypozyczone.txt");
                }
                if (!File.Exists("C:\\Users\\User\\Documents\\Visual Studio 2013\\Projects\\Aplikacja\\Aplikacja\\bin\\Do_wypozyczenia2.txt")) File.CreateText("C:\\Users\\User\\Documents\\Visual Studio 2013\\Projects\\Aplikacja\\Aplikacja\\bin\\Do_wypozyczenia2.txt"); Console.WriteLine("Utworzono pliki");
                if (!File.Exists("C:\\Users\\User\\Documents\\Visual Studio 2013\\Projects\\Aplikacja\\Aplikacja\\bin\\Dostepne2.txt")) File.CreateText("C:\\Users\\User\\Documents\\Visual Studio 2013\\Projects\\Aplikacja\\Aplikacja\\bin\\Dostepne2.txt");
                Console.WriteLine("Utworzono pliki");
                StreamReader czytajDW = new StreamReader("C:\\Users\\User\\Documents\\Visual Studio 2013\\Projects\\Aplikacja\\Aplikacja\\bin\\Do_wypozyczenia.txt"); Console.WriteLine("1");
                StreamReader czytajdos = new StreamReader("C:\\Users\\User\\Documents\\Visual Studio 2013\\Projects\\Aplikacja\\Aplikacja\\bin\\Dostepne.txt"); Console.WriteLine("3");
                StreamWriter piszdos2 = new StreamWriter("C:\\Users\\User\\Documents\\Visual Studio 2013\\Projects\\Aplikacja\\Aplikacja\\bin\\Dostepne2.txt",false); Console.WriteLine("4");
                StreamWriter piszwyp = new StreamWriter("C:\\Users\\User\\Documents\\Visual Studio 2013\\Projects\\Aplikacja\\Aplikacja\\bin\\Wypozyczone.txt",true); Console.WriteLine("5");
                StreamWriter piszDW2 = new StreamWriter("C:\\Users\\User\\Documents\\Visual Studio 2013\\Projects\\Aplikacja\\Aplikacja\\bin\\Do_wypozyczenia2.txt", false); Console.WriteLine("2");
                Console.WriteLine("Streamy poszly");
                string buforDW = czytajDW.ReadLine();
                string bufordos = czytajdos.ReadLine();

                while (buforDW != null)
                {
                    if (!buforDW.StartsWith(co))
                    {
                        piszDW2.WriteLine(buforDW);
                    }
                    buforDW = czytajDW.ReadLine();
                }
                while (bufordos != null)
                {
                    if (!bufordos.StartsWith(co))
                    {
                        piszdos2.WriteLine(bufordos);
                    }
                    else
                        piszwyp.WriteLine(bufordos);
                    bufordos = czytajdos.ReadLine();
                }
                czytajdos.Close();
                czytajDW.Close();
                piszdos2.Close();
                piszDW2.Close();
                piszwyp.Close();

                File.Delete("C:\\Users\\User\\Documents\\Visual Studio 2013\\Projects\\Aplikacja\\Aplikacja\\bin\\Do_wypozyczenia.txt");
                File.Delete("C:\\Users\\User\\Documents\\Visual Studio 2013\\Projects\\Aplikacja\\Aplikacja\\bin\\Dostepne.txt");

                File.Copy("C:\\Users\\User\\Documents\\Visual Studio 2013\\Projects\\Aplikacja\\Aplikacja\\bin\\Do_wypozyczenia2.txt", "C:\\Users\\User\\Documents\\Visual Studio 2013\\Projects\\Aplikacja\\Aplikacja\\bin\\Do_wypozyczenia.txt");
                File.Copy("C:\\Users\\User\\Documents\\Visual Studio 2013\\Projects\\Aplikacja\\Aplikacja\\bin\\Dostepne2.txt", "C:\\Users\\User\\Documents\\Visual Studio 2013\\Projects\\Aplikacja\\Aplikacja\\bin\\Dostepne.txt");
                //File.Delete("C:\\Users\\User\\Documents\\Visual Studio 2013\\Projects\\Aplikacja\\Aplikacja\\bin\\Do_wypozyczenia2.txt");
                //File.Delete("C:\\Users\\User\\Documents\\Visual Studio 2013\\Projects\\Aplikacja\\Aplikacja\\bin\\Dostepne2.txt");
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

        private void Button_Click_3(object sender, RoutedEventArgs e)//oddaj
        {
            try
            {
                if (!File.Exists("C:\\Users\\User\\Documents\\Visual Studio 2013\\Projects\\Aplikacja\\Aplikacja\\bin\\Wypozyczone2.txt"))
                {
                    File.CreateText("C:\\Users\\User\\Documents\\Visual Studio 2013\\Projects\\Aplikacja\\Aplikacja\\bin\\Wypozyczone2.txt");
                    Console.WriteLine("Utworzono pliki");
                }

                string co = linijka.Text; Console.WriteLine(co);
                StreamReader czytaj = new StreamReader("C:\\Users\\User\\Documents\\Visual Studio 2013\\Projects\\Aplikacja\\Aplikacja\\bin\\Wypozyczone.txt"); Console.WriteLine("1");
                StreamWriter pisz = new StreamWriter("C:\\Users\\User\\Documents\\Visual Studio 2013\\Projects\\Aplikacja\\Aplikacja\\bin\\Wypozyczone2.txt", false); Console.WriteLine("2");
                StreamWriter oddaj = new StreamWriter("C:\\Users\\User\\Documents\\Visual Studio 2013\\Projects\\Aplikacja\\Aplikacja\\bin\\Dostepne.txt", true); Console.WriteLine("3");
                string bufor = czytaj.ReadLine();
                int dzieje = 0;

                while (bufor != null)
                {
                    Console.WriteLine("Przeszukano linie " + dzieje);


                    if (bufor.StartsWith(co) & dzieje == 0)
                    {
                        dzieje++;
                        Console.WriteLine("Znaleziono");
                        oddaj.WriteLine(bufor); Console.WriteLine("oddano");
                    }
                    else
                    {
                        pisz.WriteLine(bufor);
                        Console.WriteLine("Przepisywanie");
                    }

                    bufor = czytaj.ReadLine();
                }
                pisz.Close();
                czytaj.Close();
                oddaj.Close();

                File.Delete("C:\\Users\\User\\Documents\\Visual Studio 2013\\Projects\\Aplikacja\\Aplikacja\\bin\\Wypozyczone.txt");
                File.Copy("C:\\Users\\User\\Documents\\Visual Studio 2013\\Projects\\Aplikacja\\Aplikacja\\bin\\Wypozyczone2.txt", "C:\\Users\\User\\Documents\\Visual Studio 2013\\Projects\\Aplikacja\\Aplikacja\\bin\\Wypozyczone.txt");
                //File.Delete("C:\\Users\\User\\Documents\\Visual Studio 2013\\Projects\\Aplikacja\\Aplikacja\\bin\\Wypozyczone2.txt");
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

        private void Button_Click_4(object sender, RoutedEventArgs e)
        {
            string wynik = null;
            try
            {
                StreamReader rd = new StreamReader("C:\\Users\\User\\Documents\\Visual Studio 2013\\Projects\\Aplikacja\\Aplikacja\\bin\\Do_wypozyczenia.txt");
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

