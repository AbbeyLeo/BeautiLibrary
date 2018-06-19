package com.jdbc.dbtool;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.bean.User;

public class ShowUser {
	private Connection conn=null;
	private PreparedStatement psmt=null;
	private ResultSet rs=null;
	/**
	 * 获取第几页的数据
	 */
	public List<User> getAllUsersByPage(int pageSize,int pageIndex,List<User> list ) throws SQLException{
		List<User> UserList = new ArrayList<User>();
		int last = 0;
		if(pageIndex*pageSize< list.size())
		{
			last = pageIndex*pageSize;
	
		}
		else
		{
				last = list.size();	
		}
		UserList.addAll(list.subList((pageIndex - 1)*pageSize, last));
		return UserList;
	}
	/**
	 * 获得管理员总数
	 */
	public int countUser(){
		int count=0;
		String sql="select count(*) from user";
		conn=DBTool.Connect();
		try{
			psmt=conn.prepareStatement(sql);
			rs=psmt.executeQuery();
			while(rs.next()){
				count=rs.getInt(1);
			}
		}catch(SQLException e){
			e.printStackTrace();
		}
		return count;
	}
	/** 
     *  根据每页显示的数量,得到管理员总数 
     */    
    public int getTotalPage(int pageSize){  
        int totalPage=countUser();  
        return (totalPage%pageSize==0)?(totalPage/pageSize):(totalPage/pageSize+1);  
    }  
}
