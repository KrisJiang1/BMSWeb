package service.impl;

import java.util.ArrayList;

import domain.BookOther;

public interface BookOtherBussinessImpl {
	
	public void addBookOtherMess(BookOther bookother);
	
	public void updateBookStatus(String barcode,int ifBorrowed);
	
	public void deleteBookOtherMess(String barcode);
	
	public ArrayList<BookOther> selectBookOtherById(int bookid);
	
	public BookOther selectBookOtherByCode(String barcode);

	public ArrayList<String> selectBarCode(int bookid, int ifBorrowed);

	public boolean selectIfHasBook(int bookid);


}
