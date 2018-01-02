<%-- 
    Document   : welcome
    Created on : Nov 8, 2017, 8:56:25 PM
    Author     : Monster
--%>

<%@page import="java.util.HashMap"%>
<%@page import="admin.User"%>
<%@page import="admin.Bloodbank"%>
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
        User uu = new User();
        Bloodbank bb = new Bloodbank();
	%>
    <body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">

  <jsp:include page="../include/adminheader.jsp"/>

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        Users
        <small>Control panel</small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active">Users</li>
      </ol>
    </section>
    <!-- Main content -->
    <section class="content">
        <div class="row">
            <div class="col-md-12">
                <div class="box box-solid">
                    <div class="box-header with-border">
                        <h3 class="box-title">List User</h3>
                    </div>
                    <!-- /.box-header -->
                    <div class="box-body">
                        <%

String bloodbankid="";
String fullName="";
String email="";
String dob="";
String gender="";
String phone="";
String bloodgroupid="";
String currentadd="";
String premanentadd="";
String bloodgroupName="";

java.util.Iterator paraList=uu.viewUser().iterator();
 while(paraList.hasNext()){
    HashMap tempMap1= (HashMap) paraList.next();
    String userId=tempMap1.get("userId").toString();
    String userName=tempMap1.get("userName").toString();;
    String role=tempMap1.get("role").toString();;
 }        
                        %>
                        <div id="user_detail">
                            
                            <label>Full Name</label>
                            jkalsdjlkasj anskldnlkasd lknaklsndlmnlkasd klmklasd
                            <label>Address</label>
                            ikjaskdljas
                        </div>
                    </div>
                </div>
                
                
            </div>
        </div>
        <!-- /.row -->
    </section>
   <!-- /.Main content -->
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
