<%-- 
    Document   : header
    Created on : Oct 14, 2017, 7:59:45 AM
    Author     : Monster
--%>
<%
	if( session.getAttribute("userName")==null){%>
		<jsp:forward page="login.jsp" >
        <jsp:param name="msg" value="Session Invalid"/>
        </jsp:forward>
        <%
		}else{
        String user="";
	String username=session.getAttribute("userName").toString();%>
<%@page import="java.util.Date"%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
        <div class="col-md-10">
            <img src="image/logo.png" width="auto" height="70" alt="logo"/>
            <p>We Server to save life</p>
            <h3> Welcome <% out.print(username); %></h3>
        
        </div>
        <div class="col-md-2" id="clockbox" >
             
        </div>
        <div class="col-md-1">
          
                <a href="logout.jsp"><button class="btn btn-group">Logout</button></a>
        </div>
<% } %>