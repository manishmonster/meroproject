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
        <link rel="stylesheet" href="../css/bootstrap.min.css" type="text/css"/>
        
        <link rel="stylesheet" href="../css/font-awesome.min.css" type="text/css"/>
        <link rel="stylesheet" href="../css/ionicons.min.css" type="text/css"/>
        <link rel="stylesheet" href="../css/Admin.min.css" type="text/css"/>
        <link rel="stylesheet" href="../css/_all-skins.min.css" type="text/css"/>
        
        <script type="text/javascript"  src="../js/jquery.min.js"></script>
        <script type="text/javascript" src="../js/jquery-ui.min.js"></script>
       
        
    </head>
   <%
	if( session.getAttribute("userName")==null){
    response.sendRedirect("../login.jsp?msg=Session Invalid");
		}
	%>
    <body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">

  <jsp:include page="../include/adminheader.jsp"/>

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        Dashboard
        <small>Control panel</small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active">Dashboard</li>
      </ol>
    </section>

   
  </div>
  <!-- /.content-wrapper -->
  <footer class="main-footer">
    
    <strong>Copyright &copy; All rights
    reserved.
  </footer>

  
  
</div>
<!-- ./wrapper -->

    </body>
</html>
