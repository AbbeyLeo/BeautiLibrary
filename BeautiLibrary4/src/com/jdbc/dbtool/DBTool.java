package com.jdbc.dbtool;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.io.Reader;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;

@SuppressWarnings("unused")
public class DBTool {
	
	private static String driver;
	private static String Url;
	private static String username;
	private static String password;
	
	static
	{
		
		driver = "com.mysql.jdbc.Driver";
		Url = "jdbc:mysql://localhost:3306/mybooks";
		username = "root";
		password = "961013";
	}
	public static Connection Connect()
	{
		
		try {
			Class.forName(driver);
			return DriverManager.getConnection(Url, username, password);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	public static void Close(Connection c)
	{
		if(c != null)
			try {
				c.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
	}

}

