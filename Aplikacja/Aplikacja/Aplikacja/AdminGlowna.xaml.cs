using System;
using System.Collections;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Sockets;
using System.Text;
using System.Threading;
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
    /// Interaction logic for AdminGlowna.xaml
    /// </summary>
        
    public partial class AdminGlowna : Window
    {
        serwer s = new serwer();
        int rusz = 0;
        Thread watek; 

        public AdminGlowna()
        {
            InitializeComponent();

            if (rusz == 0)
            {
                watek = new Thread(new ThreadStart(s.run));
                rusz = 1;
            }
            if (StanSerweraBox.Text != "Włączony")
                StanSerweraBox.AppendText("Włączony");           
            
        }
        

        private void Button_Click(object sender, RoutedEventArgs e)//dodaj
        {
            try
            {
                dodaj dk = new dodaj();
                dk.Show();
            }
            catch (System.InvalidOperationException exc)
            {
                Console.WriteLine("Invalid Operation", exc);
            }
        }

        private void Button_Click_1(object sender, RoutedEventArgs e)
        {
            try
            {
                DodajCzas dc = new DodajCzas();
                dc.Show();
            }
            catch (System.InvalidOperationException exc)
            {
                Console.WriteLine("Invalid opertaion", exc);
            }
        }

       
        private void Button_Click_3(object sender, RoutedEventArgs e)
        {
            try
            {
                dodajI di = new dodajI();
                di.Show();
            }
            catch (System.InvalidOperationException exc)
            {
                Console.WriteLine("Invalid Operation", exc);
            }
        }
        
        private void Button_Click_5(object sender, RoutedEventArgs e)
        {
            try
            {
                OProgramie pr = new OProgramie();
                pr.Show();
            }
            catch (System.InvalidOperationException exc)
            {
                Console.WriteLine("Invalid Opaertion", exc);
            }
        }

        private void ksiazkiB_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                PrzegladajKsiazki pzk = new PrzegladajKsiazki();
                pzk.Show();
            }
            catch (System.InvalidOperationException exc)
            {
                Console.WriteLine("Invalid Operation", exc);
            }
        }

        private void Button_Click_6(object sender, RoutedEventArgs e)
        {
            try
            {
                usunK us = new usunK();
               us.Show();
            }
            catch (System.InvalidOperationException exc)
            {
                Console.WriteLine("Invalid Operation Exception", exc);
            }
        }

        private void Button_Click_7(object sender, RoutedEventArgs e)
        {
            try
            {
                PrzegladajKsiazki pk = new PrzegladajKsiazki();
                pk.Show();
            }
            catch (System.InvalidOperationException exc)
            {
                Console.WriteLine("Inavlid operation", exc);
            }
        }

        private void Czasopisma_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                usunC uc = new usunC();
                uc.Show();
            }
            catch (System.InvalidOperationException exc)
            {
                Console.WriteLine("Invalid opertaion", exc);
            }
        }

        private void Button_Click_8(object sender, RoutedEventArgs e)
        {
            try
            {
                usunI ui = new usunI();
                ui.Show();
            }
            catch (System.InvalidOperationException exc)
            {
                Console.WriteLine("Invalid opertaion", exc);
            }
        }

        private void Button_Click_2(object sender, RoutedEventArgs e)
        {
            try
            {
                PrzeWyp pw = new PrzeWyp();
                pw.Show();
            }
            catch (System.InvalidOperationException exc)
            {
                Console.WriteLine("Invalid operation" + exc);
            }
        }

        private void zamykanie_okna(object sender, System.ComponentModel.CancelEventArgs e)
        {
          if (StanSerweraBox.Text.StartsWith("Włączony"))
            {
                MessageBoxResult res;
                res = MessageBox.Show("Serwer jest włączony\n Czy wyłączyć serwer przed wyłączeniem programu?", "Wyłączanie", MessageBoxButton.YesNo, MessageBoxImage.Warning);
                if (res == MessageBoxResult.Yes)
                {
                    s.wylaczSerwer();
                    Console.WriteLine("Wyłączanie");
                    watek.Abort();
                }
            }
        
        }

        
    }
}
