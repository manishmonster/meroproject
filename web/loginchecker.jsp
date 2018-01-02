<%-- 
    Document   : loginchecker
    Created on : Nov 9, 2017, 10:11:33 AM
    Author     : Administrator
--%>

<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="Login.Login" %>
<%@ page import="connection.ConfigConnection" %>


<%
String pwd="";
String role="";
String userId="";
String pwd1=pwd;

String userName= request.getParameter("user");
String password= request.getParameter("pwd");
out.println(password);
ConfigConnection util=new ConfigConnection();
Login log= new Login();
log.setUserName(userName);
//out.println("userName===="+userName);
 String count=log.countUser();
//out.println("count: "+count);


if(!count.equals("1")){
	%>
    <jsp:forward page="login.jsp">
    <jsp:param name="msguser" value="Invalid Username"/>
    </jsp:forward>
    <%
	}
log.checkPwd();
pwd= log.getPwd();
role=log.getRole();
userId=log.getUserId();
//System.out.println("password==="+pwd);
//System.out.println("role==="+role);

if(!pwd.equals(password)){
	%>
    <jsp:forward page="login.jsp">
    <jsp:param name="msg" value="Incorrect Password "/>
    </jsp:forward>
	<%
	}
	else{
		if (role.equals("admin"))
		{
			
			session.setAttribute("userName",userName);
			session.setAttribute("role",role);
			session.setAttribute("userId",userId);
			session.setMaxInactiveInterval(1800);
			response.sendRedirect("admin/index.jsp");
		}
		if (role.equals("member")){
                        session.setAttribute("userName",userName);
			session.setAttribute("role",role);
			session.setAttribute("userId",userId);
			session.setMaxInactiveInterval(1800);
			response.sendRedirect("member/index.jsp");
                }
                if (role.equals("user")){
                        session.setAttribute("userName",userName);
			session.setAttribute("role",role);
			session.setAttribute("userId",userId);
			session.setMaxInactiveInterval(1800);
			response.sendRedirect("user/index.jsp");
                }
				

	}

%>