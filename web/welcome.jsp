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
        <link rel="stylesheet" href="css/bootstrap.css" type="text/css"/>
        <link rel="stylesheet" href="css/style.css" type="text/css"/>
        <script type="text/javascript"  src="js/jquery.min.js"></script>
        <script type="text/javascript" src="js/jquery-ui.min.js"></script>
        <script type="text/javascript" src="js/script.js"></script>
        
    </head>
    <body>
        <section class="header">
            <div class="container">
                <div class="row">

                        <jsp:include page="include/header.jsp"/>

                </div>
            </div>
        </section>
        <section class="maincontent">
        <h1>Hello World!</h1>
        </section>
        <section class="footer">
            <jsp:include page="include/footer.jsp"/>
        </section>
    </body>
</html>
