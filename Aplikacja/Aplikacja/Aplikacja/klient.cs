using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net.Sockets;
using System.Text;
using System.Threading;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;

namespace Aplikacja
{
    class klient
    {
        
        private TcpClient  klientt = null;
        private NetworkStream netstream = null;
        public bool czy_dziala = true;
        private const int port = 1234;
        //public String czas;
        /// <summary>
        /// Wysyłanie komunikatu (informacja o zasobie do wypożyczenia) do serwera
        /// </summary>
        /// <param name="komunikat">Informacja o zasobie do wypożyczenia</param>
        public void run(String komunikat)
            {
                String host = "127.0.0.1";
                try
                {
                    klientt = new TcpClient(host, port);
                    Byte[] dane = System.Text.Encoding.ASCII.GetBytes(komunikat);

                    netstream = klientt.GetStream();
                    netstream.Write(dane, 0, dane.Length);
                    klientt.Close();
                    //Czas = DataTime.Now.ToString();
                    czy_dziala = true;
                }
                catch
                {
                    //czas = DataTime.Now.ToString()+("blad");
                    czy_dziala = false;
                    MessageBox.Show("Nie udało sie nawiązać połączenia z serwerem", "Błąd!", MessageBoxButton.OK, MessageBoxImage.Error);
                }
            }
        

        
    }
}
