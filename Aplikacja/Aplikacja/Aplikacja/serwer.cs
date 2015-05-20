using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Sockets;
using System.Text;
using System.Threading;
using System.Threading.Tasks;
using System.Windows;

namespace Aplikacja
{
    class serwer
    {
        readonly int port;
        private TcpListener serwerr = null;
        private Thread klientThread;
        private int dziala = 1;
        public int czy_dziala = 0;

        public serwer()
        {
            port = 1234; 
            IPAddress ip = IPAddress.Parse("127.0.0.1");
            this.serwerr = new TcpListener(ip, port);
            this.klientThread = new Thread(new ThreadStart(run));
            this.klientThread.Start();
        }
        /// <summary>
        /// Akceptacja klientów przez serwer
        /// </summary>
        public void run()
        { 
                try
                {
                    czy_dziala = 1;
                    this.serwerr.Start();                    
                    Console.WriteLine("Serwer rozpoczął pracę");

                    while (true)
                    {
                        TcpClient client = this.serwerr.AcceptTcpClient();
                        Thread watekKlienta = new Thread(new ParameterizedThreadStart(obsluga));
                        watekKlienta.Start(client);
                        Thread.Sleep(100);
                        if (dziala == 0) break;
                    }
                    
                }
                catch
                {
                    czy_dziala = 0;
                    MessageBox.Show("Serwer jest już włączony!!","Błąd",MessageBoxButton.OK,MessageBoxImage.Error);
                }
                finally
                {
                    this.serwerr.Stop();
                }
                
            }
        /// <summary>
        /// Pobranie komunikatu od klienta
        /// </summary>
        /// <param name="client"></param>
        private void obsluga(object client)
        {
            TcpClient tcpKlient = (TcpClient)client;
            NetworkStream klientStream = tcpKlient.GetStream();

            byte[] komunikat = new byte[4096];
            String wynik = string.Empty;
            int przeczytano;

            while (true)
            {
                przeczytano = 0;
                try
                {
                    przeczytano = klientStream.Read(komunikat, 0, 4096);
                }
                catch
                {
                    break;
                }
                if (przeczytano == 0) break;

                wynik = System.Text.Encoding.ASCII.GetString(komunikat);
                if (wynik.StartsWith("koniec@"))
                {
                    dziala = 0;
                    break;
                }
                else
                {
                    string obiekt = string.Empty;
                    int i = 0;
                    while (wynik[i] != '@')
                    {
                        obiekt += wynik[i++];
                    }
                    wypozycz(obiekt);
                }
                if (dziala == 0) break;
            }
            tcpKlient.Close();
        }
        /// <summary>
        /// Wypożyczanie zasoby klientowi
        /// </summary>
        /// <param name="co">Przedmiot do wypożyczenia</param>
        private void wypozycz(string co)
        {
            if (!File.Exists("C:\\Users\\User\\Documents\\Visual Studio 2013\\Projects\\Aplikacja\\Aplikacja\\bin\\Do_wypozyczenia.txt"))
            {
                File.CreateText("C:\\Users\\User\\Documents\\Visual Studio 2013\\Projects\\Aplikacja\\Aplikacja\\bin\\Do_wypozyczenia.txt");
            }
            StreamWriter pisz = new StreamWriter("C:\\Users\\User\\Documents\\Visual Studio 2013\\Projects\\Aplikacja\\Aplikacja\\bin\\Do_wypozyczenia.txt", true);

            pisz.WriteLine("-"+co);
            pisz.Close();
        }
        /// <summary>
        /// Wyłączanie serwera
        /// </summary>
        public void wylaczSerwer()
        {
            TcpClient tcpKlient = new TcpClient("127.0.0.1", 1234);
            Byte[] wiadomosc = System.Text.Encoding.ASCII.GetBytes("koniec@");

            NetworkStream strumien = tcpKlient.GetStream();
            try
            {
                strumien.Write(wiadomosc, 0, wiadomosc.Length);
            }
            catch
            {
                MessageBox.Show("Nie udalo sie zamknac serwera");
            }
        }
        }
                
    }


