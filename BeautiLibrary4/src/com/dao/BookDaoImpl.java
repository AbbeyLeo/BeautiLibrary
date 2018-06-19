package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.bean.Book;
import com.jdbc.dbtool.DBTool;

public class BookDaoImpl implements BookDao {

	@Override
	public List<Book> QueryAll() {
		// TODO Auto-generated method stub
		List<Book> BookList = new ArrayList<Book>();
		
		Connection conn = DBTool.Connect();
		String sql = "select * From book_info";
		try {
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			while(rs.next())
			{
				Book book = new Book();
				book.setId(rs.getString("id"));
				book.setBname(rs.getString("Bname"));
				book.setBtype(rs.getString("Btype"));
				book.setBprice(rs.getString("Bprice"));
				book.setBauthor(rs.getString("Bauthor"));
				book.setPress(rs.getString("Press"));
				BookList.add(book);
			}
			DBTool.Close(conn);
			return BookList;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		DBTool.Close(conn);
		return null;
	}

	@Override
	public List<Book> QueryById(int id) {
		List<Book> BookList = new ArrayList<Book>();
		Connection conn = DBTool.Connect();
		String sql = "select * From book_info where id like ?";
		try {
			PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.setString(1, "%"+id+"%");
			ResultSet rs = stmt.executeQuery();
			while(rs.next())
			{
				Book book = new Book();
				book.setId(rs.getString("id"));
				book.setBname(rs.getString("Bname"));
				book.setBtype(rs.getString("Btype"));
				book.setBprice(rs.getString("Bprice"));
				book.setBauthor(rs.getString("Bauthor"));
				book.setPress(rs.getString("Press"));
				BookList.add(book);
			}
			conn.close();
			return BookList;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public List<Book> QueryByBname(String Bname) {
		List<Book> BookList = new ArrayList<Book>();
		Connection conn = DBTool.Connect();
		String sql = "select * From book_info where Bname like ?";
		try {
			PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.setString(1, "%"+Bname+"%");
			ResultSet rs = stmt.executeQuery();
			while(rs.next())
			{
				Book book = new Book();
				book.setId(rs.getString("id"));
				book.setBname(rs.getString("Bname"));
				book.setBtype(rs.getString("Btype"));
				book.setBprice(rs.getString("Bprice"));
				book.setBauthor(rs.getString("Bauthor"));
				book.setPress(rs.getString("Press"));
				BookList.add(book);
			}
			DBTool.Close(conn);
			return BookList;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public void DeleteBookById(String id) {
		// TODO Auto-generated method stub
		String sql = "delete from book_info where id = ?";
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

	@Override
	public void InsertBooks(Book book) {
		// TODO Auto-generated method stub
		String sql = "insert into book_info values (?,?,?,?,?,?)";
		MyTool idtool = new MyTool();
		String id = new String();
		String typeId = SelectIdByType(book.getBtype());
		if(typeId.equals(null) || typeId.equals(""))
		{
			id = idtool.CreateBookId();
		}
		else
		{
			id = idtool.CreateBookIdHasType(typeId);
		}
		
		Connection conn = DBTool.Connect();
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, book.getBname());
			pstmt.setString(3, book.getBtype());
			pstmt.setString(4, book.getBprice());
			pstmt.setString(5, book.getBauthor());
			pstmt.setString(6, book.getPress());
			pstmt.execute();
			DBTool.Close(conn);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		DBTool.Close(conn);
		
	}

	@Override
	public String SelectIdByType(String Type) {
		// TODO Auto-generated method stub
		String sql = "select id from book_info where Btype = ? limit 1";
		String id = new String();
		Connection conn = DBTool.Connect();
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, Type);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next())
			{
				id = rs.getString("id");
				id = id.substring(0, 5);
				System.out.println(id);
			}
			DBTool.Close(conn);
			return id;
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		DBTool.Close(conn);
		return id;
	}

	@Override
	public void UpdateBook(Book book) {
		// TODO Auto-generated method stub
		String sql = "update book_info set id = ?, Bname = ?, Btype = ?, Bprice = ?, Bauthor = ?, Press = ? where id = ?";
		String typeId = SelectIdByType(book.getBtype());
		String PerId = book.getId();
		String id = new String();
		MyTool idtool = new MyTool();
		if(typeId.equals(null) || typeId.equals(""))
		{
			id = idtool.CreateBookId();
			book.setId(id);
		}
		else
		{
			if((PerId.substring(0, 5)).equals(typeId))
			{
				book.setId(PerId);
			}
			else
			{
				id = idtool.CreateBookIdHasType(typeId);
				book.setId(id);
			}
		}
		Connection conn = DBTool.Connect();
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, book.getId());
			pstmt.setString(2, book.getBname());
			pstmt.setString(3, book.getBtype());
			pstmt.setString(4, book.getBprice());
			pstmt.setString(5, book.getBauthor());
			pstmt.setString(6, book.getPress());
			pstmt.setString(7, PerId);
			pstmt.execute();
			DBTool.Close(conn);
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		DBTool.Close(conn);
		
	}
	

}
