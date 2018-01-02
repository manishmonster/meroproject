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
         <!-- fullCalendar -->
         <link rel="stylesheet" href="../css/fullcalendar.min.css" type="text/css"/>
         
        
        <link rel="stylesheet" href="../css/Admin.min.css" type="text/css"/>
        <link rel="stylesheet" href="../css/_all-skins.min.css" type="text/css"/>
        
        <script type="text/javascript"  src="../js/jquery.min.js"></script>
        <script type="text/javascript" src="../js/jquery-ui.min.js"></script>
       
        <!-- fullCalendar -->
<script src="../js/moment.js"></script>
<script src="../js/fullcalendar.min.js"></script>
<!-- Page specific script -->
<script>
    
  $(function () {

    /* initialize the external events
     -----------------------------------------------------------------*/
    function init_events(ele) {
      ele.each(function () {

        // create an Event Object (http://arshaw.com/fullcalendar/docs/event_data/Event_Object/)
        // it doesn't need to have a start or end
        var eventObject = {
          title: $.trim($(this).text()) // use the element's text as the event title
        }

        // store the Event Object in the DOM element so we can get to it later
        $(this).data('eventObject', eventObject)

        // make the event draggable using jQuery UI
        $(this).draggable({
          zIndex        : 1070,
          revert        : true, // will cause the event to go back to its
          revertDuration: 0  //  original position after the drag
        })

      })
    }

    init_events($('#external-events div.external-event'))

    /* initialize the calendar
     -----------------------------------------------------------------*/
    //Date for the calendar events (dummy data)
    var date = new Date()
    var d    = date.getDate(),
        m    = date.getMonth(),
        y    = date.getFullYear()
    $('#calendar').fullCalendar({
      header    : {
        left  : 'prev,next',
        center: 'title',
        right : 'month,agendaWeek,agendaDay'
      },
      buttonText: {
        
        month: 'month',
        week : 'week',
        day  : 'day'
      },
      //Random default events
      
      events    : [
        
        {
          title          : 'All Day Event',
          start          : new Date(y, m, 1),
          backgroundColor: '#f56954', //red
          borderColor    : '#f56954' //red
        },
        {
          title          : 'Long Event',
          start          : new Date(y, m, d - 15),
          end            : new Date(y, m, d - 2),
          backgroundColor: '#f39c12', //yellow
          borderColor    : '#f39c12' //yellow
        },
        {
          title          : 'Meeting',
          start          : new Date(y, m, d, 10, 30),
          allDay         : false,
          backgroundColor: '#0073b7', //Blue
          borderColor    : '#0073b7' //Blue
        },
        {
          title          : 'Lunch',
          start          : new Date(y, m, d, 12, 0),
          end            : new Date(y, m, d, 14, 0),
          allDay         : false,
          backgroundColor: '#00c0ef', //Info (aqua)
          borderColor    : '#00c0ef' //Info (aqua)
        },
        {
          title          : 'Birthday Party',
          start          : new Date(y, m, d + 1, 19, 0),
          end            : new Date(y, m, d + 1, 22, 30),
          allDay         : false,
          backgroundColor: '#00a65a', //Success (green)
          borderColor    : '#00a65a' //Success (green)
        },
        {
          title          : 'Click for Google',
          start          : new Date(y, m, 28),
          end            : new Date(y, m, 29),
          url            : 'http://google.com/',
          backgroundColor: '#3c8dbc', //Primary (light-blue)
          borderColor    : '#3c8dbc' //Primary (light-blue)
        }
      ],
      editable  : true,
      droppable : true, // this allows things to be dropped onto the calendar !!!
      drop      : function (date, allDay) { // this function is called when something is dropped

        // retrieve the dropped element's stored Event Object
        var originalEventObject = $(this).data('eventObject')

        // we need to copy it, so that multiple events don't have a reference to the same object
        var copiedEventObject = $.extend({}, originalEventObject)

        // assign it the date that was reported
        copiedEventObject.start           = date
        copiedEventObject.allDay          = allDay
        copiedEventObject.backgroundColor = $(this).css('background-color')
        copiedEventObject.borderColor     = $(this).css('border-color')

        // render the event on the calendar
        // the last `true` argument determines if the event "sticks" (http://arshaw.com/fullcalendar/docs/event_rendering/renderEvent/)
        $('#calendar').fullCalendar('renderEvent', copiedEventObject, true)

        // is the "remove after drop" checkbox checked?
        if ($('#drop-remove').is(':checked')) {
          // if so, remove the element from the "Draggable Events" list
          $(this).remove()
        }

      }
    })

    /* ADDING EVENTS */
    var currColor = '#3c8dbc' //Red by default
    //Color chooser button
    var colorChooser = $('#color-chooser-btn')
    $('#color-chooser > li > a').click(function (e) {
      e.preventDefault()
      //Save color
      currColor = $(this).css('color')
      //Add color effect to button
      $('#add-new-event').css({ 'background-color': currColor, 'border-color': currColor })
    })
    $('#add-new-event').click(function (e) {
      e.preventDefault()
      //Get value and make sure it is not null
      var val = $('#new-event').val()
      if (val.length == 0) {
        return
      }

      //Create events
      var event = $('<div />')
      event.css({
        'background-color': currColor,
        'border-color'    : currColor,
        'color'           : '#fff'
      }).addClass('external-event')
      event.html(val)
      $('#external-events').prepend(event)

      //Add draggable funtionality
      init_events(event)

      //Remove event from text input
      $('#new-event').val('')
    })
  })
</script>
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
 ConfigConnection util=new ConfigConnection();
 Event ee = new Event();
 String msg="";
  %>
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
     <section class="content-header">
      <h1>
        Event
        <small>Control panel</small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="index.jsp"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active">Events</li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content">
        
      <div class="row">
          <div class="col-md-12">
          <div class="box box-solid">
            <div class="box-header with-border">
              <h3 class="box-title">List Event</h3>
              <% msg=request.getParameter("msg"); 
              if(msg!=null){
                  out.print(msg);
              }
              %>
            </div>
            <!-- /.box-header -->
             <div class="box-body">
                 <table class="table table-bordered" style="width: 100%">
                <tr>
                  <th style="width: 10px">#</th>
                  <th>Event Name</th>
                  <th>Event Location</th>
                  <th>Event Descprition</th>
                  <th>Event Date/Time</th>
                  <th > Action</th>
                </tr>
                <% 
                      
         java.util.Iterator paraList=ee.getEventInfo().iterator();
         int j=1;
                       while(paraList.hasNext()){
                           HashMap tempMap1= (HashMap) paraList.next();
                           String eid=tempMap1.get("eventid").toString(); 
                           String eventName=tempMap1.get("eventName").toString(); 
                           String eventLocation=tempMap1.get("eventLocation").toString(); 
                           String eventDesc=tempMap1.get("eventDesc").toString(); 
                           String eventDate=tempMap1.get("eventDate").toString(); 
                           String eventTime=tempMap1.get("eventTime").toString();
                      %> 
                 <tr>
                  <td><% out.print(j);%></td>
                  <td><% out.print(eventName);%></td>
                  <td><% out.print(eventLocation);%></td>
                  <td><% out.print(eventDesc);%></td>
                  <td><% out.print(eventDate+" At "+eventTime);%></td>
                  <td><a href="editevent.jsp?id=<% out.print(eid);%>"><button class="btn btn-primary">Edit</button></a> <a href="delevent.jsp?id=<% out.print(eid);%>"><button class="btn btn-danger">Delete</button></a></td>
                </tr>
                  <% j++;}  %>
              </table>
             </div>
            </div>
          </div>
        
        <!-- /.col -->
        <div class="col-md-3">
          <div class="box box-solid">
            <div class="box-header with-border">
              <h3 class="box-title">Create Event</h3>
            </div>
            <div class="box-body">
                <form method="post" action="docreateevent.jsp">
              <div class="input-group">
                  <input id="new-event" type="text" class="form-control" placeholder="Event Title" name="eventname">
                  <input id="new-event" type="text" class="form-control" placeholder="Event Location" name="eventloaction">
                  <input type="texr" class="form-control" placeholder="Event Date" name="eventdate">
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
                <textarea class="form-control" name="eventdesc"></textarea>

          
                    <input  type="submit" class="btn btn-primary btn-flat" value="Add">
               
              </div>
                </form>
              <!-- /input-group -->
            </div>
          </div>
        </div>
         
        <div class="col-md-9">
          <div class="box box-primary">
            <div class="box-body no-padding">
              <!-- THE CALENDAR -->
              <div id="calendar"></div>
            </div>
            <!-- /.box-body -->
          </div>
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
