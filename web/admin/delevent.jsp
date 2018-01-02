<%-- 
    Document   : doeditevent
    Created on : Jan 1, 2018, 9:24:09 PM
    Author     : Monster
--%>


<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="admin.Event" %>
<%@ page import="connection.ConfigConnection" %>
 <% 

String eventid="";


eventid=request.getParameter("id");

Event ee= new Event();
ee.setEventId(eventid);

		
		try{
			ee.deleteEvent();
			response.sendRedirect("event.jsp?msg=Event delete done");
		}
catch(Exception err){   
    
    response.sendRedirect("event.jsp?id="+eventid+"&errormsg=Error in event Deleteing");
            
            
    }
%>