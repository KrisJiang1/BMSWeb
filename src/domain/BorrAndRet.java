package domain;

import java.sql.Date;

public class BorrAndRet {
	
	private int id;
	
	private int userId;
	
	private String barCode;
	
	private String bookName;
	
	private Date borrDate;
	
	private int borrTime;
	
	private Date returnDate;
	
	private Date latestretDate;
	
	//0为有 1为无
	private int ifBorrowed;

	public BorrAndRet() {
		super();
	}

	public BorrAndRet(int id,int userId, String barCode, Date borrDate, int borrTime, Date returnDate,Date latestretDate) {
		super();
		this.id = id;
		this.userId = userId;
		this.barCode = barCode;
		this.borrDate = borrDate;
		this.borrTime = borrTime;
		this.returnDate = returnDate;
		this.latestretDate = latestretDate;
	}
	//借书
	public BorrAndRet(int userId, String barCode, Date borrDate, int borrTime,Date latestretDate) {
		super();
		this.userId = userId;
		this.barCode = barCode;
		this.borrDate = borrDate;
		this.borrTime = borrTime;
		this.latestretDate = latestretDate;
		this.ifBorrowed = ifBorrowed;
	}
	
	public BorrAndRet(int id,int userId, String barCode, Date borrDate, int borrTime, Date returnDate,Date latestretDate,int ifBorrowed) {
		super();
		this.id = id;
		this.userId = userId;
		this.barCode = barCode;
		this.borrDate = borrDate;
		this.borrTime = borrTime;
		this.returnDate = returnDate;
		this.latestretDate = latestretDate;
		this.ifBorrowed = ifBorrowed;
	}


	//已借未还
	public BorrAndRet(int userId, String barCode,String bookName, Date borrDate,Date latestretDate,int ifBorrowed) {
		super();
		this.userId = userId;
		this.barCode = barCode;
		this.bookName = bookName;
		this.borrDate = borrDate;
		this.latestretDate = latestretDate;
		this.ifBorrowed = ifBorrowed;
	}
	
	//借书历史
	public BorrAndRet(int userId, String barCode,String bookName, Date borrDate,Date returnDate,Date latestretDate,int ifBorrowed) {
		super();
		this.userId = userId;
		this.barCode = barCode;
		this.bookName = bookName;
		this.borrDate = borrDate;
		this.returnDate = returnDate;
		this.latestretDate = latestretDate;
		this.ifBorrowed = ifBorrowed;
	}
	
	
	
	public BorrAndRet(int userId, String barCode, Date borrDate, int borrTime, Date returnDate,Date latestretDate) {
		super();
		this.userId = userId;
		this.barCode = barCode;
		this.borrDate = borrDate;
		this.borrTime = borrTime;
		this.returnDate = returnDate;
		this.latestretDate = latestretDate;
	}
	
	public int getId() {
		return id;
	}
	
	public void setId(int id) {
		this.id = id;
	}
	
	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public String getBarCode() {
		return barCode;
	}

	public void setBarCode(String barCode) {
		this.barCode = barCode;
	}
	
	public String getBookName() {
		return bookName;
	}

	public void setBookName(String bookName) {
		this.bookName  = bookName;
	}

	public Date getBorrDate() {
		return borrDate;
	}

	public void setBorrDate(Date borrDate) {
		this.borrDate = borrDate;
	}

	public int getBorrTime() {
		return borrTime;
	}

	public void setBorrTime(int borrTime) {
		this.borrTime = borrTime;
	}

	public Date getReturnDate() {
		return returnDate;
	}

	public void setReturnDate(Date returnDate) {
		this.returnDate = returnDate;
	}

	public Date getLatestretDate() {
		return latestretDate;
	}

	public void setLatestretDate(Date latestretDate) {
		this.latestretDate = latestretDate;
	}
	
	public int getIfBorrowed() {
		return ifBorrowed;
	}

	public void setIfBorrowed(int ifBorrowed) {
		this.ifBorrowed = ifBorrowed;
	}
	
	
}
