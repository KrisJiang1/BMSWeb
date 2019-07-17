package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashSet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import domain.Book;
import domain.BookOther;
import domain.BorrAndRet;
import domain.User;
import service.BRMBussiness;
import service.BookBussiness;
import service.BookOtherBussiness;
import service.UserBussiness;
import service.impl.BRMBussinessImpl;
import service.impl.BookBussinessImpl;
import service.impl.BookOtherBussinessImpl;
import service.impl.UserBussinessImpl;

public class FontEndServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.doPost(request, response);
	}
	
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=utf-8");
		String method = request.getParameter("method");
		String jspSkip = request.getParameter("jspSkip");
		
		if("yes".equals(jspSkip)){
			this.jspSkip(request, response);
		}else if("borrowBook".equals(method)){
			this.borrowBook(request, response);
		}else if("returnBook".equals(method)){
			this.returnBook(request, response);
		}else if("userLogin".equals(method)){
			this.userLogin(request, response);
		}else if("singleBookuserLogin".equals(method)){
			this.singleBookuserLogin(request, response);
		}else if("selectBook".equals(method)){
			this.selectBookByName(request, response);
		}else if("selectBorNoRetMess".equals(method)){
			this.selectBorNoRetMess(request, response);
		}else if("selectAllBorMess".equals(method)){
			this.selectAllBorMess(request, response);
		}else if("selectBookByKeyWord".equals(method)){
			this.selectBookByKeyWord(request, response);
		}else{
			this.mainInterFace(request, response);
		}
	}
	
	public void mainInterFace(HttpServletRequest request ,HttpServletResponse response) throws ServletException,IOException{
		BookBussinessImpl buss = new BookBussiness();
		HashSet<Book> weeklyRecommended = buss.weeklyRecommended();
		request.setAttribute("weeklyRecommended", weeklyRecommended);
		request.getRequestDispatcher("/WEB-INF/pages/FontMainInterface.jsp").forward(request, response);
	}
	
	public void userLogin(HttpServletRequest request ,HttpServletResponse response) throws ServletException,IOException{
		String username = request.getParameter("username");
		String userpwd = request.getParameter("userpwd");
		UserBussinessImpl buss = new UserBussiness();
		User user = buss.login(username, userpwd);
		String url = "/WEB-INF/pages/"+request.getParameter("url")+".jsp";
		if(user!=null){
			request.getSession().setAttribute("user",user);
			request.getSession().setAttribute("userId", user.getUserId());
			request.getRequestDispatcher(url).forward(request, response);
		}else{
			request.getRequestDispatcher(url).forward(request, response);
		}	
	}
	
	public void singleBookuserLogin(HttpServletRequest request ,HttpServletResponse response) throws ServletException,IOException{
		String username = request.getParameter("username");
		String userpwd = request.getParameter("userpwd");
		String bookname = request.getParameter("bookname");
		System.out.println(username+""+userpwd+""+bookname);
		UserBussinessImpl buss = new UserBussiness();
		User user = buss.login(username, userpwd);
		BookBussinessImpl buss1 = new BookBussiness();
		Book book = buss1.selectBook(bookname);
		if(user!=null){
			request.getSession().setAttribute("user",user);
			request.setAttribute("book",book);
			request.setAttribute("mode","singBook");
			request.getSession().setAttribute("userId", user.getUserId());
			request.getRequestDispatcher("/WEB-INF/pages/FontSingleBook.jsp").forward(request, response);
		}else{
			request.setAttribute("mode","singBook");
			request.setAttribute("book",book);
			request.getRequestDispatcher("/WEB-INF/pages/FontSingleBook.jsp").forward(request, response);
		}	
	}
	
	/*
	 * 利用书名查找图书
	 */
	public void selectBookByName(HttpServletRequest request ,HttpServletResponse response) throws ServletException,IOException{
		String bookname = request.getParameter("bookname");
		BookBussinessImpl buss = new BookBussiness();
		Book book = buss.selectBook(bookname);
		BookOtherBussinessImpl buss1 = new BookOtherBussiness();
		boolean result = buss1.selectIfHasBook(book.getBookId());
		request.setAttribute("result", result);
		request.setAttribute("book",book);
		request.setAttribute("mode","singBook");
		request.getRequestDispatcher("/WEB-INF/pages/FontSingleBook.jsp").forward(request, response);
	}

	
	/*
	 * 利用关键字查找图书
	 */
	public void selectBookByKeyWord(HttpServletRequest request ,HttpServletResponse response) throws ServletException,IOException{
		String keyword = request.getParameter("bookKeyWord");
		BookBussinessImpl buss = new BookBussiness();
		ArrayList<Book> books = buss.selectBookByKeyWord(keyword);
		System.out.println(books.get(0).getBookName());
		request.setAttribute("keyword", keyword);
		request.setAttribute("books", books);
		request.getRequestDispatcher("/WEB-INF/pages/FontSearchedBook.jsp").forward(request, response);;
	}
	
	
	/**
	 * 借书功能
	 */
	public void borrowBook(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int userid = Integer.parseInt(request.getParameter("userid"));
		int borrtime = Integer.parseInt(request.getParameter("borrtime"));
		int bookid = Integer.parseInt(request.getParameter("bookid"));
		System.out.println(bookid);
		BookOtherBussinessImpl buss = new BookOtherBussiness();
		ArrayList<String> barcodes = buss.selectBarCode(bookid, 0);
		System.out.println(barcodes.get(0));
		String barcode = barcodes.get(0);
		Calendar cal = Calendar.getInstance();
		int year = cal.get(Calendar.YEAR);
		int month = cal.get(Calendar.MONTH);
		cal.add(Calendar.DAY_OF_MONTH, borrtime);
		Date borrdate = new Date(System.currentTimeMillis());
		Date latestreturndate = new Date(cal.getTimeInMillis());
		BorrAndRet br = new BorrAndRet(userid,barcode,borrdate,borrtime,latestreturndate);
		BRMBussinessImpl brmBuss = new BRMBussiness();
		brmBuss.addBorrMess(br);
		BookOtherBussinessImpl buss1 = new BookOtherBussiness();
		buss1.updateBookStatus(barcode,1);
		BookBussinessImpl buss2 = new BookBussiness();
		Book book = buss2.selectBookByBookId(bookid);
		request.setAttribute("book", book);
		request.setAttribute("mode", "borrowSucceed");
		request.getRequestDispatcher("/WEB-INF/pages/FontSingleBook.jsp").forward(request, response);
	}
	
	
	/**
	 * 还书功能
	 */
	public void returnBook(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int userid = Integer.parseInt(request.getParameter("userid"));
		String barcode = request.getParameter("barcode");
		Date returndate = new Date(System.currentTimeMillis());
		BRMBussinessImpl brmBuss = new BRMBussiness();
		System.out.println(userid+""+barcode+""+returndate);
		brmBuss.addReturnMess(userid, barcode, returndate);
		BookOtherBussinessImpl buss = new BookOtherBussiness();
		buss.updateBookStatus(barcode,0);
		ArrayList<BorrAndRet> al= brmBuss.selectBorrRetMessNoRet(userid);
		BookBussinessImpl bookbuss = new BookBussiness();
		ArrayList<BorrAndRet> al1 = new ArrayList<BorrAndRet>();
		BookOtherBussinessImpl buss3 = new BookOtherBussiness();
		for(int i = 0;i<al.size();i++){
			String barcode1 = al.get(i).getBarCode();
			BookOther bookother = buss3.selectBookOtherByCode(barcode1);
			int bookId = bookother.getBookId();
			Book book = bookbuss.selectBookByBookId(bookId);
			String bookName = book.getBookName();
			BorrAndRet brm = new BorrAndRet(al.get(i).getUserId(),al.get(i).getBarCode(),bookName,al.get(i).getBorrDate(),al.get(i).getLatestretDate(),0);
			al1.add(brm);
		}
		request.setAttribute("allBRM2", al1);
		request.getRequestDispatcher("/WEB-INF/pages/FontReturnBook.jsp").forward(request, response);
	}
	
	
	/**
	 * 查找所有借阅过的图书
	 */
	public void selectAllBorMess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		BRMBussinessImpl buss1 = new BRMBussiness();
		ArrayList<BorrAndRet> al= buss1.selectBRM((Integer) request.getSession().getAttribute("userId"));
		BookBussinessImpl buss2 = new BookBussiness();
		BookOtherBussinessImpl buss3 = new BookOtherBussiness();
		ArrayList<BorrAndRet> al1 = new ArrayList<BorrAndRet>();
		for(int i = 0;i<al.size();i++){
			String barcode = al.get(i).getBarCode();
			BookOther bookother = buss3.selectBookOtherByCode(barcode);
			int bookId = bookother.getBookId();
			int ifBorrowed = bookother.getIfBorrowed();
			Book book = buss2.selectBookByBookId(bookId);
			String bookName = book.getBookName();
			BorrAndRet brm = new BorrAndRet(al.get(i).getUserId(),al.get(i).getBarCode(),bookName,al.get(i).getBorrDate(),al.get(i).getReturnDate(),al.get(i).getLatestretDate(),ifBorrowed);
			al1.add(brm);
		}
		System.out.println(al1);
		request.setAttribute("allBRM1", al1);
		request.getRequestDispatcher("/WEB-INF/pages/FontBorrowHis.jsp").forward(request, response);
		
	}
	
	
	
	/**
	 * 查找已借未还的书
	 */
	public void selectBorNoRetMess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		BRMBussinessImpl buss1 = new BRMBussiness();
		ArrayList<BorrAndRet> al= buss1.selectBorrRetMessNoRet((Integer) request.getSession().getAttribute("userId"));
		BookBussinessImpl buss2 = new BookBussiness();
		ArrayList<BorrAndRet> al1 = new ArrayList<BorrAndRet>();
		BookOtherBussinessImpl buss3 = new BookOtherBussiness();
		for(int i = 0;i<al.size();i++){
			String barcode = al.get(i).getBarCode();
			BookOther bookother = buss3.selectBookOtherByCode(barcode);
			int bookId = bookother.getBookId();
			Book book = buss2.selectBookByBookId(bookId);
			String bookName = book.getBookName();
			BorrAndRet brm = new BorrAndRet(al.get(i).getUserId(),al.get(i).getBarCode(),bookName,al.get(i).getBorrDate(),al.get(i).getLatestretDate(),0);
			al1.add(brm);
		}
		request.setAttribute("allBRM2", al1);
		request.getRequestDispatcher("/WEB-INF/pages/FontReturnBook.jsp").forward(request, response);
		
	}
	
	
	
	public void jspSkip(HttpServletRequest request,HttpServletResponse response ) throws ServletException ,IOException {
		String oparetion = request.getParameter("oparetion");
		if("mybook".equals(oparetion)){
			request.getRequestDispatcher("/WEB-INF/pages/FontMyBook.jsp").forward(request, response);
		}else if("announcement".equals(oparetion)){
			request.setAttribute("mode", "homepage");
			request.getRequestDispatcher("/WEB-INF/pages/FontAnnouncement.jsp").forward(request, response);
		}else if("announcementContent".equals(oparetion)){
			String num = request.getParameter("num");
			request.setAttribute("mode", "secondpage");
			request.setAttribute("newsnum", num);
			request.getRequestDispatcher("/WEB-INF/pages/FontAnnouncement.jsp").forward(request, response);
		}else if("borrowhis".equals(oparetion)){
			request.getRequestDispatcher("/WEB-INF/pages/FontBorrowHis.jsp").forward(request, response);
		}else if("returnbook".equals(oparetion)){
			request.getRequestDispatcher("/WEB-INF/pages/FontReturnBook.jsp").forward(request, response);
		}else if("bookranking".equals(oparetion)){
			request.getRequestDispatcher("/WEB-INF/pages/FontBookRanking.jsp").forward(request, response);
		}else if("booktype".equals(oparetion)){
			request.getRequestDispatcher("/WEB-INF/pages/FontBookType.jsp").forward(request, response);	
		}else if("borrowSucceed".equals(oparetion)){
			String bookname = request.getParameter("bookname");
			BookBussinessImpl buss = new BookBussiness();
			Book book = buss.selectBook(bookname);
			BookOtherBussinessImpl buss1 = new BookOtherBussiness();
			boolean result = buss1.selectIfHasBook(book.getBookId());
			request.setAttribute("result", result);
			request.setAttribute("book",book);
			request.setAttribute("mode","singBook");
			request.getRequestDispatcher("/WEB-INF/pages/FontSingleBook.jsp").forward(request, response);
		}
	}
}
