package DBPKG;

import java.sql.Connection;
import java.sql.DriverManager;

public class Connector {
	
	public static Connection getConnection() throws Exception{
		
		Class.forName("oracle.jdbc.OracleDriver");
		
		Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521/xe","system","1234");
		
		
		
		return con;
		String ss = "insert into member_tbl_02 (custno, custname, phone, address, joindate, grade, city)\r\n" + 
				"VALUES(seq_custno.nextval,?,?,?,?,?,?)"
	}

}
