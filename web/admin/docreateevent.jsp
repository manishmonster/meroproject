<%-- 
    Document   : doeditevent
    Created on : Jan 1, 2018, 9:24:09 PM
    Author     : Monster
--%>


<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="admin.Event" %>
<%@ page import="connection.ConfigConnection" %>
 <% 
String eventName="";
String eventDesc="";
String eventLocation="";
String eventDate="";

String eventTime="";


eventName=request.getParameter("eventname");
eventDesc=request.getParameter("eventdesc");
eventLocation=request.getParameter("eventloaction");
eventDate=request.getParameter("eventdate");
eventTime=request.getParameter("eventtime");
if(eventName.equals("") || eventDesc.equals("") || eventLocation.equals("") || eventDate.equals("") || eventTime.equals("") ){
    response.sendRedirect("editevent.jsp?errormsg=Plesae fill out all field");
}
Event ee= new Event();

ee.setEventName(eventName);
ee.setEventLocation(eventLocation);
ee.setEventDate(eventDate);
ee.setEventTime(eventTime);
ee.setEventDesc(eventDesc);

		
		try{
			ee.addEvent();
			response.sendRedirect("event.jsp?msg=Event add done");
		}
catch(Exception err){   
    
    response.sendRedirect("event.jsp?errormsg=Error in event adding");
            
            
    }
%>