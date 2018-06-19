package com.jdbc.dbtool;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import java.util.List;

import com.bean.Book;

public class ShowTool {
	private Connection conn=null;
	private PreparedStatement psmt=null;
	private ResultSet rs=null;
	/**
	 * 获取第几页的数据
	 */
	public List<Book> getAllBooksByPage(int pageSize,int pageIndex,List<Book> list ) throws SQLException{
		List<Book> BookList = new ArrayList<Book>();
		int last = 0;
		if(pageIndex*pageSize< list.size())
		{
			last = pageIndex*pageSize;
	
		}
		else
		{
				last = list.size();	
		}
		BookList.addAll(list.subList((pageIndex - 1)*pageSize, last));
		return BookList;
	}
	/**
	 * 获取图书总数
	 */
	public int countBook(){
		int count=0;
		String sql="select count(*) from book_info";
		conn=DBTool.Connect();
		try {  
            psmt=conn.prepareStatement(sql);  
            rs=psmt.executeQuery();  
            while(rs.next()){  
                count=rs.getInt(1);  
            }  
        } catch (SQLException e) {  
            e.printStackTrace();  
        }  
        return count;  
	}
	
	/** 
     *  根据每页显示的数量,得到总页数 
     */    
    public int getTotalPage(int pageSize){  
        int totalPage=countBook();  
        return (totalPage%pageSize==0)?(totalPage/pageSize):(totalPage/pageSize+1);  
    }  
}