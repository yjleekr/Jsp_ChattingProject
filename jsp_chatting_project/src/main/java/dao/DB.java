package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class DB {
	protected Connection connection;
	protected ResultSet resultSet;
	protected PreparedStatement preparedStatement;	
	
	public DB() {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			connection = DriverManager.getConnection(
					"jdbc:mysql://localhost:3307/carrot?serverTimezone=UTC" , 
					"root" , "1234");
			System.out.println("연동");
		}
		catch (Exception e) {
			System.out.println("*db 연동 실패");
		}
	}
}
