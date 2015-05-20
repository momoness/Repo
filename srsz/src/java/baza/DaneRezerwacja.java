package baza;

import java.sql.Timestamp;
import java.text.Format;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
 import java.util.Date;
 import java.util.List;
 import org.hibernate.Query;
 import org.hibernate.Session;

public class DaneRezerwacja {
    private Rezerwacja r;
    private HibernateUtil helper;
    private static Session session;
    
    public DaneRezerwacja(){}
    
    public void dodajRezerwacja(Date start, Date koniec, String opis, RezerwacjaTyp typ, 
            Osoby wlasciciel, Osoby rezerwujacy, Zasob id_zasob, 
            Integer powiazany, Kierunek kierunek){
                
        r = new Rezerwacja(start, koniec, opis, typ, wlasciciel,
                rezerwujacy, id_zasob, powiazany,kierunek);
        session = helper.getSession();
        session.getTransaction().begin();
        session.save(r);
        session.getTransaction().commit();
        
    }
    public void dodajRezerwacjaWykl(Date start, Date koniec, String opis, RezerwacjaTyp typ, 
            Osoby wlasciciel, Osoby rezerwujacy, Zasob id_zasob){
                
         r = new Rezerwacja(start, koniec, opis, typ, wlasciciel,
                rezerwujacy, id_zasob);
        session = helper.getSession();
        session.beginTransaction();
        session.save(r);
        session.getTransaction().commit();
        
    }
    
    public Rezerwacja zczytajRezerwacja(int id){
        Rezerwacja wyjscie = new Rezerwacja();
        session = helper.getSession();
        wyjscie = (Rezerwacja) session.get(Rezerwacja.class, id);
        
        return wyjscie;
    }
    public void usunRezerwacja(int id){
        session = helper.getSession();
        session.beginTransaction();        
        r = (Rezerwacja) session.get(Rezerwacja.class, id);
        session.delete(r);
        session.getTransaction().commit();
        
    }
     
    public void updateRezerwacja(Rezerwacja r){
        Date edycja = new Date();
        r.setData_edycji(new Timestamp(edycja.getTime()));
        session = helper.getSession();
        session.beginTransaction();
        session.update(r);
        session.getTransaction().commit();
        
    }
	
    public static List<Rezerwacja> selectRezerwacja()
    {
        session = HibernateUtil.getSession();
        Query select = session.createQuery("from Rezerwacja ");
        return select.list();
    }
   
    
    public List<Rezerwacja> selectRezerwacja(int zas){
        session = HibernateUtil.getSession();
        Query select = session.createQuery("from Rezerwacja where id_zasob="+zas);
        return select.list();
    }
    
    public List<Rezerwacja> selectString(String s){
        session = HibernateUtil.getSession();
        Query select = session.createQuery("from Rezerwacja "+s);
        return select.list();
    }
    

    public Rezerwacja znajdzRezerwacjePoZasobie(Date start, int zas){
        List<Rezerwacja> rezList = this.selectString("where start="+start+" and id_zasob="+zas);
        if (rezList.size()>0)
            return rezList.get(0);
        else return null;
    }
    
    
     public List<Rezerwacja> selectRezerwacjawlasc(int wlasc){
        session = HibernateUtil.getSession();
        Query select = session.createQuery("from Rezerwacja where wlasciciel="+wlasc);
        return select.list();
    }
     
     
     
      public List<Rezerwacja> selectRezerwacjamojwlasc(int wlasc){
        session = HibernateUtil.getSession();
        Query select = session.createQuery("from Rezerwacja where wlasciciel="+wlasc);
        return select.list();
    }
      
      
       public List<Rezerwacja> selectRezerwacjapotyp(int typ){
        session = HibernateUtil.getSession();
        Query select = session.createQuery("from Rezerwacja where typ="+typ);
        return select.list();
    }
     
     
     
     
     public List<Rezerwacja> selectRezerwacjakier(int kier){
        session = HibernateUtil.getSession();
        Query select = session.createQuery("from Rezerwacja where kierunek="+kier);
        return select.list();
    }

     
    
    public boolean sprwadzDostepnasc(Date start, Date koniec, Zasob zasob, Osoby osoba){
        Date data = new Date();
        Date teraz = new Timestamp(data.getTime());
        Format sdf = new SimpleDateFormat("yyyy-MM-dd");
        String st = sdf.format(start);
        List<Rezerwacja> lista = this.selectString("where (id_zasob="+zasob.getId()+" or wlasciciel="+osoba.getId()+") and DATEDIFF(start,'"+st+"')=0");
        for (int i=0; i<lista.size(); i++){
            // prośba o rezerwację w przeszłości
            if (start.before(teraz) || koniec.before(teraz)) return false;
            
            if (lista.size()>0){
                // rezerwacja, która rozpoczyna się lub kończy w trakcie trwającej kolidującej
                if ((start.after(lista.get(i).getStart()) && start.before(lista.get(i).getKoniec()))
                        || (koniec.after(lista.get(i).getStart()) && koniec.before(lista.get(i).getKoniec())))
                    return false;
                // zaczyna się lub kończy w tym samym czasie co trwająca kolidująca
                if ((start.equals(lista.get(i).getStart())) || koniec.equals(lista.get(i).getKoniec()))
                    return false;
                // w środku prośby jest inna rezerwacja
                if ((lista.get(i).getStart().after(start) && lista.get(i).getStart().before(koniec))
                        || lista.get(i).getKoniec().after(start) && lista.get(i).getKoniec().before(koniec))
                    return false;
            }
        }
        return true;
    }
    public boolean sprwadzDostepnascEdycji(Date start, Date koniec, Zasob zasob, Osoby osoba, Integer idRezerwacji){
        Date data = new Date();
        Date teraz = new Timestamp(data.getTime());
        Format sdf = new SimpleDateFormat("yyyy-MM-dd");
        String st = sdf.format(start);
        List<Rezerwacja> lista = this.selectString("where (id_zasob="+zasob.getId()+" or wlasciciel="+osoba.getId()+") and DATEDIFF(start,'"+st+"')=0");
        //System.out.println(lista.size());
        for (int i=0; i<lista.size(); i++){
            // prośba o rezerwację w przeszłości
            if (start.before(teraz) || koniec.before(teraz)) return false;
            
            if (lista.size()>0){
                //System.out.println(!(lista.get(i).getId()==idRezerwacji)+"&&(("+start.after(lista.get(i).getStart())+")&&"+start.before(lista.get(i).getKoniec())+")||("+koniec.after(lista.get(i).getStart())+" &&"+koniec.before(lista.get(i).getKoniec())+")))");
                //System.out.println(start.toString()+" "+lista.get(i).getKoniec().toString());
// rezerwacja, która rozpoczyna się lub kończy w trakcie trwającej kolidującej
                if (!(lista.get(i).getId()==idRezerwacji) && ((start.after(lista.get(i).getStart()) && start.before(lista.get(i).getKoniec()))
                        || (koniec.after(lista.get(i).getStart()) && koniec.before(lista.get(i).getKoniec()))))
                    return false;
                // zaczyna się lub kończy w tym samym czasie co trwająca kolidująca
                if (!(lista.get(i).getId()==idRezerwacji) &&((start.equals(lista.get(i).getStart())) || koniec.equals(lista.get(i).getKoniec())))
                    return false;
                // w środku prośby jest inna rezerwacja
                if (!(lista.get(i).getId()==idRezerwacji) &&((lista.get(i).getStart().after(start) && lista.get(i).getStart().before(koniec))
                        || lista.get(i).getKoniec().after(start) && lista.get(i).getKoniec().before(koniec)))
                    return false;
            }
        }
        return true;
    }
    
    
      public List<Rezerwacja> selectRezerwacjaZasDat(int zas,Date da){
        List<Rezerwacja> lista = this.selectRezerwacja(zas);
        Format sdf = new SimpleDateFormat("yyyy-MM-dd");
        String a,b;
        List<Rezerwacja> lista2 = new ArrayList();
        b = sdf.format(da);
        for(int i=0;i<lista.size();i++){
            a = sdf.format(lista.get(i).getStart());
            if((a.compareTo(b) == 0))
                lista2.add(lista.get(i));
        }
        return lista2;
    }
      
    public void zwolnienieZajec(Date start, Date koniec, Osoby osoba){
        Date data = new Date();
        Date teraz = new Timestamp(data.getTime());
        List<Rezerwacja> lista = this.selectString("where wlasciciel="+osoba.getId());
        DaneRezerwacja d = new DaneRezerwacja();
        
        for (int i=0; i<lista.size(); i++){            
            if (lista.size()>0){
                // rezerwacja, która rozpoczyna się lub kończy w trakcie trwającej kolidującej
                if ((start.after(lista.get(i).getStart()) && start.before(lista.get(i).getKoniec()))
                        || (koniec.after(lista.get(i).getStart()) && koniec.before(lista.get(i).getKoniec())))
                            d.usunRezerwacja(lista.get(i).getId());
                // zaczyna się lub kończy w tym samym czasie co trwająca kolidująca
                if ((start.equals(lista.get(i).getStart())) || koniec.equals(lista.get(i).getKoniec()))
                            d.usunRezerwacja(lista.get(i).getId());
                // w środku prośby jest inna rezerwacja
                if ((lista.get(i).getStart().after(start) && lista.get(i).getStart().before(koniec))
                        || lista.get(i).getKoniec().after(start) && lista.get(i).getKoniec().before(koniec))
                            d.usunRezerwacja(lista.get(i).getId());
            }
        }
    }
    public boolean zwolnienieZajecc(Rezerwacja rez1, Rezerwacja rez2){
        Date data = new Date();
        Date teraz = new Timestamp(data.getTime());
        DaneRezerwacja d = new DaneRezerwacja();
        
        
                // rezerwacja, która rozpoczyna się lub kończy w trakcie trwającej kolidującej
                if ((rez1.getStart().after(rez2.getStart()) && rez1.getStart().before(rez2.getKoniec()))
                        || (rez1.getKoniec().after(rez2.getStart()) && rez1.getKoniec().before(rez2.getKoniec()))){
                            d.usunRezerwacja(rez2.getId());
                            return true;
                }
                // zaczyna się lub kończy w tym samym czasie co trwająca kolidująca
                if ((rez1.getStart().equals(rez2.getStart())) || rez1.getKoniec().equals(rez2.getKoniec())){
                            d.usunRezerwacja(rez2.getId());
                            return true;
                }
                // w środku prośby jest inna rezerwacja
                if ((rez2.getStart().after(rez1.getStart()) && rez2.getStart().before(rez1.getKoniec()))
                        || rez2.getKoniec().after(rez1.getStart()) && rez2.getKoniec().before(rez1.getKoniec())){
                            d.usunRezerwacja(rez2.getId());
                            return true;
                }
            return false;
        
    }
    public void zwolnienieZajec(Date start, Date koniec){
        Date data = new Date();
        Date teraz = new Timestamp(data.getTime());
        List<Rezerwacja> lista = this.selectString("");
        DaneRezerwacja d = new DaneRezerwacja();
        
        for (int i=0; i<lista.size(); i++){            
            if (lista.size()>0){
                // rezerwacja, która rozpoczyna się lub kończy w trakcie trwającej kolidującej
                if ((start.after(lista.get(i).getStart()) && start.before(lista.get(i).getKoniec()))
                        || (koniec.after(lista.get(i).getStart()) && koniec.before(lista.get(i).getKoniec())))
                            d.usunRezerwacja(lista.get(i).getId());
                // zaczyna się lub kończy w tym samym czasie co trwająca kolidująca
                if ((start.equals(lista.get(i).getStart())) || koniec.equals(lista.get(i).getKoniec()))
                            d.usunRezerwacja(lista.get(i).getId());
                // w środku prośby jest inna rezerwacja
                if ((lista.get(i).getStart().after(start) && lista.get(i).getStart().before(koniec))
                        || lista.get(i).getKoniec().after(start) && lista.get(i).getKoniec().before(koniec))
                            d.usunRezerwacja(lista.get(i).getId());
            }
        }
    }
}
