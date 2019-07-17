package domain;

public class BookOther {
	
	
	
	private int bookId;
	
	private int ifBorrowed;
	
	private String barCode;

	
	public BookOther() {

	}

	public BookOther(int bookId, int ifBorrowed,String barCode) {
		super();
		this.barCode = barCode;
		this.bookId = bookId;
		this.ifBorrowed = ifBorrowed;
	}
	
	
	
	public BookOther(int bookId, int ifBorrowed) {
		super();
		this.bookId = bookId;
		this.ifBorrowed = ifBorrowed;
	}

	public String getBarCode() {
		return barCode;
	}
	
	
	public void setBarCode(String barCode) {
		this.barCode = barCode;
	}

	public int getBookId() {
		return bookId;
	}

	public void setBookId(int bookId) {
		this.bookId = bookId;
	}

	public int getIfBorrowed() {
		return ifBorrowed;
	}

	public void setIfBorrowed(int ifBorrowed) {
		this.ifBorrowed = ifBorrowed;
	}
	
	
}
