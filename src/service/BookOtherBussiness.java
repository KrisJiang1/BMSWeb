package service;

import java.util.ArrayList;

import dao.BookOtherDao;
import dao.impl.BookOtherDaoImpl;
import domain.BookOther;
import service.impl.BookOtherBussinessImpl;

public class BookOtherBussiness implements BookOtherBussinessImpl{

	BookOtherDaoImpl dao = new BookOtherDao();
	
	@Override
	public void addBookOtherMess(BookOther bookother) {
		dao.addBookOther(bookother);
	}

	@Override
	public void updateBookStatus(String barcode,int ifBorrowed) {
		dao.updateBookStatus(barcode,ifBorrowed);
	}

	@Override
	public void deleteBookOtherMess(String barcode) {
		dao.deleteBookOther(barcode);
	}

	@Override
	public ArrayList<BookOther> selectBookOtherById(int bookid) {
		ArrayList<BookOther> al = dao.selectBookOtherById(bookid);
		return al;
	}

	@Override
	public BookOther selectBookOtherByCode(String barCode) {
		BookOther al = dao.selectBookOtherByCode(barCode);
		return al;
	}
	@Override
	public ArrayList<String> selectBarCode(int bookid, int ifBorrowed){
		return dao.selectBarCode(bookid, ifBorrowed);
		
	}
	
	@Override
	public boolean selectIfHasBook(int bookid) {
		return dao.selectIfHasBook(bookid);
	}
	

}
