package dao.impl;

import java.util.ArrayList;

import domain.Book;

public interface BookDaoImpl {

	/**
	 * 添加图书
	 * @param book 图书对象
	 */
	public void addBook(Book book);
	
	
	/**
	 * 修改图书
	 * @param book 图书对象
	 */
	public void updateBook(Book book);
	
	
	/**
	 * 删除图书
	 * @param bookid 图书ID
	 */
	public void deleteBook(int bookid);
	
	
	
	/**
	 * 利用图书ID查询图书
	 * @param bookid 图书ID
	 * @return 返回查询到的图书对象
	 */
	public Book selectBook(int bookid);
	
	/**
	 * 利用图书名称查询图书
	 * @param bookid 图书名称
	 * @return 返回查询到的图书对象
	 */
	public Book selectBook(String bookname);

	/**
	 * 利用图书作者查询图书
	 * @return 返回相关所有图书集合
	 */
	public ArrayList<Book> selectBookByAuthor(String bookauthor);


	public ArrayList<Book> selectBookByKeyWord(String keyword);

	public Book selectBookByBookId(int bookid);

	public ArrayList<Book> selectBookByType(String booktype);

	public ArrayList<Integer> selectAllBookId();

	public ArrayList<Book> selectAllBook();


}

