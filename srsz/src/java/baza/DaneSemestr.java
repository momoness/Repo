package baza;

import java.sql.Timestamp;
import java.util.Date;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;

public class DaneSemestr {
    private Semestr s;
    private static HibernateUtil helper;
    private static Session session;
 
    public void dodajSemestr(String typ, int rok, Date poczatek, Date koniec, int plan_gotowy){
        s = new Semestr(typ, rok, poczatek, koniec, plan_gotowy);
        session = helper.getSession();
        session.beginTransaction();
        session.save(s);
        session.getTransaction().commit();
        
    }
    
    public Semestr zczytajSemestr(int id){
        Semestr wyjscie = new Semestr();
        session = helper.getSession();
      
        wyjscie = (Semestr) session.get(Semestr.class, id);
        
        return wyjscie;
    }
    
    public void usunSemestr(int id){
        session = helper.getSession();
        session.beginTransaction();
         s = (Semestr) session.get(Semestr.class, id);
        session.delete(s);
        session.getTransaction().commit();
        
}
    public void updateSemestr(Semestr s){
        session = helper.getSession();
        session.beginTransaction();
        session.update(s);
        session.getTransaction().commit();
        
    }
    
    public static List<Semestr> selectSemestrZ(){
        session = HibernateUtil.getSession();
        Query select = session.createQuery("from Semestr where typ='Z' ");
        return select.list();
    }
    
    public static List<Semestr> selectSemestrL(){
        session = HibernateUtil.getSession();
        Query select = session.createQuery("from Semestr where typ='L' ");
        return select.list();
    }
    
    public static List<Semestr> selectSemestr(){
        session = HibernateUtil.getSession();
        Query select = session.createQuery("from Semestr ");
        return select.list();
    }
    public static Semestr selectTypRok(String typ, String rok){
        session = HibernateUtil.getSession();
        Query select = session.createQuery("from Semestr where typ='"+typ+"' and rok='"+rok+"'");
        List<Semestr> lS = select.list();
        if (lS.size()>0) return lS.get(0);
        else return null;
    }
    public boolean sprawdzGotowyPlan(Date start, Date koniec){
        Date data = new Date();
        session = HibernateUtil.getSession();
        Query select = session.createQuery("from Semestr");
        List<Semestr> lista = select.list();
        for (int i=0; i<lista.size(); i++){
            if (lista.size()>0){
                // rezerwacja, która rozpoczyna się lub kończy w trakcie trwającej kolidującej
                if ((start.after(lista.get(i).getPoczatek()) && start.before(lista.get(i).getKoniec()))
                        || (koniec.after(lista.get(i).getPoczatek()) && koniec.before(lista.get(i).getKoniec()))){
                            if(lista.get(i).getPlan_gotowy()==0)
                        return false;
                            else return true;}
                // zaczyna się lub kończy w tym samym czasie co trwająca kolidująca
                if ((start.equals(lista.get(i).getPoczatek())) || koniec.equals(lista.get(i).getKoniec())){
                            if(lista.get(i).getPlan_gotowy()==0)
                        return false;
                            else return true;}
                // w środku prośby jest inna rezerwacja
                if ((lista.get(i).getPoczatek().after(start) && lista.get(i).getPoczatek().before(koniec))
                        || lista.get(i).getKoniec().after(start) && lista.get(i).getKoniec().before(koniec)){
                            if(lista.get(i).getPlan_gotowy()==0)
                        return false;
                            else return true;} 
            }
        }
        return false;
    }
     
      public Semestr zczytajSemPoDacie(Date start, Date koniec){
        Date data = new Date();
        Date teraz = new Timestamp(data.getTime());
       session = HibernateUtil.getSession();
        Query select = session.createQuery("from Semestr");
        List<Semestr> lista = select.list();
        for (int i=0; i<lista.size(); i++){            
            if (lista.size()>0){
                // rezerwacja, która rozpoczyna się lub kończy w trakcie trwającej kolidującej
                if ((start.after(lista.get(i).getPoczatek()) && start.before(lista.get(i).getKoniec()))
                        || (koniec.after(lista.get(i).getPoczatek()) && koniec.before(lista.get(i).getKoniec())))
                            return lista.get(i);
                // zaczyna się lub kończy w tym samym czasie co trwająca kolidująca
                if ((start.equals(lista.get(i).getPoczatek())) || koniec.equals(lista.get(i).getKoniec()))
                            return lista.get(i);
                // w środku prośby jest inna rezerwacja
                if ((lista.get(i).getPoczatek().after(start) && lista.get(i).getPoczatek().before(koniec))
                        || lista.get(i).getKoniec().after(start) && lista.get(i).getKoniec().before(koniec))
                            return lista.get(i);
            }
        }
        return null;
    }
}
