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
    /// Interaction logic for PrzegladajKsiazki.xaml
    /// </summary>
    public partial class PrzegladajKsiazki : Window
    {
        public PrzegladajKsiazki()
        {
            InitializeComponent();
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            if (ksiazkiRB.IsChecked == true)
            {
                boxx.CaretBrush = Brushes.Red;
                //boxx.FontSize = 14.0;
                //boxx.FontWeight = FontWeights.Bold;
                boxx.AppendText("Tytul Nazwisko Imie Autora");
                boxx.AppendText("\n");
                
                //boxx.CaretBrush = Brushes.White;
                Dramat obiekt = new Dramat();
                Fantasy obiekt1 = new Fantasy();
                Hist obiekt2 = new Hist();
                Horror obiekt3 = new Horror();
                Inne obiekt4 = new Inne();
                Komedia obiekt5 = new Komedia();
                Kuchnia obiekt6= new Kuchnia();
                LPiekna obiekt7 = new LPiekna();
                Militaria obiekt8 = new Militaria();
                Nauka obiekt9 = new Nauka();
                Podreczniki obiekt10 = new Podreczniki();
                Powiesc obiekt11 = new Powiesc();
                Przyg obiekt12 = new Przyg();
                Religijne obiekt13 = new Religijne();
                Romans obiekt14 = new Romans();
                Sensacja obiekt15 = new Sensacja();
                Sport obiekt16 = new Sport();
                
                obiekt.wypisz(boxx);
                obiekt1.wypisz(boxx);
                obiekt2.wypisz(boxx);
                obiekt3.wypisz(boxx);
                obiekt4.wypisz(boxx);
                obiekt5.wypisz(boxx);
                obiekt6.wypisz(boxx);
                obiekt7.wypisz(boxx);
                obiekt8.wypisz(boxx);
                obiekt9.wypisz(boxx);
                obiekt10.wypisz(boxx);
                obiekt11.wypisz(boxx);
                obiekt12.wypisz(boxx);
                obiekt13.wypisz(boxx);
                obiekt14.wypisz(boxx);
                obiekt15.wypisz(boxx);
                obiekt16.wypisz(boxx);
                boxx.AppendText("~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~");
                boxx.AppendText("\n");
            }
            else if (czasRB.IsChecked == true)
            {
                boxx.AppendText("Id Tytul Rok Numer");
                boxx.AppendText("\n");
                Czasopismo obiekt = new Czasopismo();
                obiekt.wypisz(boxx);
                boxx.AppendText("~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~");
                boxx.AppendText("\n");
            }
            else if (inneRB.IsChecked == true)
            {
                boxx.AppendText("Tytul Nazwisko Imie Autora Rok");
                boxx.AppendText("\n");
                Album ob = new Album();
                Kalendarz ob1 = new Kalendarz();
                Mapy ob2 = new Mapy();
                Atlasy ob3 = new Atlasy();
                Przewodnik ob4 = new Przewodnik();
                ob.wypisz(boxx);
                ob1.wypisz(boxx);
                ob2.wypisz(boxx);
                ob3.wypisz(boxx);
                ob4.wypisz(boxx);
                boxx.AppendText("~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~");
                boxx.AppendText("\n");
            }
            else
            {
                boxx.AppendText("Tytul Nazwisko Imie Autora");
                boxx.AppendText("\n");
                Dramat obiekt = new Dramat();
                Fantasy obiekt1 = new Fantasy();
                Hist obiekt2 = new Hist();
                Horror obiekt3 = new Horror();
                Inne obiekt4 = new Inne();
                Komedia obiekt5 = new Komedia();
                Kuchnia obiekt6 = new Kuchnia();
                LPiekna obiekt7 = new LPiekna();
                Militaria obiekt8 = new Militaria();
                Nauka obiekt9 = new Nauka();
                Podreczniki obiekt10 = new Podreczniki();
                Powiesc obiekt11 = new Powiesc();
                Przyg obiekt12 = new Przyg();
                Religijne obiekt13 = new Religijne();
                Romans obiekt14 = new Romans();
                Sensacja obiekt15 = new Sensacja();
                Sport obiekt16 = new Sport();
                obiekt.wypisz(boxx);
                obiekt1.wypisz(boxx);
                obiekt2.wypisz(boxx);
                obiekt3.wypisz(boxx);
                obiekt4.wypisz(boxx);
                obiekt5.wypisz(boxx);
                obiekt6.wypisz(boxx);
                obiekt7.wypisz(boxx);
                obiekt8.wypisz(boxx);
                obiekt9.wypisz(boxx);
                obiekt10.wypisz(boxx);
                obiekt11.wypisz(boxx);
                obiekt12.wypisz(boxx);
                obiekt13.wypisz(boxx);
                obiekt14.wypisz(boxx);
                obiekt15.wypisz(boxx);
                obiekt16.wypisz(boxx);
                boxx.AppendText("~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~");
                boxx.AppendText("\n");
                boxx.AppendText("Id Tytul Rok Numer");
                boxx.AppendText("\n");
                Czasopismo obiekt17 = new Czasopismo();
                obiekt17.wypisz(boxx);
                boxx.AppendText("~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~");
                boxx.AppendText("\n");
                boxx.AppendText("Tytul Nazwisko Imie Autora Rok");
                boxx.AppendText("\n");
                Album ob = new Album();
                Kalendarz ob1 = new Kalendarz();
                Mapy ob2 = new Mapy();
                Atlasy ob3 = new Atlasy();
                Przewodnik ob4 = new Przewodnik();
                ob.wypisz(boxx);
                ob1.wypisz(boxx);
                ob2.wypisz(boxx);
                ob3.wypisz(boxx);
                ob4.wypisz(boxx);
                boxx.AppendText("~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~");
                boxx.AppendText("\n");
            }
        }

        private void Button_Click_1(object sender, RoutedEventArgs e)//wyjdz
        {
            this.Close();
        }

        private void Button_Click_2(object sender, RoutedEventArgs e)//wyszukaj
        {
            try
            {
                Wyszukaj szukaj = new Wyszukaj();
                szukaj.Show();

            }
            catch (System.InvalidOperationException exc)
            {
                Console.WriteLine("Invalid Opertaion", exc);
;            }
        }

        private void Button_Click_3(object sender, RoutedEventArgs e)
        {
            try
            {
                usunK us = new usunK();
                us.Show();
            }
            catch (System.InvalidOperationException exc)
            {
                Console.WriteLine("System Inavlid Opertaion", exc);
            }
        }

        private void Button_Click_4(object sender, RoutedEventArgs e)
        {
            this.Close();
        }

        private void Button_Click_5(object sender, RoutedEventArgs e)
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

        private void Button_Click_6(object sender, RoutedEventArgs e)
        {
            try
            {
                usunC dc = new usunC();
                dc.Show();
            }
            catch (System.InvalidOperationException exc)
            {
                Console.WriteLine("Invalid opertaion", exc);
                
            }
        }

        private void Button_Click_7(object sender, RoutedEventArgs e)
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

        private void Button_Click_9(object sender, RoutedEventArgs e)
        {
            try
            {
                dodaj dod = new dodaj();
                dod.Show();
            }
            catch (System.InvalidOperationException exc)
            {
                Console.WriteLine("Invalid opertaion", exc);
            }
        }
    }
}
