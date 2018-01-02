/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package admin;

import connection.ConfigConnection;
import java.sql.*;
import java.util.*;


public class Bloodbank {
String bloodbankid="";
String userId="";
String fullName="";
String email="";
String dob="";
String gender="";
String phone="";
String bloodgroupid="";
String currentadd="";
String premanentadd="";
String bloodgroupName="";

public String getBloodbankId() {
	return bloodbankid;
}

public void setBloodbankId(String bloodbankid) {
	this.bloodbankid = bloodbankid;
}

public String getUserId() {
	return userId;
}

public void setUserId(String userId) {
	this.userId = userId;
}

public String getEmail() {
	return email;
}



public void setEmail(String email) {
	this.email = email;
}



	public String getFullName() {
	return fullName;
}



public void setFullName(String fullName) {
	this.fullName = fullName;
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

public String getbloodgroupName() {
	return bloodgroupName;
}



public void setbloodgroupName(String bloodgroupName) {
	this.bloodgroupName = bloodgroupName;
}
public String countEmail(){
		
		PreparedStatement stmt=null;
		Connection con=null;
		ResultSet rs=null;
                
		String count=null;
		
		try{
			
			con=ConfigConnection.getDbConnection();
			stmt=con.prepareStatement("Select count(*) as count from blood_bank where email='"+email+"'");
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
public void addBloodBank() throws SQLException{
		
		Connection con=null;
		PreparedStatement stmt=null;
		
		try{
			
			con=ConfigConnection.getDbConnection();
			stmt=con.prepareStatement("insert into blood_bank(uid,fullname,bloodgroupid,dob,email,phone,gender,currentadd,permanentadd) values (?,?,?,?,?,?,?,?,?)");
			stmt.setString(1,userId);
                        stmt.setString(2,fullName);
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
			System.out.println("error in addStudent inside student"+err);
		}
		 finally {
				try { 
					if (stmt != null) stmt.close();
					if (con != null) con.close();
				} catch (SQLException errSql){}
			}
	}
	public List getBloodBankInfo(){
		
		Connection con=null;
		PreparedStatement stmt=null;
		ResultSet rs=null;
		List result=null;
		Map resultMap=null;
		
		try{
			
			con=ConfigConnection.getDbConnection();
			stmt=con.prepareStatement("select * from blood_bank");
			rs=stmt.executeQuery();
			result= new ArrayList();
			while(rs.next()){
				resultMap=new HashMap();
				resultMap.put("bloodbankid",rs.getString("id"));
                                resultMap.put("userid",rs.getString("uid"));
				resultMap.put("fullName",rs.getString("fullname"));
				resultMap.put("bloodgroupid",rs.getString("bloodgroupid"));
				resultMap.put("dob",rs.getString("dob"));
				resultMap.put("email",rs.getString("email"));
				resultMap.put("gender",rs.getString("gender"));
				resultMap.put("phone",rs.getString("phone"));
				resultMap.put("currentadd",rs.getString("currentadd"));
				resultMap.put("permanentadd",rs.getString("permanentadd"));
				
				
				result.add(resultMap);
			}
		}
		catch(Exception err){
			
			System.out.println("error in getStudentInfo inside student");
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

	public List getEditBUser(){
		
		Connection con=null;
		PreparedStatement stmt=null;
		ResultSet rs=null;
		List result=null;
		Map resultMap=null;
		
		try{
			con=ConfigConnection.getDbConnection();
			stmt=con.prepareStatement("select * from blood_bank where uid='"+userId+"'");
			rs=stmt.executeQuery();
			result=new ArrayList();
			while(rs.next()){
				resultMap=new HashMap();
				resultMap.put("bloodbankid",rs.getString("id"));
                                
				resultMap.put("fullName",rs.getString("fullname"));
				resultMap.put("bloodgroupid",rs.getString("bloodgroupid"));
				resultMap.put("dob",rs.getString("dob"));
				resultMap.put("email",rs.getString("email"));
				resultMap.put("gender",rs.getString("gender"));
				resultMap.put("phone",rs.getString("phone"));
				resultMap.put("currentadd",rs.getString("currentadd"));
				resultMap.put("permanentadd",rs.getString("permanentadd"));
				result.add(resultMap);
				
			}
		}
			catch(Exception err){
				
				System.out.println("error inside getEditStudent in Student.java");
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
	
	public List searchBUser(String searchBy,String value){
		
		Connection con=null;
		PreparedStatement stmt=null;
		ResultSet rs=null;
		List result=null;
		Map resultMap=null;
		
		try{
			
			con=ConfigConnection.getDbConnection();
			stmt=con.prepareStatement("select * from blood_bank where "+searchBy+" like '%"+value+"%'");
			rs=stmt.executeQuery();
			result= new ArrayList();
			System.out.println("stmt==="+stmt);
			while(rs.next()){
				resultMap=new HashMap();
				resultMap.put("bloodbankid",rs.getString("id"));
                                resultMap.put("userid",rs.getString("uid"));
				resultMap.put("fullName",rs.getString("fullname"));
				resultMap.put("bloodgroupid",rs.getString("bloodgroupid"));
				resultMap.put("dob",rs.getString("dob"));
				resultMap.put("email",rs.getString("email"));
				resultMap.put("gender",rs.getString("gender"));
				resultMap.put("phone",rs.getString("phone"));
				resultMap.put("currentadd",rs.getString("currentadd"));
				resultMap.put("permanentadd",rs.getString("permanentadd"));
				result.add(resultMap);
			}
		}
		catch(Exception err){
			
			System.out.println("error in searchStudent inside student");
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
	public void editBUser(String bid, String uid) throws SQLException{
		
		Connection con=null;
		PreparedStatement stmt=null;
		
		try{
			con=ConfigConnection.getDbConnection();
			stmt=con.prepareStatement("update blood_bank set fullname=?, bloodgroupid=?,dob=?, email=?, phone=?,gender=?, cuurentadd=?, permanentadd=? where uid='"+uid+"' and id='"+bid+"'");
			
			stmt.setString(1,fullName);
                        stmt.setString(2,bloodgroupid);
                        stmt.setString(3,dob);
                        stmt.setString(4,email);
                        stmt.setString(5,phone);
                        stmt.setString(6,gender);
                        stmt.setString(7,currentadd);
                        stmt.setString(8,premanentadd);
                        
			System.out.println("stmt===="+stmt);
			stmt.executeUpdate();
			
		}
		catch(Exception err){
			con.rollback();
			System.out.println("inside editStudent of Student.java");
			
		}
		 finally {
				try { 
					if (stmt != null) stmt.close();
					if (con != null) con.close();
				} catch (SQLException errSql){}
			}
	}

	
}


