                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  <%-- 
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
        <script type="text/javascript" src="js/bootstrap.min.js"></script>
        <script type="text/javascript" src="js/script.js"></script>
    </head>
    <body>
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
                    <h2>Welcome to BloodLife</h2>
                    <div class="col-md-6">
                        <h3>Join BloodLife for cause</h3>
                        <button class="btn btn-primary" data-toggle="modal" data-target="#myModal"  data-toggle="tooltip" title="Hooray!">Register</button>
                        <img src="image/Banner/1.jpg" class="img-responsive" width="100%" height="340" alt="banner"/>



  <!-- Modal -->
  <!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">Register</h4>
      </div>
      <div class="modal-body">
              <div class="row">
                  <div class="col-md-6">
                      Just one click and you can request for required blood for you or your loved one<br/>
                      <button class="btn btn-danger " data-dismiss="modal" data-toggle="modal" data-target="#fast" >For one click blood receive </button>
                  </div>
                  <div class="col-md-6"> Or
                      <a href="register.jsp"><button class="btn btn-info" >Normal register</button></a>
                  </div>
              </div>

      </div>
      
    </div>
  </div>
</div>

                    </div>  
                    <div class="col-md-6">
                        <h3>Sign in for cause</h3>
                        <a href="login.jsp"><button class="btn btn-success" >Sign in</button></a>
                        <img src="image/Banner/2.jpg" class="img-responsive" width="100%" height="auto" alt="banner"/>

                    </div>
                </div>
                <div class="row">
                    <div class="col-md-6">
                        <h3>Contact Us</h3>
                        
                        <table  class="table-responsive">
                                   
                                    <tbody>
                                        <tr>
                                            <td> <h4>Phone:</h4></td>
                                            <td>+977-984-322-8906</td>
                                        </tr>
                                        <tr>
                                             <td> <h4>Email:</h4></td>
                                            <td>manishtwayana@gmail.com</td>
                                        </tr>
                                        <tr>
                                             <td> <h4>Address:</h4></td>
                                             <td> Pandu Bazzar,6,Suryabinyak,<br/>Bhaktapur,Nepal</td>
                                        </tr>
                                    </tbody>
                                </table>

                    </div>       
                    <div class="col-md-6">  
                        <h3>Feedback</h3>
                        <form method="post" action="">
                            <div class="form-group row">
                                <label for="fullname" class="col-md-3 col-form-label">Full name:</label>
                                <div class="col-md-8">
                                    <input class="form-control" type="text" name="firstname" placeholder="Full Name" id="fullname"/>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="email" class="col-md-3 col-form-label">Email:</label>
                                <div class="col-md-8">
                                    <input class="form-control" type="email" name="email" placeholder="For example:abc@xzy.com" id="email"/>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="phone" class="col-md-3 col-form-label">Phone:</label>
                                <div class="col-md-8">
                                    <input class="form-control" type="text" name="phone" placeholder="For example 9843228906" id="phone"/>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="message" class="col-md-3 col-form-label">Message:</label>
                                <div class="col-md-8">
                                    <textarea class="form-control"></textarea>
                                </div>
                            </div>
                            <div class="form-group row"><center>
                                <input type="submit" class=" btn btn-primary" value="Send" name="submit"/>
                                <input type="reset" class=" btn btn-primary" value="Clear"/></center>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </section>
              <div class="modal fade" id="fast" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">Emergency Purpose only</h4>
      </div>
      <div class="modal-body">
        <form method="post" action="">
                            <div class="form-group row">
                                <label for="fullname" class="col-md-3 col-form-label">Full name:</label>
                                <div class="col-md-8">
                                    <input class="form-control" type="text" name="firstname" placeholder="Full Name" id="fullname"/>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="email" class="col-md-3 col-form-label">Email:</label>
                                <div class="col-md-8">
                                    <input class="form-control" type="email" name="email" placeholder="For example:abc@xzy.com" id="email"/>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="phone" class="col-md-3 col-form-label">Phone:</label>
                                <div class="col-md-8">
                                    <input class="form-control" type="text" name="phone" placeholder="For example 9843228906" id="phone"/>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="message" class="col-md-3 col-form-label">Message:</label>
                                <div class="col-md-8">
                                    <textarea class="form-control"></textarea>
                                </div>
                            </div>
                            <div class="form-group row"><center>
                                <input type="submit" class=" btn btn-primary" value="Send" name="submit"/>
                                <input type="reset" class=" btn btn-primary" value="Clear"/></center>
                            </div>
                        </form>
      </div>
      
    </div>
  </div>
</div>
        <section class="footer">
             
            <jsp:include page="include/footer.jsp"/>
        </section>
       
    </body>
</html>
