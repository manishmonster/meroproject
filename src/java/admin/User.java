/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package admin;


import connection.ConfigConnection;
import java.sql.*;
import java.util.*;

public class User{
	
String userName="";
String password="";
String role="";
String userId="";



public String getUserId() {
	return userId;
}


public void setUserId(String userId) {
	this.userId = userId;
}


public String getPassword() {
	return password;
}


public void setPassword(String password) {
	this.password = password;
}


public String getRole() {
	return role;
}


public void setRole(String role) {
	this.role = role;
}


public String getUserName() {
	return userName;
}


public void setUserName(String userName) {
	this.userName = userName;
}


public void saveUser() throws SQLException{
	
	Connection con=null;
	PreparedStatement stmt=null;
	
	try{
		con=ConfigConnection.getDbConnection();
		stmt=con.prepareStatement("insert into user (username,pwd,role) values(?,?,?)");
		stmt.setString(1,userName);
		stmt.setString(2,password);
		stmt.setString(3,role);
		
		stmt.executeUpdate();
		
	}
	catch(Exception err){
		con.rollback();
	}
	 finally {
			try { 
				if (stmt != null) stmt.close();
				if (con != null) con.close();
			} catch (SQLException errSql){}
		}
		
	}
public List viewUser(){
	
	Connection con=null;
	PreparedStatement stmt=null;
	ResultSet rs=null;
	Map resultMap=null;
	List result=null;
	try{
		con=ConfigConnection.getDbConnection();
		stmt=con.prepareStatement("select * from user order by id");
		rs=stmt.executeQuery();
		
		result=new ArrayList();
		while(rs.next()){
			resultMap=new HashMap();
			resultMap.put("userId",rs.getString("id"));
			resultMap.put("userName",rs.getString("user"));
			resultMap.put("role",rs.getString("role"));
			result.add(resultMap);
			
		}
	}
	catch(Exception err){
		System.out.println("error in viewUser inside User.java");
	}
	 finally {
			try { 
				if (rs != null) rs.close();
				if (stmt != null) stmt.close();
				if (con != null) con.close();
			} catch (SQLException errSql){}
		}
	return result;
	
}

public List searchUser(){
	
	Connection con=null;
	PreparedStatement stmt=null;
	ResultSet rs=null;
	List result=null;
	Map resultMap=null;
	
	try{
		
		con=ConfigConnection.getDbConnection();
		stmt=con.prepareStatement("select * from user where user='"+userName+"'");
		rs=stmt.executeQuery();
		result=new ArrayList();
		while(rs.next()){
			resultMap= new HashMap();
			resultMap.put("userName",rs.getString("user"));
			resultMap.put("userId",rs.getString("id"));
			resultMap.put("role",rs.getString("role"));
			result.add(resultMap);
			
		}
	}
	catch(Exception err){
		
		System.out.println("error in searchUser inside user.java");
	}
	 finally {
			try { 
				if (rs != null) rs.close();
				if (stmt != null) stmt.close();
				if (con != null) con.close();
			} catch (SQLException errSql){}
		}
	return result;
}
	public void getUser(){
		
		
		PreparedStatement stmt=null;
		Connection con=null;
		ResultSet rs=null;
		
		try{
			con=ConfigConnection.getDbConnection();
			stmt=con.prepareStatement("select * from user where username='"+userName+"'");
			rs=stmt.executeQuery();
			System.out.println("stmt"+stmt);
			while(rs.next()){
			password = rs.getString("pwd");
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
	
public List getEditUser(){
	
	Connection con=null;
	PreparedStatement stmt=null;
	ResultSet rs=null;
	List result=null;
	Map resultMap=null;
	
	try{
		con=ConfigConnection.getDbConnection();
		stmt=con.prepareStatement("select * from user where id='"+userId+"'");
		rs=stmt.executeQuery();
		result=new ArrayList();
		while(rs.next()){
			resultMap=new HashMap();
			resultMap.put("userId",rs.getInt("id"));
			resultMap.put("userName", rs.getString("user"));
			resultMap.put("password",rs.getString("password"));
			resultMap.put("role",rs.getString("role"));
			result.add(resultMap);
			
		}
	}
		catch(Exception err){
			
			System.out.println("error inside getEditUser in user.java");
		}
		 finally {
				try { 
					if (rs != null) rs.close();
					if (stmt != null) stmt.close();
					if (con != null) con.close();
				} catch (SQLException errSql){}
			}
		return result;
	}
public void editUser() throws SQLException{
	
	Connection con=null;
	PreparedStatement stmt=null;
	
	try{
		con=ConfigConnection.getDbConnection();
		stmt=con.prepareStatement("update user set user=?, password=?, role=? where id='"+userId+"'");
		stmt.setString(1,userName);
		stmt.setString(2,password);
		stmt.setString(3,role);
		stmt.executeUpdate();
		
	}
	catch(Exception err){
		con.rollback();
		System.out.println("inside editUser of user.java");
		
	}
	 finally {
			try { 
				if (stmt != null) stmt.close();
				if (con != null) con.close();
			} catch (SQLException errSql){}
		}
}

public void deleteUser() throws SQLException{
	
	Connection con=null;
	PreparedStatement stmt=null;
	
	try{
		con=ConfigConnection.getDbConnection();
		stmt=con.prepareStatement("delete from user where id='"+userId+"' and user='"+userName+"'");
		stmt.executeUpdate();
		
	}
	catch(Exception err){
		con.rollback();
	}
	 finally {
			try { 
				if (stmt != null) stmt.close();
				if (con != null) con.close();
			} catch (SQLException errSql){}
		}
}
public String checkUser()
{
	Connection con = null;
	PreparedStatement stmt = null;
	ResultSet rs = null;
	String count=null;
	try
	{
		con=ConfigConnection.getDbConnection();
		stmt = con.prepareStatement("Select count(*) as count from user where user = '"+userName+"' and id!='"+userId+"'");
		rs = stmt.executeQuery();
		System.out.println("stmt"+stmt);
		while (rs.next())
		{
			count = rs.getString("count");
			System.out.println("count java="+count);
		}
	}
	catch(Exception err)
	{
		System.out.println("Error in User Check");
	}
	 finally {
			try { 
				if (rs != null) rs.close();
				if (stmt != null) stmt.close();
				if (con != null) con.close();
			} catch (SQLException errSql){}
		}
	return count;
	}
	}
	

