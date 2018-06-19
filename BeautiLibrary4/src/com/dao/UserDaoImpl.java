package com.dao;

import java.sql.Statement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.bean.User;
import com.jdbc.dbtool.DBTool;

@SuppressWarnings("unused")
public class UserDaoImpl implements UserDao {

	@Override
	public User Query(String username) {
		// TODO Auto-generated method stub
		
		Connection conn = DBTool.Connect();
		String sql = "select * from user where username=?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, username);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next())
			{
				User user = new User();
				user.setId(rs.getInt("id"));
				user.setUsername(rs.getString("username"));
				user.setPassword(rs.getString("password"));
				user.setType(rs.getInt("type"));
				return user;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}finally
		{
			DBTool.Close(conn);
			
		}
		return null;
		
	}

	public List<User> QueryAll(){
		List<User> UserList = new ArrayList<User>();
		
		Connection conn=DBTool.Connect();
		String sql="select * From user";
		try{
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			while(rs.next())
			{
				User user=new User();
				user.setId(rs.getInt("id"));
				user.setUsername(rs.getString("username"));
				user.setType(rs.getInt("type"));
				user.setPassword(rs.getString("password"));
				UserList.add(user);
			}
			DBTool.Close(conn);
			return UserList;
		}catch(SQLException e){
			e.printStackTrace();
		}
		DBTool.Close(conn);
		return null;
	}
	public List<User> QueryById(int id) {
		List<User> UserList = new ArrayList<User>();
		Connection conn = DBTool.Connect();
		String sql = "select * From user where id like ?";
		try {
			PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.setString(1, "%"+id+"%");
			ResultSet rs = stmt.executeQuery();
			while(rs.next())
			{
				User user=new User();
				user.setId(rs.getInt("id"));
				user.setUsername(rs.getString("username"));
				user.setType(rs.getInt("type"));
				user.setPassword(rs.getString("password"));
				UserList.add(user);
			}
			conn.close();
			return UserList;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	public void DeleteUserById(String id) {
		// TODO Auto-generated method stub
		String sql = "delete from user where id = ?";
		Connection conn = DBTool.Connect();
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
}

