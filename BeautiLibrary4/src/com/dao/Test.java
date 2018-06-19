package com.dao;

import java.util.Random;

import com.bean.Book;
import com.bean.User;

public class Test {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Book book = new Book();
		BookDao bookdao = new BookDaoImpl();
   			book.setId("ABCAS-12345-134");
   			book.setBname("逼逼逼逼逼逼");
			book.setBtype("励志");
			book.setBprice("123.5");
			book.setBauthor("hong");
			book.setPress("广州");
			bookdao.UpdateBook(book); 
			System.out.println(book);
   		
		
	}

}
