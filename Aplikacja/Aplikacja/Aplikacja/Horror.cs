using Microsoft.Win32;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Controls;

namespace Aplikacja
{
    class Horror : Ksiazka
    {
        /// <summary>
        /// Funkcja odpowiedzialna za dodanie zasobu do zbiorów
        /// </summary>
        /// <param name="tyt"></param>
        /// <param name="aut"></param>
        /// <param name="im"></param>
        public void dodaj(string tyt, string aut, string im)
        {
            try
            {

                if (!File.Exists("C:\\Users\\User\\Documents\\Visual Studio 2013\\Projects\\Aplikacja\\Aplikacja\\bin\\Horrory.txt"))
                {
                    File.CreateText("C:\\Users\\User\\Documents\\Visual Studio 2013\\Projects\\Aplikacja\\Aplikacja\\bin\\Horrory.txt");
                }

                StreamWriter pisz = new StreamWriter("C:\\Users\\User\\Documents\\Visual Studio 2013\\Projects\\Aplikacja\\Aplikacja\\bin\\Horrory.txt", true);
                StreamWriter pisz2 = new StreamWriter("C:\\Users\\User\\Documents\\Visual Studio 2013\\Projects\\Aplikacja\\Aplikacja\\bin\\Dostepne.txt", true);

                if (tyt != null)
                {
                    pisz.WriteLine(tyt + " " + aut + " " + im);
                    pisz.Close();
                    pisz2.WriteLine(tyt + " " + aut + " " + im);
                    pisz2.Close();
                }
                else
                {
                    blad bl = new blad();
                    bl.Show();
                }
            }
            catch (System.InvalidOperationException exc)
            {
                Console.WriteLine("Invalid Opertaion", exc);
            }
            catch (System.ArgumentNullException exc)
            {
                Console.WriteLine("Argument Null", exc);
            }
            catch (System.IO.IOException exc)
            {
                Console.WriteLine("IOE", exc);
            }
            catch (System.FormatException exc)
            {
                Console.WriteLine("Format", exc);
            }
        }
        /// <summary>
        /// Funkcja odpowiedzialna za usuniecie zasobu ze zbiorow
        /// </summary>
        /// <param name="tyt"></param>
        /// <returns></returns>
        public int usun(string tyt)
        {
            int dzieje = 0;
            try
            {
                if (!File.Exists("C:\\Users\\User\\Documents\\Visual Studio 2013\\Projects\\Aplikacja\\Aplikacja\\bin\\Horrory.txt"))
                    File.CreateText("C:\\Users\\User\\Documents\\Visual Studio 2013\\Projects\\Aplikacja\\Aplikacja\\bin\\Horrory2.txt");

                StreamWriter pisz = new StreamWriter("C:\\Users\\User\\Documents\\Visual Studio 2013\\Projects\\Aplikacja\\Aplikacja\\bin\\Horrory2.txt", true);
                StreamReader czytaj = new StreamReader("C:\\Users\\User\\Documents\\Visual Studio 2013\\Projects\\Aplikacja\\Aplikacja\\bin\\Horrory.txt");

                string bufor = "a";

                bufor = czytaj.ReadLine();

                while (bufor != null)
                {
                    Console.WriteLine("Przeszukano linie " + dzieje);


                    if (bufor.StartsWith(tyt) & dzieje == 0)
                    {
                        dzieje++;
                        Console.WriteLine("Znaleziono");
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

                File.Delete("C:\\Users\\User\\Documents\\Visual Studio 2013\\Projects\\Aplikacja\\Aplikacja\\bin\\Horrory.txt");

                if (!File.Exists("C:\\Users\\User\\Documents\\Visual Studio 2013\\Projects\\Aplikacja\\Aplikacja\\bin\\Horrory.txt"))
                {
                    Console.WriteLine("Usuwanie pliku 1 powiodlo sie");

                    File.Copy("C:\\Users\\User\\Documents\\Visual Studio 2013\\Projects\\Aplikacja\\Aplikacja\\bin\\Horrory2.txt", "C:\\Users\\User\\Documents\\Visual Studio 2013\\Projects\\Aplikacja\\Aplikacja\\bin\\Horrory.txt");
                    Console.WriteLine("Kopiowanie powiodlo sie");
                    File.Delete("C:\\Users\\User\\Documents\\Visual Studio 2013\\Projects\\Aplikacja\\Aplikacja\\bin\\Horrory.txt");
                    if (!File.Exists("C:\\Users\\User\\Documents\\Visual Studio 2013\\Projects\\Aplikacja\\Aplikacja\\bin\\Horrory.txt"))
                    {
                        Console.WriteLine("Usuwanie pliku 2 powiodlo sie");
                    }
                }

            }
            catch (System.InvalidOperationException exc)
            {
                Console.WriteLine("Invalid Operation", exc);
            }
            catch (System.UnauthorizedAccessException exc)
            {
                Console.WriteLine("Unathorized Access", exc);
            }
            catch (System.ArgumentException exc)
            {
                Console.WriteLine("Argument", exc);
            }
            catch (System.IO.PathTooLongException exc)
            {
                Console.WriteLine("Path too long", exc);
            }
            catch (System.IO.DirectoryNotFoundException exc)
            {
                Console.WriteLine("Directory not found", exc);
            }
            catch (System.NotSupportedException exc)
            {
                Console.WriteLine("Not Supported", exc);
            }
            catch (System.OutOfMemoryException exc)
            {
                Console.WriteLine("Out of memory", exc);
            }
            catch (System.IO.IOException exc)
            {
                Console.WriteLine("IO", exc);
            }
            return dzieje;
        }
        /// <summary>
        /// Funkcja odpowiedzialna za wyszukanie zasobu w zbiorach
        /// </summary>
        /// <param name="tytull"></param>
        /// <returns></returns>
        public string szukaj(string tytull)
        {

            string wynik = null;
            try
            {
                StreamReader rd = new StreamReader("C:\\Users\\User\\Documents\\Visual Studio 2013\\Projects\\Aplikacja\\Aplikacja\\bin\\Horrory.txt");
                string bufor = "a";



                while (bufor != null)
                {
                    if (bufor.StartsWith(tytull))
                    {
                        wynik = bufor;
                        bufor = null;
                    }
                    bufor = rd.ReadLine();
                }
                rd.Close();



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
            return wynik;
        }
        /// <summary>
        /// Funkcja odpowiedzialna za wypisanie zasobow do RichTextBoxa
        /// </summary>
        /// <param name="blok"></param>
        public void wypisz(RichTextBox blok)
        {
            StreamReader rd = new StreamReader("C:\\Users\\User\\Documents\\Visual Studio 2013\\Projects\\Aplikacja\\Aplikacja\\bin\\Horrory.txt");
            string bufor;

            bufor = rd.ReadLine();

            while (bufor != null)
            {
                blok.AppendText(bufor);
                blok.AppendText("\n");
                bufor = rd.ReadLine();
            }
            rd.Close();

        }


    }
}
