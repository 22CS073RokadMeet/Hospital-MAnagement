package com.db;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnect 
{
	public static Connection conn;
	
	public static Connection getConn() {
		try 
		{	
			Class.forName("com.mysql.cj.jdbc.Driver");
			System.out.println("Driver Loaded successfullyy....................");

		
		
			String url="jdbc:mysql://localhost:3306/hospital_2";
			String username="root";
			String password="Meet@231";
		
			conn=DriverManager.getConnection(url,username,password);
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return conn;
	}
}
