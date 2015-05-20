<%
    Integer user = Integer.parseInt(request.getParameter("user"));
    Integer zasob = Integer.parseInt(request.getParameter("zasob"));
    
    baza.DaneUprawnienie dUprawnienie = new baza.DaneUprawnienie();
%>
{"zaoczne":"<%=dUprawnienie.czyPosiadaUprawnienie(user, zasob, 12)%>","stacjonarne":"<%=dUprawnienie.czyPosiadaUprawnienie(user, zasob, 11)%>","specjalne":"<%=dUprawnienie.czyPosiadaUprawnienie(user, zasob, 2)%>"}