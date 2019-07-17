package service.impl;

import java.util.ArrayList;
import java.util.HashSet;

import domain.Book;



public interface BookBussinessImpl {
	
	/**
	 * 添加图书
	 * @param book 图书对象
	 */
	public void addBook(Book book);
	
	/**
	 * 删除图书
	 * @param bookid 图书ID
	 */
	public void deleteBook(int bookid);

	/**
	 * 通过图书id查询图书
	 * @param bookid 图书ID
	 * @return 返回图书对象
	 */
	public Book selectBook(int bookid);
	
	/**
	 * 通过图书名称查询图书
	 * @param bookid 图书名称
	 * @return 返回图书对象
	 */
	public Book selectBook(String bookname);
	
	/**
	 * 更新图书
	 * @param book 图书对象
	 */
	public void updateBook(Book book);

	/**
	 * 通过关键词查询图书
	 * @param keyword 关键词
	 * @return 返回查询到的图书数组
	 */
	public ArrayList<Book> selectBookByKeyWord(String keyword);

	/**
	 * 通过图书ID查询图书
	 * @param bookId 图书ID
	 * @return 返回查询到的图书对象
	 */
	public Book selectBookByBookId(int bookId);

	/**
	 * 通过图书种类查询图书
	 * @param booktype 图书种类	
	 * @return  返回查询到的图书数组
	 */
	public ArrayList<Book> selectBookByType(String booktype);

	public HashSet<Book> weeklyRecommended();

}
