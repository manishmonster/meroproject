/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Login;

/**
 *
 * @author Monster
 */
import java.sql.*;
import connection.ConfigConnection;

public class Login{
	
String pwd="";
String role="";
String name="";
String userName="";
String userId="";



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



	public String getName() {
	return name;
}



public void setName(String name) {
	this.name = name;
}



public String getPwd() {
	return pwd;
}



public void setPwd(String pwd) {
	this.pwd = pwd;
}



public String getRole() {
	return role;
}



public void setRole(String role) {
	this.role = role;
}

	public String countUser(){
		
		PreparedStatement stmt=null;
		Connection con=null;
		ResultSet rs=null;
                
		String count=null;
		
		try{
			
			con=ConfigConnection.getDbConnection();
			stmt=con.prepareStatement("Select count(*) as count from user where username='"+userName+"'");
			System.out.println("stmt----------"+stmt);
			rs=stmt.executeQuery();
			System.out.println("stmt===111"+stmt);
			while(rs.next()){
				count=rs.getString("count");
			}
                        
		}
		catch(Exception err){
			
		} finally {
			try { 
				if (stmt != null) stmt.close();
				if (con != null) con.close();
			} catch (SQLException errSql){}
		}
		return count;
	}

	public void checkPwd(){
		
		
		PreparedStatement stmt=null;
		Connection con=null;
		ResultSet rs=null;
		
		try{
			con=ConfigConnection.getDbConnection();
			stmt=con.prepareStatement("select * from user where username='"+userName+"'");
			rs=stmt.executeQuery();
			System.out.println("stmt"+stmt);
			while(rs.next()){
			pwd = rs.getString("pwd");
			role = rs.getString("role");
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
	

	public void changePwd() throws SQLException{
		
		Connection con=null;
		PreparedStatement stmt=null;
		
		try{
			con=ConfigConnection.getDbConnection();
			stmt=con.prepareStatement("update user set password=? where id='"+userId+"'");
			stmt.setString(1,pwd);
			stmt.executeUpdate();
			
		}
		catch(Exception err){
			System.out.println("error inside changePwd in user.java");
			con.rollback();
		}
		 finally {
				try { 
					if (stmt != null) stmt.close();
					if (con != null) con.close();
				} catch (SQLException errSql){}
			}
			
		}
	
}