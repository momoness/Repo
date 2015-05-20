package baza;

import java.security.Security;
import java.util.Properties;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class mail {
    static final public boolean debug = true;

static public void sendEmail(String title, String[] adresaci, String body) {
        Security.addProvider(new com.sun.net.ssl.internal.ssl.Provider());
        final String username = "ciech30";
        final String password = "ciech30!!ZESP6";
                
        Properties prop = new Properties();
        prop.put("mail.smtp.auth", "true");
        prop.put("mail.smtp.host", "158.75.2.91");
        prop.put("mail.smtp.port", "587");
        prop.put("mail.smtp.starttls.enable", true);
        prop.put("mail.smtp.ssl.trust","*");

        Session session = Session.getDefaultInstance(prop,
                new javax.mail.Authenticator() {
                    protected PasswordAuthentication getPasswordAuthentication() {
                        return new PasswordAuthentication(username, password);
                    }
                });
        //  session.setDebug(true);

        try {
            MimeMessage mm = new MimeMessage(session);
            mm.setFrom(new InternetAddress("mailer@mat.umk.pl"));
            if (debug) {
                mm.addRecipient(Message.RecipientType.TO, new InternetAddress("mrremo@mat.umk.pl"));
            } else {
                for (String to : adresaci) {
                    mm.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
                }
            }
            mm.setSubject(title);
            mm.setContent(body, "text/html; charset=UTF-8");
            mm.setHeader("Content-Type", "text/html; charset=UTF-8");
            Transport.send(mm);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
