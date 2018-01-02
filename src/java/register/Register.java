/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package register;

import java.sql.*;
import connection.ConfigConnection;
import Login.Login;

public class Register {
String fullname="";
String userName="";
String password="";
String email="";
String dob="";
String gender="";
String phone="";
String currentadd="";
String premanentadd="";
String bloodgroupid="";
String userId="";
String role="";

public String getUserId() {
	return userId;
}



public void setUserId(String userId) {
	this.userId = userId;
}



	public String getUserName() {
	return userName;
}



public void setUserName(String userName) {
	this.userName = userName;
}    

public String getPwd() {
	return password;
}

public void setPwd(String password) {
	this.password = password;
}



public String getRole() {
	return role;
}



public void setRole(String role) {
	this.role = role;
}

public String getEmail() {
	return email;
}



public void setEmail(String email) {
	this.email = email;
}



	public String getFullName() {
	return userName;
}



public void setFullName(String fullname) {
	this.fullname = fullname;
}    

public String getDoB() {
	return dob;
}

public void setDoB(String dob) {
	this.dob = dob;
}



public String getGender() {
	return gender;
}



public void setGender(String gender) {
	this.gender = gender;
}

public String getPhone() {
	return phone;
}



public void setPhone(String phone) {
	this.phone = phone;
}



	public String getCurrentAdd() {
	return currentadd;
}



public void setCurrentAdd(String currentadd) {
	this.currentadd = currentadd;
}    

public String getPremanentAdd() {
	return premanentadd;
}

public void setPremanentAdd(String premanentadd) {
	this.premanentadd = premanentadd;
}






public String getBloodId() {
	return bloodgroupid;
}



public void setBloodId(String bloodgroupid) {
	this.bloodgroupid = bloodgroupid;
}

public void addUser() throws SQLException{
    Connection con=null;
    PreparedStatement stmt=null;
    try{
        con=ConfigConnection.getDbConnection();
        stmt=con.prepareStatement("insert into user(username,pwd,email,role,) values (?,?,?,?)");
        stmt.setString(1,userName);
	stmt.setString(2,password);
	stmt.setString(3,email);
	stmt.setString(4,"user");
        System.out.println("stmt===="+stmt);
			
			
			stmt.executeUpdate();
			System.out.println("stmt===="+stmt);

			System.out.println("stmt===="+stmt);
    }
    catch(Exception err){
        con.rollback();
	System.out.println("error in adduser inside user"+err);
    }
    finally {
	try { 
            if (stmt != null) stmt.close();
            if (con != null) con.close();
            } catch (SQLException errSql){}
	}
    
                
}
public void getUserid(){
		
		
		PreparedStatement stmt=null;
		Connection con=null;
		ResultSet rs=null;
		
		try{
			con=ConfigConnection.getDbConnection();
			stmt=con.prepareStatement("select id from user where username='"+userName+"' AND email='"+email+"' AND pwd='"+password+"' ");
			rs=stmt.executeQuery();
			System.out.println("stmt"+stmt);
			while(rs.next()){
			userId=rs.getString("id");
			}
		}
		catch(Exception err){
			System.out.println("error in checkPwd inside login.java");
		}
		 finally {
				try { 
					if (stmt != null) stmt.close();
					if (con != null) con.close();
				} catch (SQLException errSql){}
			}
	}

	
public void addIntoBloodUser() throws SQLException{
    Connection con=null;
    PreparedStatement stmt=null;
    try{
        con=ConfigConnection.getDbConnection();
        stmt=con.prepareStatement("insert into blood_bank(uid,fullname,bloodgroupid,dob,email,phone,gender,currentadd,permanentadd) values (?,?,?,?,?,?,?,?,?)");
        stmt.setString(1,userId);
	stmt.setString(2,fullname);
	stmt.setString(3,bloodgroupid);
	stmt.setString(4,dob);
        stmt.setString(5,email);
        stmt.setString(6,phone);
        stmt.setString(7,gender);
        stmt.setString(8,currentadd);
        stmt.setString(9,premanentadd);
        System.out.println("stmt===="+stmt);
			
			
			stmt.executeUpdate();
			System.out.println("stmt===="+stmt);

			System.out.println("stmt===="+stmt);
    }
    catch(Exception err){
        con.rollback();
	System.out.println("error in adduser inside user"+err);
    }
    finally {
	try { 
            if (stmt != null) stmt.close();
            if (con != null) con.close();
            } catch (SQLException errSql){}
	}
    
                
}
}
