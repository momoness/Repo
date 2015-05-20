<%@page import="java.util.ArrayList"%>
<%@page errorPage="/WEB-INF/error.jsp"%> <%@page import="java.text.Format"%>
<%@page import="baza.Rezerwacja"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.List"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

        <%
            String wyjscie;
            Format sdf = new SimpleDateFormat("yyyy-MM-dd");
           
            java.util.Date dzien = new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("dzien"));
            java.util.Date dzienzm = new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("dzientygg"));
            String dzien1 = sdf.format(dzien);
            String dzienzm1 = sdf.format(dzienzm);
            
            baza.DaneRezerwacja dr = new baza.DaneRezerwacja();
            List<Rezerwacja> rList = dr.selectString("where DATE(start)='"+dzien1+"'");
            List<Rezerwacja> rListZmieniane = dr.selectString("where DATE(start)='"+dzienzm1+"'");
            List<Rezerwacja> puste = new ArrayList();
            try{            
               int rezSize = rList.size();    
               int rezZmSize = rListZmieniane.size();
               for(int i=0; i<rezSize; i++){
                   if(rList.get(i).getKierunek().getNazwa().equals("Nie dotyczy"))
                       puste.add(rList.get(i));
                   else
                    dr.usunRezerwacja(rList.get(i).getId());
               }
               int InneSize = 0;
               for(int i=0; i<rezZmSize; i++){
                        InneSize = puste.size();
                        
                        Calendar calendar = Calendar.getInstance();
                        Calendar pobrana = Calendar.getInstance();                      
                        Calendar cal = Calendar.getInstance();
                        pobrana.setTime(dzien);
                        calendar.setTime(rListZmieniane.get(i).getStart());  
                       
                        cal.set(Calendar.YEAR, pobrana.get(Calendar.YEAR));
                        cal.set(Calendar.MONTH, pobrana.get(Calendar.MONTH));
                        cal.set(Calendar.DAY_OF_MONTH, pobrana.get(Calendar.DAY_OF_MONTH));
                        cal.set(Calendar.HOUR_OF_DAY , calendar.get(Calendar.HOUR_OF_DAY));
                        cal.set(Calendar.MINUTE , calendar.get(Calendar.MINUTE));
                        cal.set(Calendar.SECOND, calendar.get(Calendar.SECOND));
               
                        java.util.Date dzienSTART  = cal.getTime();            
                        
                        calendar.setTime(rListZmieniane.get(i).getKoniec());
                        cal.set(Calendar.HOUR_OF_DAY, calendar.get(Calendar.HOUR_OF_DAY));
                        cal.set(Calendar.MINUTE, calendar.get(Calendar.MINUTE));
                        cal.set(Calendar.SECOND, calendar.get(Calendar.SECOND));
                        
                        java.util.Date dzienKONIEC = cal.getTime();
                        baza.Rezerwacja re = new baza.Rezerwacja();
                        baza.Rezerwacja tymczasowa = rListZmieniane.get(i);
                         
                        if(!tymczasowa.getKierunek().getNazwa().equals("Nie dotyczy")){
                          if(InneSize==0)
                            dr.dodajRezerwacja(dzienSTART, dzienKONIEC, tymczasowa.getOpis(), tymczasowa.getTyp(), tymczasowa.getWlasciciel(), tymczasowa.getRezerwujacy(), tymczasowa.getId_zasob(), tymczasowa.getPowiazany(), tymczasowa.getKierunek());
                          else
                              for(int j=0;j<InneSize;j++)
                                  if(tymczasowa.getId_zasob().getId()==puste.get(j).getId_zasob().getId())
                                      if(dr.zwolnienieZajecc(tymczasowa, puste.get(j))){
                                          puste.remove(j);
                                           
                                          dr.dodajRezerwacja(dzienSTART, dzienKONIEC, tymczasowa.getOpis(), tymczasowa.getTyp(), tymczasowa.getWlasciciel(), tymczasowa.getRezerwujacy(), tymczasowa.getId_zasob(), tymczasowa.getPowiazany(), tymczasowa.getKierunek());
                                      } else dr.dodajRezerwacja(dzienSTART, dzienKONIEC, tymczasowa.getOpis(), tymczasowa.getTyp(), tymczasowa.getWlasciciel(), tymczasowa.getRezerwujacy(), tymczasowa.getId_zasob(), tymczasowa.getPowiazany(), tymczasowa.getKierunek());
                         
                        }
               }
               baza.DaneSemestr semestry = new baza.DaneSemestr();
               baza.DaneSemestrZmiany zmiany = new baza.DaneSemestrZmiany();
               zmiany.dodajSemestrZmiany(semestry.zczytajSemPoDacie(dzien, dzien), dzien, dzienzm);
               wyjscie = "Pomyślnie dodano do bazy";
            }
            catch (Exception e) {
                e.printStackTrace();
                wyjscie = "Błąd. Dodawanie danych nie powiodło się.";
                
            }
            response.setContentType("application/json");
    response.getWriter().print(wyjscie);
    out.flush();
%>