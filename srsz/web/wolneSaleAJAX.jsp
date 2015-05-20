<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.Format"%>
<%@page import="java.util.GregorianCalendar"%>
<%@page import="baza.Rezerwacja"%>
<%@page import="baza.Zasob"%>
<%@page import="java.util.List"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@taglib uri="http://java.sun.com/portlet" prefix="portlet"%>
<%@page errorPage="/WEB-INF/error.jsp"%> 

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    baza.DaneZasob daneZasob = new baza.DaneZasob();
    List<Zasob> zasobyLista = daneZasob.selectZasobySale();
    baza.DaneRezerwacja rezerw = new baza.DaneRezerwacja();
   
    %>

                <div class='lista_sal_header ui-widget ui-widget-content'>
                        <div class='lista_sal_nazwa_header ui-widget'>
                        SALE
                        </div>
                        <div class='lista_sal_elementy_header ui-widget'>
                                <div>8</div>
                                <div>9</div>
                                <div>10</div>
                                <div>11</div>
                                <div>12</div>
                                <div>13</div>
                                <div>14</div>
                                <div>15</div>
                                <div>16</div>
                                <div>17</div>
                                <div>18</div>
                                <div>19</div>
                        </div>
                </div>
            <!-- generowanie wszystkiego -->
            
          <%
            for(Zasob zas: zasobyLista) { %>   
     <div class='lista_sal_row' id="formWolneSale">  
              <div class='lista_sal_nazwa'>
                                <%=zas.getNazwa() %>
            </div>
            <div class='lista_sal_elementy'>
        <%
                Date data= GregorianCalendar.getInstance().getTime();
                if (request.getParameter("data")!=null && !request.getParameter("data").isEmpty()){
                   SimpleDateFormat sdf_data = new SimpleDateFormat("yyyy-MM-dd");
                   data = sdf_data.parse(request.getParameter("data"));
                    
                }
        
                List<Rezerwacja> rezerwacjaLista = rezerw.selectRezerwacjaZasDat(zas.getId(), data);
                for(Rezerwacja re: rezerwacjaLista){
               
    %>
         
                        
                      <%
                      
               
                        Format sdf = new SimpleDateFormat("HH:mm"); 
                      %>
                      
                            <div class='lista_sal_rezw backgr<%=re.getTyp().getId()%>' start="<%=sdf.format(re.getStart())%>" koniec="<%=sdf.format(re.getKoniec())%>">
                                        <div><%=re.getOpis()%></div>
                                        <div><%=sdf.format(re.getStart())%> - <%=sdf.format(re.getKoniec())%></div>
                                        <div><%=re.getWlasciciel().getNazwisko()%> <%=re.getWlasciciel().getImie()%></div>
                                </div>
                        
                
               
                <% }%></div></div><%} %>
               
 