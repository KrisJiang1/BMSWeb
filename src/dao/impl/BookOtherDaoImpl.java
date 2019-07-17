package dao.impl;

import java.util.ArrayList;

import domain.BookOther;

public interface BookOtherDaoImpl {
	
	/**
	 * 添加图书其他信息
	 * @param bookother
	 */
	public void addBookOther(BookOther bookother);
	
	/**
	 * 改变图书借阅状态
	 * @param ifBorrowed
	 */
	public void updateBookStatus(String barcode,int ifBorrowed);
	
	/**
	 * 通过条形码删除图书
	 * @param barcode 条形码
	 */
	public void deleteBookOther(String barcode);
	
	/**
	 * 利用图书id查询图书信息
	 * @param bookid
	 * @return
	 */
	public  ArrayList<BookOther> selectBookOtherById(int bookid);
	
	/**
	 * 利用图书条形码查询图书
	 * @param barCode
	 * @return
	 */
	public BookOther selectBookOtherByCode(String barCode);

	public ArrayList<String> selectBarCode(int bookid, int ifBorrowed);

	public boolean selectIfHasBook(int bookid);

	

}
