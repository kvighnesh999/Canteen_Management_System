package com.cms.connection;

import java.sql.Connection;
import java.sql.DriverManager;
public class connProvider {
	public static Connection con;
	public static Connection getConnection() {
		try {
			if(con==null) {
				Class.forName("org.postgresql.Driver");
				con=DriverManager.getConnection("jdbc:postgresql://localhost:5432/cms","postgres","postgres");
				System.out.println("Connection done");
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return con;
	}
}