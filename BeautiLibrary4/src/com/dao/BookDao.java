package com.dao;

import java.util.List;

import com.bean.Book;

public interface BookDao {
	public List<Book> QueryAll();
	public List<Book> QueryById(int id);
	public List<Book> QueryByBname(String Bname);
	public void DeleteBookById(String id);
	public void InsertBooks(Book book);
	public String SelectIdByType(String Type);
	public void UpdateBook(Book book);
	
}
