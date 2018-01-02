<%-- 
    Document   : welcome
    Created on : Nov 8, 2017, 8:56:25 PM
    Author     : Monster
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>BloodLife</title>
        <link rel="stylesheet" href="../css/bootstrap.css" type="text/css"/>
        <link rel="stylesheet" href="../css/userstyle.css" type="text/css"/>
        <script type="text/javascript"  src="../js/jquery.min.js"></script>
        <script type="text/javascript" src="../js/jquery-ui.min.js"></script>
        <script type="text/javascript" src="../js/script.js"></script>
        
    </head>
    <%
	if( session.getAttribute("userName")==null){
    response.sendRedirect("../login.jsp?msg=Session Invalid");
		}
	%>
    <body>
        <section class="header">
            <div class="container">
                <div class="row">

                        <jsp:include page="../include/userheader.jsp"/>

                </div>
            </div>
        </section>
                        <% String username="";
    if( session.getAttribute("userName")!=null){
    username=session.getAttribute("userName").toString();} %>
    <section class="navrabre">
        <div class="nav">
            <ul>
                <li>Dashboard</li>
                <li>Profile</li>
                <li>Dashboard</li>
                
            </ul>
        </div>
    </section>
    <section class="maincontent">
            <div class="container">
                <div class="row">
                    <h3> Welcome <% out.print(username); %></h3>
                    <%
                    
                    %>
                    lojhnbsdjfhksdhfksjhd
                </div>
            </div>
        
        </section>
        <section class="footer">
            <jsp:include page="../include/footer.jsp"/>
        </section>
    </body>
</html>
