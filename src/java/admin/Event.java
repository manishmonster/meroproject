/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package admin;

import connection.ConfigConnection;
import java.sql.*;
import java.util.*;

public class Event {
String eventid="";
String eventName="";
String eventLocation="";
String eventDesc="";
String eventDate="";
String eventTime="";

public String getEventId() {
	return eventid;
}

public void setEventId(String eventid) {
	this.eventid = eventid;
}

public String getEventName() {
	return eventName;
}

public void setEventName(String eventName) {
	this.eventName = eventName;
}   

public String getEventLocation() {
	return eventLocation;
}

public void setEventLocation(String eventLocation) {
	this.eventLocation = eventLocation;
}

public String getEventDesc() {
	return eventDesc;
}



public void setEventDesc(String eventDesc) {
	this.eventDesc = eventDesc;
}


public String getEventDate() {
	return eventDate;
}

public void setEventDate(String eventDate) {
	this.eventDate = eventDate;
}

public String getEventTime() {
	return eventDate;
}

public void setEventTime(String eventTime) {
	this.eventTime = eventTime;
}

public void addEvent() throws SQLException{
		
		Connection con=null;
		PreparedStatement stmt=null;
		
		try{
			
			con=ConfigConnection.getDbConnection();
			stmt=con.prepareStatement("insert into event(eventname,location,decp,eventdate,eventime) values (?,?,?,?,?)");
			stmt.setString(1,eventName);
                        stmt.setString(2,eventLocation);
                        stmt.setString(3,eventDesc);
                        stmt.setString(4,eventDate);
                        stmt.setString(5,eventTime);
                        
                        System.out.println("stmt===="+stmt);
			
			
			stmt.executeUpdate();
			System.out.println("stmt===="+stmt);

			System.out.println("stmt===="+stmt);
		}
		catch(Exception err){
			con.rollback();
			System.out.println("error in addEvent inside event"+err);
		}
		 finally {
				try { 
					if (stmt != null) stmt.close();
					if (con != null) con.close();
				} catch (SQLException errSql){}
			}
	}
	public List getEventInfo(){
		
		Connection con=null;
		PreparedStatement stmt=null;
		ResultSet rs=null;
		List result=null;
		Map resultMap=null;
		
		try{
			
			con=ConfigConnection.getDbConnection();
			stmt=con.prepareStatement("select * from event");
			rs=stmt.executeQuery();
			result= new ArrayList();
			while(rs.next()){
				resultMap=new HashMap();
				resultMap.put("eventid",rs.getString("id"));
                                resultMap.put("eventName",rs.getString("eventname"));
				resultMap.put("eventLocation",rs.getString("location"));
				resultMap.put("eventDesc",rs.getString("decp"));
				resultMap.put("eventDate",rs.getString("eventdate"));	
                                resultMap.put("eventTime",rs.getString("eventime"));	
				
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
        public void getEventById(){
		
		
		PreparedStatement stmt=null;
		Connection con=null;
		ResultSet rs=null;
		
		try{
			con=ConfigConnection.getDbConnection();
			stmt=con.prepareStatement("select * from event where id='"+eventid+"'");
			rs=stmt.executeQuery();
			System.out.println("stmt"+stmt);
			while(rs.next()){
			eventName = rs.getString("eventname");
			eventLocation = rs.getString("location");
			eventDesc=rs.getString("decp");
                        eventDate=rs.getString("eventdate");
                        eventTime=rs.getString("eventTime");
			}
		}
		catch(Exception err){
			System.out.println("error in getEventById inside Event.java");
		}
		 finally {
				try { 
					if (stmt != null) stmt.close();
					if (con != null) con.close();
				} catch (SQLException errSql){}
			}
	}
        public void editEvent() throws SQLException{
		
		Connection con=null;
		PreparedStatement stmt=null;
		
		try{
			con=ConfigConnection.getDbConnection();
			stmt=con.prepareStatement("update event set eventname=?, location=?, decp=? ,eventdate=?, eventime=?  where id="+eventid);
			
			stmt.setString(1,eventName);
                        stmt.setString(2,eventLocation);
                        stmt.setString(3,eventDesc);
                        stmt.setString(4,eventDate);
                        stmt.setString(5,eventTime);
                        
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
        public void deleteEvent() throws SQLException{
	
	Connection con=null;
	PreparedStatement stmt=null;
	
	try{
		con=ConfigConnection.getDbConnection();
		stmt=con.prepareStatement("delete from event where id="+eventid);
                System.out.println("stmt===="+stmt);
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
}
