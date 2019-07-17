package service;

import java.lang.reflect.Array;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Random;

import dao.BookDao;
import dao.impl.BookDaoImpl;
import domain.Book;
import service.impl.BookBussinessImpl;




public class BookBussiness implements BookBussinessImpl{
	BookDaoImpl dao = new BookDao(); 

	@Override
	public void addBook(Book book) {
		dao.addBook(book);
	}

	@Override
	public void deleteBook(int bookid) {
		dao.deleteBook(bookid);
	}

	@Override
	public Book selectBook(int bookid) {
		return dao.selectBook(bookid);
	}

	@Override
	public void updateBook(Book book) {
		dao.updateBook(book);
	}

	@Override
	public Book selectBook(String bookname) {
		return dao.selectBook(bookname);
	}
	
	@Override
	public Book selectBookByBookId(int bookid) {
		return dao.selectBookByBookId(bookid);
	}

	@Override
	public ArrayList<Book> selectBookByKeyWord(String keyword) {
		return dao.selectBookByKeyWord(keyword);
	}
	
	@Override
	public ArrayList<Book> selectBookByType(String booktype) {
		return dao.selectBookByType(booktype);
	}
	
	@Override
	public HashSet<Book> weeklyRecommended(){
		ArrayList<Book> allbooks = dao.selectAllBook();
		HashSet<Book> weeklybooks =  new HashSet<Book>();
		do{	
			weeklybooks.add(allbooks.get(new Random().nextInt(allbooks.size())));
		}while(weeklybooks.size()<7);
		return weeklybooks;
	}
	
}
