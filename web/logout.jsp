<%
	session.removeAttribute("name");
	session.removeAttribute("role");
	session.removeAttribute("userId");
	session.invalidate();
%>
<jsp:forward page="login.jsp">
<jsp:param name="success_mesg" value="Successfully Logout"/>
</jsp:forward>