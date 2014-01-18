package com.common.db;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.util.Properties;

/**
 * 获取数据库连接
 * @author Administrator
 *
 */
public class ConnectionManager extends Properties
{
	private static final long serialVersionUID = 2353451960142320172L;
	private static ConnectionManager instance;
	
	public static Connection getConnection()
	{
		String driverName = getInstance().getProperty("driverName");
		String url = getInstance().getProperty("url");
		String user = getInstance().getProperty("user");
		String pwd = getInstance().getProperty("password");
		Connection conn = null;
		try
		{
			// 加载数据库驱动程序
			Class.forName(driverName);
			conn = DriverManager.getConnection(url, user, pwd);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return conn;
	}
	
	private ConnectionManager()
	{
		InputStream is = getClass().getResourceAsStream(
		"/com/common/db/DB.properties");
		try 
		{
			this.load(is);
		} 
		catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public static ConnectionManager getInstance()
	{
		if (instance != null) 
		{
			return instance;
		} 
		else 
		{
			try 
			{
				makeInstance();
			} 
			catch (IOException e) 
			{
				e.printStackTrace();
			}
			return instance;
		}
	}

	private static synchronized void makeInstance() throws IOException 
	{
		if (instance == null) 
		{
			instance = new ConnectionManager();
		}
	}
	public static void main(String[] args)
	{
		String driverName = "com.mysql.jdbc.Driver";
		String url= "jdbc:mysql://127.0.0.1:3308/journey_info_db?useUnicode=true&amp;characterEncoding=utf8&amp;autoReconnect=true";
		String user = "root";
		String password = "123456";
		try
		{
			// 加载数据库驱动程序
			Class.forName(driverName);
			Connection conn = ConnectionManager.getConnection();
			System.out.println("conn: " + conn);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
}
