package domain;

import java.sql.Date;
import java.util.ArrayList;

public class Book {

	private int bookId;
	
	private String bookName;
	
	private String bookType;
	
	private String bookAuthor;
	
	private int bookPageNum;
	
	private String bookTranslator;
	
	private Date bookLibtime;
	
	private double bookPrice;
	
	private String bookPub;
	
	private String bookSynopsi;

	
	public Book(){
		
	}
	
	public Book(int bookId, String bookName, String bookType, String bookAuthor, int bookPageNum, String bookTranslator,
			Date bookLibtime, double bookPrice, String bookPub,String bookSynopsi) {
		super();
		this.bookId = bookId;
		this.bookName = bookName;
		this.bookType = bookType;
		this.bookAuthor = bookAuthor;
		this.bookPageNum = bookPageNum;
		this.bookTranslator = bookTranslator;
		this.bookLibtime = bookLibtime;
		this.bookPrice = bookPrice;
		this.bookPub = bookPub;
		this.bookSynopsi = bookSynopsi;
	}
	
	public Book(String bookName, String bookType, String bookAuthor, int bookPageNum, String bookTranslator,
			Date bookLibtime, double bookPrice, String bookPub,String bookSynopsi) {
		super();
		this.bookName = bookName;
		this.bookType = bookType;
		this.bookAuthor = bookAuthor;
		this.bookPageNum = bookPageNum;
		this.bookTranslator = bookTranslator;
		this.bookLibtime = bookLibtime;
		this.bookPrice = bookPrice;
		this.bookPub = bookPub;
		this.bookSynopsi = bookSynopsi;
	}
	
	
	
	
	public int getBookId() {
		return bookId;
	}

	public void setBookId(int bookId) {
		this.bookId = bookId;
	}

	public String getBookName() {
		return bookName;
	}

	public void setBookName(String bookName) {
		this.bookName = bookName;
	}

	public String getBookType() {
		return bookType;
	}

	public void setBookType(String bookType) {
		this.bookType = bookType;
	}

	public String getBookAuthor() {
		return bookAuthor;
	}

	public void setBookAuthor(String bookAuthor) {
		this.bookAuthor = bookAuthor;
	}

	public int getBookPageNum() {
		return bookPageNum;
	}

	public void setBookPageNum(int bookPageNum) {
		this.bookPageNum = bookPageNum;
	}

	public String getBookTranslator() {
		return bookTranslator;
	}

	public void setBookTranslator(String bookTranslator) {
		this.bookTranslator = bookTranslator;
	}

	public Date getBookLibtime() {
		return bookLibtime;
	}

	public void setBookLibtime(Date bookLibtime) {
		this.bookLibtime = bookLibtime;
	}

	public double getBookPrice() {
		return bookPrice;
	}

	public void setBookPrice(double bookPrice) {
		this.bookPrice = bookPrice;
	}

	public String getBookPub() {
		return bookPub;
	}

	public void setBookPub(String bookPub) {
		this.bookPub = bookPub;
	}
	
	public String getBookSynopsi() {
		return bookSynopsi;
	}

	public void setBookSynopsi(String bookSynopsi) {
		this.bookSynopsi = bookSynopsi;
	}


	

	@Override
	public String toString() {
		return "Book [bookId=" + bookId + ", bookName=" + bookName + ", bookType=" + bookType + ", bookAuthor="
				+ bookAuthor + ", bookPageNum=" + bookPageNum + ", bookTranslator=" + bookTranslator + ", bookLibtime="
				+ bookLibtime + ", bookPrice=" + bookPrice + ", bookPub=" + bookPub + "]";
	}

	
	

}
