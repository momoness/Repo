package baza;

import java.sql.Statement;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.hibernate.service.ServiceRegistry;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;

public class HibernateUtil {

    private static final SessionFactory sessionFactory;
    private static Session session;
    Statement st;

    static {
        try {
            // Create the SessionFactory from standard (hibernate.cfg.xml) 
            // config file.
            Configuration conf = new Configuration();
            conf.configure();

            ServiceRegistry serviceRegistry = new StandardServiceRegistryBuilder().applySettings(conf.getProperties()).build();
            sessionFactory = conf.buildSessionFactory(serviceRegistry);
            session = sessionFactory.openSession();
            //sessionFactory = new Configuration().configure().buildSessionFactory();
        } catch (Throwable ex) {
            // Log the exception. 
            System.err.println("Initial SessionFactory creation failed." + ex);
            throw new ExceptionInInitializerError(ex);
        }
    }

    /* public static SessionFactory getSessionFactory() {
     return sessionFactory;
     }
     */
    

public static Session getSession() {
        try {
            if (!session.isOpen()||!session.isConnected()) {
                session = sessionFactory.openSession();
                System.out.println("Sesja ponownie otworzona");
            }
            try{
                session.createSQLQuery("select 1+1 ").list();
            }catch (Exception e){
                System.out.println("select się nie udał -> reconnect");
                session = sessionFactory.openSession();
            }
            return session;
        } catch (Exception e) {
            return null;
        }
    }


}
