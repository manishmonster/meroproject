<%-- 
    Document   : index
    Created on : Oct 11, 2017, 6:43:29 PM
    Author     : Monster
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>BloodLife</title>
        <link rel="stylesheet" href="css/bootstrap.css" type="text/css"/>
        <link rel="stylesheet" href="css/style.css" type="text/css"/>
        <script type="text/javascript"  src="js/jquery.min.js"></script>
        <script type="text/javascript" src="js/jquery-ui.min.js"></script>
        <script type="text/javascript" src="js/script.js"></script>
        
    </head>
    <body>
        <%
String msg="";
String success_mesg="";
msg = request.getParameter("msg");
success_mesg = request.getParameter("success_mesg");
%>
        <section class="header">
            <div class="container">
                <div class="row">

                        <jsp:include page="include/headerlogin.jsp"/>

                </div>
            </div>
        </section>
        <section class="maincontent">
            <div class="container">
                <div class="row">
                    <div class="offset-col-2 col-md-12"> 
                    
                        <h2>Please Login To Your Account</h2>
                        <div class="success_mesg">
                            <% if (success_mesg != null){ 
    
			out.print(success_mesg);}
			
			%>
                        </div>
                        <div class="error_mesg">
                            <% if (msg != null){ 
    
			out.print(msg);}
			
			%>
                        </div>
                        <form action="loginchecker.jsp" method="POST">
                            <div class="form-group row">
                                <label for="user" class="col-md-2 col-form-label">Username</label>
                                <div class="col-md-2">
                                    <input class="form-control" type="text" name="user" placeholder="Enter user name" id="user"/>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="password" class="col-md-2 col-form-label">Password</label>
                                <div class="col-md-2">
                                    <input class="form-control" type="password" name="pwd" placeholder="Enter user password" id="password"/>
                                </div>
                            </div>
                             <div class="form-group row">
                                <input type="submit" class=" btn btn-primary" value="Login" name="submit"/>
                                <input type="reset" class=" btn btn-primary" value="Clear"/>
                            </div>

                        </form>
                    </div>
                </div>
            </div>
        </section>
        <section class="footer">
            <jsp:include page="include/footer.jsp"/>
        </section>
        
    </body>
</html>
