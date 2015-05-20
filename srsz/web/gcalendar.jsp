<%@page import="com.google.api.client.auth.oauth2.Credential"%>
<%@page import="com.google.api.client.googleapis.javanet.GoogleNetHttpTransport"%>
<%@page import="com.google.api.client.http.HttpTransport"%>
<%@page errorPage="/WEB-INF/error.jsp"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    HttpTransport httpTransport;

    httpTransport = GoogleNetHttpTransport.newTrustedTransport();

    // initialize the data store factory
   // dataStoreFactory = new FileDataStoreFactory(DATA_STORE_DIR);

    // authorization
    Credential credential = authorize();

    // set up global Calendar instance
    com.google.api.services.calendar.Calendar client = new com.google.api.services.calendar.Calendar.Builder(
            httpTransport, JSON_FACTORY, credential).setApplicationName(APPLICATION_NAME).build();


%>