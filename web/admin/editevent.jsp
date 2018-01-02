<%@page import="admin.Event"%>
<%@page import="java.util.HashMap"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import="connection.ConfigConnection" %>
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
  <% 

 Event ee = new Event();
  %>
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
     <section class="content-header">
      <h1>
        Calendar
        <small>Control panel</small>
      </h1>
      <ol class="breadcrumb">
         <li><a href="index.jsp"><i class="fa fa-dashboard"></i> Home</a></li>
         <li ><a href="event.jsp">Events</a></li>
        <li class="active">Edit Events</li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content">
       <% 
                      String err="";
                      err=request.getParameter("errormsg");
                      String eventName="";
                      String eventDesc="";
                      String eventLocation="";
                      String eventDate="";
                      String eventid="";
                      eventid = request.getParameter("id");
                      ee.setEventId(eventid);
                      ee.getEventById();
                      eventName=ee.getEventName();
                      eventLocation=ee.getEventLocation();
                      eventDesc=ee.getEventDesc();
                      eventDate=ee.getEventDate();
         
                      %>  
      <div class="row">
          <div class="col-md-12">
          <div class="box box-solid">
            <div class="box-header with-border">
              <h3 class="box-title">List Event</h3>
              <% 
              if(err!=null){
                  out.print(err);
              }%>
            </div>
            <!-- /.box-header -->
             <div class="box-body">
                 
                
                      <form action="doeditevent.jsp" method="post">
                          <input type="hidden" name="eid" value="<% out.print(eventid);%>"/>
                          <label>Event Name</label>
                          <input type="text" class="form-control" name="eventname" value="<% out.print(eventName);%>"/>
                          <label>Event Location</label>
                          <input type="text" class="form-control" name="eventloaction" value="<% out.print(eventLocation);%>"/>
                          <label>Event Desc</label>
                          <input type="text" class="form-control" name="eventdesc" value="<% out.print(eventDesc);%>"/>
                          
                          <label>Event Date/Time</label>
                          <input type="text" class="form-control" name="eventdate" value="<% out.print(eventDate);%>"/>
                          <select class="form-control" name="eventtime">
                              <% 
                              for(int i=0;i<24;i++){
                                  %>
                                  <option value="<% out.print(i); %>">
                                      <% 
                                          if(i==0){
                                              int m=i;
                                      m=m+12;
                                              out.print(m+"AM");}
                                      else if(i>0 && i<12){out.print(i+"AM");} 
                                      else if(i==12){out.print(i+"PM");}
                                      else if(i>12 && i<24){
                                      int m=i;
                                      m=m-12;
                                      out.print(m+"PM");} 
                                      %></option>
                              <%
                              }
                              %>
                          </select>
                          <input type="submit"  class="btn btn-warning" value="Upadate"/>
                      </form>
               
                 
                 
                 
                 
             
             </div>
            </div>
          </div>
        
        <!-- /.col -->
        
         
        
          <!-- /. box -->
        </div>
        <!-- /.col -->
</div>
      </div>
      <!-- /.row -->
    </section>
    <!-- /.content -->
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
