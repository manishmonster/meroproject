package connection;


import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;




/**
 *
 * @author Monster
 */
public class ConfigConnection {
    String table_name="";



	public String getTablename() {
	return table_name;
}



public void setTablename(String table_name) {
	this.table_name = table_name;
}

     public static Connection getDbConnection(){
		
		Connection con=null;
		PreparedStatement stmt=null;
		ResultSet rs=null;
		try{
			//Class.forName("org.gjt.mm.mysql.Driver");
			Class.forName("com.mysql.jdbc.Driver"); 
			con=DriverManager.getConnection("jdbc:mysql://localhost/bloodlife","root",""); 
			con.setAutoCommit(true);
			
		}
		catch(Exception err){
			
			System.out.println("error in connection");
		}
		return con;
	}
	
	public static String checkNull(String value){
		
		if((value=="")||(value.trim().equals(""))){
			return "";
		}
		else{
			return value;
			
		}
	}
	
	public String getDesc (String desc, String table, String condition, String value){
		
		Connection con=null;
		PreparedStatement stmt=null;
		ResultSet rs=null;
		String result=null;
		
		try{
			con=ConfigConnection.getDbConnection();
			stmt=con.prepareStatement("select "+desc+" from "+ table+" where "+condition+"='"+value+"'");
			rs=stmt.executeQuery();
			while (rs.next()){
				
				result=rs.getString(desc);
			}
		}
		catch(SQLException err){
		
			System.out.println("error in query");
			
		}
		catch(Exception errCon){
			
			
		}
		finally{
			try{
				if(rs!=null) rs.close();
				if(con!=null) con.close();
				if(stmt!=null) stmt.close();
			}catch(Exception err){
				
			}
			
		}
		return result;
		
	}
        public List getAllTable (String table_name){
            Connection con=null;
            PreparedStatement stmt=null;
            ResultSet rs=null;
            Map resultMap=null;
            List result=null;
            try{
			con=ConfigConnection.getDbConnection();
			stmt=con.prepareStatement("select * from "+ table_name);
			rs=stmt.executeQuery();
                        result=new ArrayList();
                        while(rs.next()){
                                resultMap=new HashMap();
                                resultMap.put("name",rs.getString("table_name"));

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
		
		
		
		
			
	
        public List listTable() throws SQLException {
            Connection con=null;
	PreparedStatement stmt=null;
	ResultSet rs=null;
	Map resultMap=null;
	List result=null;
	try{
		con=ConfigConnection.getDbConnection();
		stmt=con.prepareStatement("SELECT table_name FROM information_schema.tables WHERE table_schema = 'bloodlife' ORDER BY table_name");
		rs=stmt.executeQuery();
		
		result=new ArrayList();
		while(rs.next()){
			resultMap=new HashMap();
			resultMap.put("name",rs.getString("table_name"));
			
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
public List descTable() throws SQLException {
            Connection con=null;
	PreparedStatement stmt=null;
	ResultSet rs=null;
	Map resultMap=null;
	List result=null;
	try{
		con=ConfigConnection.getDbConnection();
		stmt=con.prepareStatement("SELECT column_name, data_type, column_key FROM information_schema.columns WHERE table_schema = 'bloodlife' AND table_name =  '"+table_name+"'");
		rs=stmt.executeQuery();
		
		result=new ArrayList();
		while(rs.next()){
			resultMap=new HashMap();
			resultMap.put("column",rs.getString("column_name"));
			resultMap.put("datatype",rs.getString("data_type"));
                        resultMap.put("keys",rs.getString("column_key"));
                        
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
}

