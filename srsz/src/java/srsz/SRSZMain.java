package srsz;

import baza.HibernateUtil;
import java.io.IOException;
import java.util.Enumeration;
import javax.portlet.GenericPortlet;
import javax.portlet.PortletException;
import javax.portlet.PortletRequestDispatcher;
import javax.portlet.RenderRequest;
import javax.portlet.RenderResponse;
import javax.portlet.ResourceRequest;
import javax.portlet.ResourceResponse;
import org.hibernate.Session;

public class SRSZMain extends GenericPortlet {

    public void doView(RenderRequest request, RenderResponse response) throws PortletException, IOException {
        Enumeration<String> pnames=request.getParameterNames();
        System.out.println("Parametry");
        while (pnames.hasMoreElements()){
            String p=pnames.nextElement();
            System.out.println(p+" == "+request.getParameter(p));
        }
        System.out.println("=========");
       
        
        String jsp = "/kalendar.jsp";
        if (request.getParameter("jspPage")!=null&&!request.getParameter("jspPage").isEmpty()){
            jsp=request.getParameter("jspPage");
        }
        response.setContentType("text/html");
        PortletRequestDispatcher dispatcher
                = getPortletContext().getRequestDispatcher(jsp);
        dispatcher.include(request, response);

    }

    @Override
    public void serveResource(ResourceRequest request, ResourceResponse response) throws PortletException, IOException {
     Enumeration<String> pnames=request.getParameterNames();
        System.out.println("Parametry (SR)");
        while (pnames.hasMoreElements()){
            String p=pnames.nextElement();
            System.out.println(p+" == "+request.getParameter(p));
        }
        System.out.println("=========");
       
        
        String jsp = "/kalendar.jsp";
        if (request.getParameter("jspPage")!=null&&!request.getParameter("jspPage").isEmpty()){
            jsp=request.getParameter("jspPage");
        }
        response.setContentType("text/html");
        PortletRequestDispatcher dispatcher
                = getPortletContext().getRequestDispatcher(jsp);
        dispatcher.include(request, response);
    }

    @Override
    public void destroy() {
        Session s=HibernateUtil.getSession();
        if (s!=null){
            s.close();
        }
        super.destroy(); //To change body of generated methods, choose Tools | Templates.
    }
    
    
    

}
