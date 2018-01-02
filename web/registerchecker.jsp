<%-- 
    Document   : loginchecker
    Created on : Nov 9, 2017, 10:11:33 AM
    Author     : Administrator
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="admin.User" %>
<%@ page import="Login.Login" %>
<%@ page import="admin.Validateor" %>
<%@ page import="admin.Bloodbank" %>
<%@ page import="connection.ConfigConnection" %>
<%@page import="java.util.Date" %>


<%

String role="";
String userId="";
String fullName="";
	int isLet=0;

String firstName=request.getParameter("firstname");
String middleName=request.getParameter("middlename"); 
String lastName=request.getParameter("lastname");
String email=request.getParameter("email");
String dob=request.getParameter("dob");
String gender=request.getParameter("gender");
String phone=request.getParameter("phone");
String bloodgroup=request.getParameter("bloodgroupid");
String presentadd=request.getParameter("presentadd");
String permanentadd=request.getParameter("permanentadd");
String userName= request.getParameter("uname");
String pwde= request.getParameter("pwd");


if(firstName.equals("") || lastName.equals("") || dob.equals("") || gender.equals("") || 
   email.equals("") || bloodgroup.equals("") || presentadd.equals("") || permanentadd.equals("")
   || userName.equals("") || pwde.equals("") ){
    %>
    <jsp:forward page="register.jsp">
    <jsp:param name="errormsg" value="Fill The Form Completly"/>
    </jsp:forward>
    <%
}

if(!middleName.equals("")){
        fullName= firstName+" "+middleName+" "+lastName;
    }
    else{
        fullName= firstName+" "+lastName;
    }

ConfigConnection util=new ConfigConnection();
User uu= new User();
Bloodbank bb = new Bloodbank();
Validateor vale= new Validateor();
Login ll = new Login();
ll.setUserName(userName);
//out.println("userName===="+userName);
 String count=ll.countUser();
out.println("count: "+count);

int cnt=Integer.parseInt(count);
if(cnt>0){//check for user exist or not
	%>
    <jsp:forward page="register.jsp">
    <jsp:param name="errormsg" value="Username Exist"/>
    </jsp:forward>
    <%
	}

if(userName.length()<4){
	%>
    <jsp:forward page="register.jsp">
    <jsp:param name="errormsg" value="User Name Must Be More Then 3 Characters"/>
    </jsp:forward>
    <%
	}


if(pwde.contains(" ")){
    %>
    <jsp:forward page="register.jsp">
    <jsp:param name="errormsg" value="password must not contain blank space"/>
    </jsp:forward>
    <% }
if(pwde.length()<6){
    %>
    <jsp:forward page="register.jsp">
    <jsp:param name="errormsg" value="User Name Must Be More Then 6 Characters"/>
    </jsp:forward>
    <%  }


    if(!vale.emailValidate(email)){
            %>
            <jsp:forward page="register.jsp">
            <jsp:param name="errormsg" value="Invalide Email Address Pattern"/>
            </jsp:forward>
            <%
            
            }
for(char ch: phone.toCharArray()){
            if(Character.isLetter(ch)){
                isLet=1;
                break;
                }
            }
        if(isLet==1){
            %>
            <jsp:forward page="register.jsp">
            <jsp:param name="errormsg" value="Telephone No. Must Not Contain Characters"/>
            </jsp:forward>
            <%
            }


uu.setUserName(userName);
uu.setPassword(pwde);
uu.setRole("user");
out.println(uu.getUserName());
out.println(uu.getPassword());
out.println(uu.getRole());
bb.setBloodId(bloodgroup);
bb.setFullName(fullName);
bb.setDoB(dob);
bb.setEmail(email);
bb.setPhone(phone);
bb.setCurrentAdd(presentadd);
bb.setPremanentAdd(permanentadd);
bb.setGender(gender);
String countEmail=bb.countEmail();
int cntEmail=Integer.parseInt(countEmail);
if(cntEmail>0){//check for user exist or not
	%>
    <jsp:forward page="register.jsp">
        <jsp:param name="errormsg" value="Email id used by another user.<br/>Please enter new email"/>
    </jsp:forward>
    <%
	}
Class.forName("com.mysql.jdbc.Driver").newInstance();
    Connection con=null;
		PreparedStatement stmt=null;
    try{
        uu.saveUser();
        uu.getUser();
        userId=uu.getUserId();
        bb.setUserId(userId);
        bb.addBloodBank();
        session.setAttribute("userName",userName);
			session.setAttribute("role",role);
			session.setAttribute("userId",userId);
			session.setMaxInactiveInterval(1800);
			response.sendRedirect("user/index.jsp");
		}
		
    
    catch(Exception err){
        
                
%>
            <jsp:forward page="register.jsp">
            <jsp:param name="errormsg" value="Error Adding New User"/>
            </jsp:forward>
            <%

    }
%>
   
