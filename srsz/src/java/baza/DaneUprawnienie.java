package baza;

import java.sql.Array;
import java.text.Format;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import org.hibernate.Session;
import java.util.Date;
import java.util.Formatter;
import java.util.List;
import org.hibernate.Query;

public class DaneUprawnienie {
    private Uprawnienie u;
    private HibernateUtil helper;
    private static Session session;
    
    public void dodajUprawnienie(String opis, Date od, Date do_, Osoby dod){
        u = new Uprawnienie(opis,od,do_,dod);
        session = helper.getSession();
        session.getTransaction().begin();
        session.save(u);
        session.getTransaction().commit();
        
    }
    
    public Uprawnienie zczytajUprawnienie(int n){
        Uprawnienie wyjscie;
        session = helper.getSession();
       
        wyjscie = (Uprawnienie) session.get(Uprawnienie.class, n);
        
        return wyjscie;
    }
    public void usunUprawnienie(int id){
        session = helper.getSession();
        session.beginTransaction();
        u = (Uprawnienie) session.get(Uprawnienie.class, id);
        session.delete(u);
        session.getTransaction().commit();
        
        
}
     public void updateUprawnienie(Uprawnienie u){
        session = helper.getSession();
        session.beginTransaction();
        session.update(u);
        session.getTransaction().commit();
        
    }
     public static List<Uprawnienie> selectUprawnienia()
    {
        session = HibernateUtil.getSession();
        Query select = session.createQuery("from Uprawnienie ");
        return select.list();
    }
     public static List<Uprawnienie> selectUprawnieniaWhere(String where){
         session = HibernateUtil.getSession();
        Query select = session.createQuery("from Uprawnienie "+where);
        return select.list();
     }
     
     public static List<String> selectUprawnienieOpis(){
         session = HibernateUtil.getSession();
        Query select = session.createQuery("select opis from Uprawnienie ");
        return select.list();
     }
    
    public boolean czyPosiadaUprawnienie(int idOsoba, int idZasob, int tryb){
        DaneOsoby dO = new DaneOsoby();
        DaneZasob dZ = new DaneZasob();
        Zasob zas = new Zasob();
        Osoby os = new Osoby();
        try{         
             os = dO.zczytajOsoba(idOsoba);
             zas = dZ.zczytajZasob(idZasob);
        } catch (Exception e){
            
        }
        
        return czyPosiadaUprawnienie(os,zas,tryb);
    }
     
    public boolean czyPosiadaUprawnienie(Osoby osoba, Zasob zasob, int tryb){
        baza.DaneUprawnienieOsoba dup = new baza.DaneUprawnienieOsoba();
        baza.DaneUprawnienieZasob duz = new baza.DaneUprawnienieZasob();
        Date dzisiaj = new Date();
        Format sdf = new SimpleDateFormat("yyy-MM-dd");
        
        List<Uprawnienie> osoby = dup.selectIdUprawnienWhere("where id_prac="+osoba.getId());

        if (osoby.size()==0) return false;
        List<Integer> listaIdUprawnien = new ArrayList<Integer>();
        for (int i=0; i<osoby.size();i++){
            if (dzisiaj.after(osoby.get(i).getObowiazuje_od()) && dzisiaj.before(osoby.get(i).getObowiazuje_do()))
                listaIdUprawnien.add(osoby.get(i).getId());
        }
        String lista1 = listaIdUprawnien.toString();
        String lista = lista1.replaceAll("\\[|\\]", "");
        
        if(listaIdUprawnien.size() ==0){
            return false;
        }
        List<Uprawnienie> zasoby = duz.selectUprawnienieWhere("where id_zasob="+zasob.getId()+" and tryb="+tryb+" and id_uprawnienie "
                + "in ("+lista+")");
        if (zasoby.size()>0) return true;
       
        return false;
    }
    public boolean czyWolnaNazwa(String nazwa){
        List<Uprawnienie> lu = this.selectUprawnieniaWhere("where opis='"+nazwa+"'");
        if (lu.size()==0) return true;
        else return false;
    }
    
    public Uprawnienie selectUprawnieniePoNazwie(String nazwa){
        List<Uprawnienie> lU = this.selectUprawnieniaWhere("where opis='"+nazwa+"'");
        if (lU.size()>0) return lU.get(0);
        else return null;
    }

    private Formatter SimpleDateFormat(String yyyMMdd) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
}
