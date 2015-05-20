<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.GregorianCalendar"%>
<%@page import="java.util.Date"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.Query"%>
<%@page import="baza.HibernateUtil"%>
<%@page import="baza.DaneSemestr"%>
<%@page import="baza.Semestr"%>
<%@page import="java.util.List"%>
<%@page errorPage="/WEB-INF/error.jsp"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<style>   
    #wybor_tygodnia {
        background-color: rgba(255, 255, 255, 0.95);
        border: 1px solid;
        height: 150px;
        left: 50%;
        overflow-y: scroll;
        position: absolute;
        top: 0;
        width: 400px;
        z-index: 5000;
        -webkit-transform: translateX(-50%);
        transform        : translateX(-50%);
        -ms-transform	 :translateX(-50%);
        display: none;
    }
    .wybor_tygodnia_st{
        font-weight: bold;
    }

    .wybor_tygodnia_tydzien{
        cursor:pointer;
        padding-left: 10px;
    }
</style>
<div id='wybor_tygodnia' class='wybor_tygodnia_wrapper '>
    <%
        Session ses = HibernateUtil.getSession();
        Query select = ses.createQuery("from Semestr order by rok, typ desc");
        List<Semestr> semestrList = select.list();
        Date teraz = GregorianCalendar.getInstance().getTime();
        Calendar pon = GregorianCalendar.getInstance();
        SimpleDateFormat sdf2 = new SimpleDateFormat("d MMMM Y");
        SimpleDateFormat sdf3 = new SimpleDateFormat("Y-MM-dd");
        if (pon.get(Calendar.DAY_OF_WEEK) != Calendar.MONDAY) {
            pon.add(Calendar.DAY_OF_WEEK, -pon.get(Calendar.DAY_OF_WEEK) + Calendar.MONDAY);
          
        }
        for (Semestr s : semestrList) {
          
            if (s.getKoniec().before(teraz)) {
                continue;
            }

            String typ = "";
            if (s.getTyp().compareTo("Z") == 0) {
                typ = "zimowy";
            } else {
                typ = "letni";
            }
            String rok = (s.getRok() - 1) + "/" + (s.getRok() - 2000);

    %><div class='wybor_tygodnia_st'>Semestr <%=typ%> <%=rok%></div>
    <%

        while (true) {
            String data_select = sdf3.format(pon.getTime());
            String start = sdf2.format(pon.getTime());
            if (s.getPoczatek().after(pon.getTime())) {
                start = sdf2.format(s.getPoczatek());
            }

            pon.add(Calendar.DAY_OF_WEEK, 6);
            String koniec = sdf2.format(pon.getTime());
            if (s.getKoniec().before(pon.getTime())) {
                koniec = sdf2.format(s.getKoniec());
            }
            pon.add(Calendar.DAY_OF_WEEK, 1);
    %>
    <div class='wybor_tygodnia_tydzien' data_select='<%=data_select%>'>
        <%=start%> - <%=koniec%>
    </div>      
    <%

                if (s.getKoniec().before(pon.getTime())) {
                    break;
                }

                if (pon.get(Calendar.YEAR) > 2016) {
                    break;
                }

            }
        }
    %>

</div> 
<script>
    $(document).ready(function () {
        if ($("#calendar").length == 0)
            return;
        $("#calendar .fc-toolbar .fc-center").click(function (e) {
            e.preventDefault();
            var vthis=$(this);
            window.setTimeout(function () {
                
                $("#wybor_tygodnia").css("top", vthis.offset().top + 5);
                $("#wybor_tygodnia").show('fade');
            }, 250);

        });


        $(".wybor_tygodnia_tydzien").click(function () {
            $("#calendar").fullCalendar('gotoDate', $(this).attr('data_select'));
        });

        $("body").click
                (
                        function (e)
                        {
                            //if(e.target.className !== "wybor_tygodnia_wrapper")
                            {
                                $("#wybor_tygodnia").hide();
                            }
                        }
                );


    });
</script>