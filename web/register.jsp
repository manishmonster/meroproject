<%@page import="java.sql.*"%>
<%@ page import="admin.Bloodbank" %>
<%@ page import="connection.ConfigConnection" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>BloodLife</title>
        <link rel="stylesheet" href="css/bootstrap.css" type="text/css"/>
        <link rel="stylesheet" href="css/jquery-ui.css" type="text/css"/>
        <link rel="stylesheet" href="css/style.css" type="text/css"/>
        <script type="text/javascript"  src="js/jquery.min.js"></script>
        <script type="text/javascript"  src="js/bootstrap.js"></script>
        <script type="text/javascript" src="js/jquery-ui.min.js"></script>
        <script type="text/javascript" src="js/script.js"></script>
          <script>
              
  $( function() {
    $( "#dateofbirth" ).datepicker({
       yearRange: "1985:2018",
       dateFormat:"yy-mm-dd",
      changeMonth: true,
      changeYear: true,
      showButtonPanel: true
     
    });
    
  } );
  </script>
  <style>
.kv-avatar .krajee-default.file-preview-frame,.kv-avatar .krajee-default.file-preview-frame:hover {
    margin: 0;
    padding: 0;
    border: none;
    box-shadow: none;
    text-align: center;
}
.kv-avatar {
    display: inline-block;
}
.kv-avatar .file-input {
    display: table-cell;
    width: 213px;
}
.kv-reqd {
    color: red;
    font-family: monospace;
    font-weight: normal;
}
</style>
    </head>
    <body >
        <section class="header">
            <div class="container">
                <div class="row">

                        <jsp:include page="include/headerlogin.jsp"/>

                </div>
            </div>
        </section>

<section class="signup">
            <div class="container">
            <form method="POST" action="registerchecker.jsp">
                <center><h2 >Register</h2>
                    <div class="requirefield">All field are required to be filled
                        <br/>
                        <%
                    String errormsg="";

                    errormsg = request.getParameter("errormsg");
                    if (errormsg != null){ 
    
			out.print(errormsg);}
                   
                    %>
                    </div>
                </center>
                <hr>
                <div class="form-group row">
                    <label for="inputfullname" class="col-md-2 col-form-label">Full name:</label>
                    <div class="col-md-3">
                        <input class="form-control" type="text" name="firstname" placeholder="First Name" id="inputfullname" required="required"/>
                    </div>
                    <div class="col-md-3">
                        <input class="form-control" type="text" name="middlename" placeholder="Middle Name" id="middlename" required="required"/>
                        <div class="form-check">
                        <label class="form-check-label">
                          <input class="form-check-input" type="checkbox" name="exampleRadios" id="middlenamecheck" value="option1"  onclick="if(this.checked){readcheckFunction()} else{reFunction()} " >
                          No Middle Name
                        </label>
                      </div>
                    </div>
     
                    <div class="col-md-3">
                        <input class="form-control" type="text" name="lastname" placeholder="Last Name" id="inputfullname" required="required"/>
                    </div>
                    
                </div>
                <div class="form-group row">
                    <label for="dateofbirth" class="col-md-2 col-form-label">Date of Birth:</label>
                    <div class="col-md-3">
                        <input class="form-control" type="text" name="dob" placeholder="DD/MM/YYYY" id="dateofbirth" required="required"/>
                    </div>
                
                    <label for="email" class=" col-md-2  col-form-label">Email:</label>
                    <div class="col-md-3">
                        <input class="form-control" type="email" name="email" pattern="^[a-zA-Z0-9]+@[a-z]+\.[a-z]{2,3}$" placeholder="For example:abc@xyz.com" id="email" required="required"/>
                    </div>
                </div>
                
                <div class="form-group row">
                    <label for="phone" class="col-md-2 col-form-label">Phone:</label>
                    <div class="col-md-3">
                        <input class="form-control" type="tel" name="phone" placeholder="Moblie or home number"  id="phone" required="required"/>
                    </div>
                    <label for="zone" class="col-md-2 col-form-label">Blood Group:</label>
                    <div class="col-md-2">
                        <select required class="form-control" name="bloodgroupid" >
                            
                            <option value="">Select</option>
                            <%
                                ConfigConnection util=new ConfigConnection();
                                
                                Connection con=util.getDbConnection();
                                PreparedStatement stmt=con.prepareStatement("SELECT * FROM bloodgroup");
                                ResultSet rs=stmt.executeQuery();
                                while(rs.next()){
                                %>
                            <option value="<%= rs.getString("id")%>"><%= rs.getString("blood_group")%></option>
                            <% }%>                        
                        </select>
                    </div>
                    <label for="phone" class="col-md-1 col-form-label">Gender</label>
                    <div class="col-md-3">
                        <label class="form-check-label">
                            <input class="form-check-input" type="radio" name="gender"  value="Male" checked>
                            Male
                        </label>
                        <label class="form-check-label">
                            <input class="form-check-input" type="radio" name="gender"  value="Female" checked>
                            Female
                        </label>
                        <label class="form-check-label">
                            <input class="form-check-input" type="radio" name="gender"  value="Other" checked>
                            Other
                        </label>
                        
                    </div>
                </div>
                <hr>
               
                <center>   <h3>Address Details</h3></center>
                    <hr>
                   
                    <div class="form-group row">
                        
                        <label for="zone" class="col-md-3 col-form-label">Permanent Address</label>

                        <div class="col-md-6">
                            <input class="form-control" type="text" id="permanentadd" name="permanentadd" placeholder="Enter Permanent address" required="required"/>
                        </div>
                    </div>
                   
                    <div class="form-group row">
                        
                        <label for="tzone" class="col-md-3 col-form-label">Present Address</label>
                        
                        <div class="col-md-6">
                            <input class="form-control" type="text" id="presentadd" name="presentadd" placeholder="Enter Current address" required="required"/>
                       
                        <div class="form-check">
                        <label class="form-check-label">
                            <input class="form-check-input" type="checkbox" name="exampleRadios" id="permantcheck" value="option1" onclick="if(this.checked){readcheckFunction()} else{reFunction()} ">
                          Same as Permanent
                        </label>
                        </div>
                      </div>
                    </div>
                    <hr>
                
                
                <div class="form-group row">
                    
                    <label class="col-md-3 col-form-label" for="user">Username:</label>
                    <div class="col-md-3">
                        <input class="form-control" type="text" name="uname" placeholder="Enter Username" required="required"/>
                    </div>
                     <label class="col-md-3 col-form-label" for="pwd">Password:</label>
                    <div class="col-md-3">
                        <input class="form-control" type="password" name="pwd" placeholder="Enter Password" required="required"/>
                    </div>
                     
                     
                </div>
                    <div class="form-group row"><center>
                    <input type="submit" class=" btn btn-primary" value="Submit" name="submit"/>
                    <input type="reset" class=" btn btn-primary" value="Clear"/></center>
                </div>
            </form>  
            </div>
            
        </section>  
                        <section class="footer">
            <jsp:include page="include/footer.jsp"/>
        </section>
        <script>
            var r=""
            function readcheckFunction() {
                if(document.getElementById("middlenamecheck").checked == true)
                {
                    document.getElementById("middlename").setAttribute("readonly", "readonly");
                    document.getElementById("middlename").removeAttribute("required");
                    document.getElementById("middlename").value=r;
                }
                if(document.getElementById("permantcheck").checked == true){ 
                    document.getElementById("presentadd").value=document.getElementById("permanentadd").value;
                }
    
   
}
function reFunction() {
        if(document.getElementById("middlenamecheck").checked == false){
            document.getElementById("middlename").removeAttribute("readonly"); 
            document.getElementById("middlename").setAttribute("required","required");
        }
                if(document.getElementById("permantcheck").checked == false){ 
                    document.getElementById("presentadd").value=r;
                }
    
   
}
        </script>
    </body>
</html>
