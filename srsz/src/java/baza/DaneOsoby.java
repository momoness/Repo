package baza;

import java.sql.Array;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import java.util.Date;

public class DaneOsoby {
    private Osoby o;
    private HibernateUtil helper;
    private static Session session;
    
    private String imie, nazwisko, email, telefon, login;
    private int dodany;
    private Tytuly tytul;
    
    
    public void dodajOsoba(String im, String naz, Tytuly tyt, String login, String mail, String tel, int dod){
        o = new Osoby(im,naz,tyt,login,mail,tel,dod);
        session = helper.getSession();
        session.beginTransaction();
        session.save(o);
        session.getTransaction().commit();
        
    }
    
    public void dodajOsoba(){
        o = new Osoby(this.imie,this.nazwisko,this.tytul,this.login,this.email,this.telefon,this.dodany);
        session = helper.getSession();
        session.beginTransaction();
        session.save(o);
        session.getTransaction().commit();
        
    }
    
    public Osoby zczytajOsoba(int id){
        session = helper.getSession();
      
        Osoby wyjscie = (Osoby) session.get(Osoby.class, id);
        
        return wyjscie;
    }
    
    public void usunOsoba(int id){
        session = helper.getSession();
        session.beginTransaction();
        o = (Osoby) session.get(Osoby.class, id);
        session.delete(o);
        session.getTransaction().commit();
        
        
    }
    
    public void updateOsoba(Osoby o, int edit){
        o.setEdytowany(edit);
        Date edycja = new Date();
        o.setData_edycji(new Timestamp(edycja.getTime()));
        
        session = helper.getSession();
        session.beginTransaction();
        session.update(o);
        session.getTransaction().commit();
        
    }
    
    public static List<Osoby> selectOsoby()
    {
        session = HibernateUtil.getSession();        
        Query select = session.createQuery("from Osoby where id<>194 order by nazwisko");
        return select.list();
    }
    public static List<Osoby> selectOsobyBezUsera(String login){
        session = HibernateUtil.getSession();
        Query select = session.createQuery("from Osoby where login<>'"+login+"'");
        return select.list();
    }
    public String selectIDUzytkownika(String nazwa){
        session = HibernateUtil.getSession();
        Query select = session.createQuery("from Osoby where login='"+nazwa+"'");
        List<Osoby> os = select.list();
        if(os.size()>0) return Integer.toString(os.get(0).getId());
        else return "";
    }
    /*public List<Integer> selectIdPrac(){
        session = HibernateUtil.getSession();        
        Query select = session.createQuery("select id_prac from Osoby");
        return select.list();
    }*/
    
    public List<String> selectEmail(){
        session = HibernateUtil.getSession();        
        Query select = session.createQuery("select email from Osoby");
        return select.list();
    }
    
    public static Osoby selectOsobyImieNazwisko(String imie, String nazwisko){
        session = HibernateUtil.getSession();        
        Query select = session.createQuery("from Osoby where imie='"+imie+"' and nazwisko='"+nazwisko+"'");
        List<Osoby> lO = select.list();
        System.out.println(lO.size());
        return lO.get(0);
    }
    
    public Osoby znajdzPoLoginie(String login){
        session = HibernateUtil.getSession();        
        Query select = session.createQuery("from Osoby where login='"+login+"'");
        List<Osoby> lO = select.list();
        System.out.println(lO.size());
        if (lO.size()>0)
            return lO.get(0);
        if(login.compareTo("student") ==0) return null;
        return znajdzPoLoginie("student");
    }
    
}
