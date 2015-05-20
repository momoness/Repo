<%@page import="com.liferay.portal.model.User"%>
<%@page import="com.liferay.portal.util.PortalUtil"%>
<%@page import="java.util.Enumeration"%>
<%@ page isErrorPage="true" import="java.io.*" %>
<%@page import="java.io.IOException"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.io.StringWriter"%>
<%@page import="java.util.GregorianCalendar"%>
<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<portlet:defineObjects />
<%
	StringWriter str = new StringWriter();
	String message = "";
	PrintWriter writer = new PrintWriter(str);
	try
	{
		exception.printStackTrace(writer);
		message = str.getBuffer().toString();
	}
	finally
	{
		try
		{
			str.close();
			writer.close();
		}
		catch (Exception e)
		{
		}
	}
	String parametry = "";
	Enumeration<String> pns = request.getParameterNames();
	while (pns.hasMoreElements())
	{
		String pn = pns.nextElement();
		String v = request.getParameter(pn);
		parametry += pn + " :: " + v + "<br/>";
		parametry+="<br/>";
		User u=PortalUtil.getUser(request);
		if (u==null){
			parametry+="User: null<br/>";
		}
		else{
			parametry+="User: "+u+"<br/>";
		}
	}
	try
	{
		//ErrorRaport.ErrorRaport(message, parametry);
	}
	catch (Exception e)
	{

	}

%>

<%-- Exception Handler --%>
<%-- ## --%>
<div class="portlet-msg-error">
    There was an error processing your request. Please try later.
</div>
<br/>
<div id='error_raport_a'>
	<a href='javascript:void(0)' onClick='$("#error_raport_a").hide();
			$("#error_raport_div").show()'>Show full raport</a>
</div>
<div id="error_raport_div" style='display: none'>
	<div class="portlet-msg-error">
		<%=message%>
	</div>
</div>