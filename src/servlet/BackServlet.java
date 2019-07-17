package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Formatter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import domain.Book;
import domain.BorrAndRet;
import domain.User;
import service.AdminBussiness;
import service.BRMBussiness;
import service.BookBussiness;
import service.BookOtherBussiness;
import service.UserBussiness;
import service.impl.AdminBussinessImpl;
import service.impl.BRMBussinessImpl;
import service.impl.BookBussinessImpl;
import service.impl.BookOtherBussinessImpl;
import service.impl.UserBussinessImpl;

public class BackServlet extends HttpServlet {


	public BackServlet() {
		super();
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.doPost(request, response);
		
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=utf-8");
		String method = request.getParameter("method");
		String jspSkip = request.getParameter("jspSkip");
		if("adminLogin".equals(method)){
//			this.adminLogin(request, response);
		}else if("addBook".equals(method)){
			this.addBook(request, response);
		}else if("updateBookFir".equals(method)){
			this.updateBookFir(request, response);
		}else if("updateBook".equals(method)){
			this.updateBook(request, response);
		}else if("deleteBookByBookid".equals(method)){
			this.deleteBookByBookid(request,response);
		}else if("deleteBookByBarcode".equals(method)){
			this.deleteBookByBarcode(request, response);
		}else if("selectBookById".equals(method)){
			this.selectBookById(request, response);
		}else if("updateUserFir".equals(method)){
			this.updateUserFir(request, response);
		}else if("updateUser".equals(method)){
			this.updateUser(request, response);
		}else if("deleteUser".equals(method)){
			this.deleteUser(request, response);
		}else if("selectUserById".equals(method)){
			this.selectUserById(request, response);
		}else if("selectUserByName".equals(method)){
			
		}else if("addBRM".equals(method)){
			this.addBRM(request, response);
		}else if("updateBRM".equals(method)){
			this.updateBRM(request, response);
		}else if("deleteBRMById".equals(method)){
			this.deleteBRMById(request, response);
		}else if("deleteBRMByUserIdBarcode".equals(method)){
			this.deleteBRMByUserIdBarcode(request, response);
		}else if("selectBRMByUserid".equals(method)){
			this.selectBRMByUserid(request, response);
		}else if("selectBRMByUseridBarcode".equals(method)){
			this.selectBRMByUseridBarcode(request, response);
		}else if("selectBRMByBarcode".equals(method)){
			this.selectBRMByBarcode(request, response);
		}else if("selectAllBRM".equals(method)){
			this.selectAllBRM(request, response);
		}else if("yes".equals(jspSkip)){
			this.jspSkip(request, response);
		}else{
			this.skipBackstage(request, response);
		}
	}
	
//	public void skipLogin(HttpServletRequest request,HttpServletResponse response ) throws ServletException ,IOException {
//		request.getRequestDispatcher("/WEB-INF/pages/AdminLogin.jsp").forward(request, response);
//	}
//	
//	public void adminLogin(HttpServletRequest request,HttpServletResponse response ) throws ServletException ,IOException {
//		String name = request.getParameter("user");
//		System.out.println(name);
//		String password = request.getParameter("passwd");
//		System.out.println(password);
//		AdminBussinessImpl buss = new AdminBussiness();
//		boolean result = buss.isBooleanNameAndPwd(name, password);
//		System.out.println(result);
//		if(result){
//			request.getSession().setAttribute("ifLogin", 1);
//			this.skipBackstage(request, response);
//		}else{
//			request.getRequestDispatcher("/WEB-INF/pages/AdminLogin.jsp").forward(request, response);
//		}
//		
//	}
//	
	public void skipBackstage(HttpServletRequest request,HttpServletResponse response ) throws ServletException ,IOException {
		
		request.getRequestDispatcher("/WEB-INF/pages/Backstage.jsp").forward(request, response);
	}
	
	public void addBook(HttpServletRequest request,HttpServletResponse response ) throws ServletException ,IOException {
		String bookname = request.getParameter("bookname");
		String booktype = request.getParameter("booktype");
		String bookauthor = request.getParameter("bookauthor");
		int bookpagenum = Integer.parseInt(request.getParameter("bookpagenum"));
		String booktranslator= request.getParameter("booktranslator");
		String booklibtime = request.getParameter("booklibtime");
		Double bookprice = Double.parseDouble(request.getParameter("bookprice"));
		String bookpub = request.getParameter("bookpub");
		String booksynopsi = request.getParameter("booksynopsi");
		Date date = Date.valueOf(booklibtime);
		Book book = new Book(bookname,booktype,bookauthor,bookpagenum,booktranslator,date,bookprice,bookpub,booksynopsi);
		System.out.println(book);
		BookBussinessImpl buss = new BookBussiness();
		buss.addBook(book);
		request.setAttribute("mode", "addBookSucceed");
		request.getRequestDispatcher("/WEB-INF/pages/AddBook.jsp").forward(request, response);
	}
	public void updateBookFir(HttpServletRequest request,HttpServletResponse response ) throws ServletException ,IOException {
		int bookid = Integer.parseInt(request.getParameter("bookid"));
		BookBussiness buss = new BookBussiness();
		System.out.println(bookid);
		Book book = buss.selectBook(bookid);
		System.out.println(book);
		request.setAttribute("book", book);
		request.setAttribute("mode", "updateBook");
		request.getRequestDispatcher("/WEB-INF/pages/UpdateBook.jsp").forward(request, response);
	}
	
	public void updateBook(HttpServletRequest request,HttpServletResponse response ) throws ServletException ,IOException {
		int bookid = Integer.parseInt(request.getParameter("bookid"));
		String bookname = request.getParameter("bookname");
		String booktype = request.getParameter("booktype");
		String bookauthor = request.getParameter("bookauthor");
		int bookpagenum = Integer.parseInt(request.getParameter("bookpagenum"));
		String booktranslator= request.getParameter("booktranslator");
		String booklibtime = request.getParameter("booklibtime");
		Double bookprice = Double.parseDouble(request.getParameter("bookprice"));
		String bookpub = request.getParameter("bookpub");
		String booksynopsi = request.getParameter("booksynopsi");
		Date date = Date.valueOf(booklibtime);
		Book book = new Book(bookname,booktype,bookauthor,bookpagenum,booktranslator,date,bookprice,bookpub,booksynopsi);
		System.out.println(book);
		BookBussinessImpl buss = new BookBussiness();
		buss.updateBook(book);
		request.setAttribute("mode", "updateBookSucceed");
		request.getRequestDispatcher("/WEB-INF/pages/UpdateBook.jsp").forward(request, response);
	}
	
	public void deleteBookByBookid(HttpServletRequest request,HttpServletResponse response ) throws ServletException ,IOException {
		int bookid = Integer.parseInt(request.getParameter("bookid"));
		BookBussinessImpl buss = new BookBussiness();
		buss.deleteBook(bookid);
		request.setAttribute("mode", "deleteBookSucceed");
		request.setAttribute("deletemode", "byBookid");
	}
	
	public void deleteBookByBarcode(HttpServletRequest request,HttpServletResponse response ) throws ServletException ,IOException {
		String barcode = request.getParameter("barcode");
		BookOtherBussinessImpl buss = new BookOtherBussiness();
		buss.deleteBookOtherMess(barcode);
		request.setAttribute("mode", "deleteBookSucceed");
		request.setAttribute("deletemode", "byBarcode");
	}
		
	public void selectBookById(HttpServletRequest request,HttpServletResponse response ) throws ServletException ,IOException {
		int bookid = Integer.parseInt(request.getParameter("bookid"));
		BookBussinessImpl buss = new BookBussiness();
		Book book = buss.selectBook(bookid);
		request.setAttribute("book", book);
		request.setAttribute("mode","selectBook");
		request.getRequestDispatcher("/WEB-INF/pages/SelectBook.jsp").forward(request, response);
	}
	
	public void updateUserFir(HttpServletRequest request,HttpServletResponse response ) throws ServletException ,IOException {
		int userid = Integer.parseInt(request.getParameter("userid"));
		UserBussinessImpl buss = new UserBussiness();
		User user = buss.selectUser(userid);
		request.setAttribute("user", user);
		request.setAttribute("mode", "updateUser");
		request.getRequestDispatcher("/WEB-INF/pages/UpdateUser.jsp").forward(request, response);
	}
	
	public void updateUser(HttpServletRequest request,HttpServletResponse response ) throws ServletException ,IOException {
		int userid = Integer.parseInt(request.getParameter("userid"));
		String username = request.getParameter("username");
		String userpassword = request.getParameter("userpassword");
		int userage = Integer.parseInt(request.getParameter("userage"));
		String usertel = request.getParameter("usertel");
		String usersex = request.getParameter("usersex");
		String userregtime = request.getParameter("userregtime");
		Date date = Date.valueOf(userregtime);
		User user = new User(userid,username,userpassword,userage,usertel,usersex);
		UserBussinessImpl buss = new UserBussiness();
		buss.updateUser(user);
		request.setAttribute("mode", "updateUserSucceed");
		request.getRequestDispatcher("/WEB-INF/pages/UpdateUser.jsp").forward(request, response);
	}
	
	public void deleteUser(HttpServletRequest request,HttpServletResponse response ) throws ServletException ,IOException {
		int userid = Integer.parseInt(request.getParameter("userid"));
		UserBussinessImpl buss = new UserBussiness();
		buss.deleteUser(userid);
		request.setAttribute("mode", "deleteUserSucceed");
		request.getRequestDispatcher("/WEB-INF/pages/DeleteUser.jsp").forward(request, response);
	}
	
	public void selectUserById(HttpServletRequest request,HttpServletResponse response ) throws ServletException ,IOException {
		int userid = Integer.parseInt(request.getParameter("userid"));
		UserBussinessImpl buss = new UserBussiness();
		User user = buss.selectUser(userid);
		request.setAttribute("user", user);
		request.setAttribute("mode", "selectUser");
		request.getRequestDispatcher("/WEB-INF/pages/SelectUser.jsp").forward(request, response);
	}
	
	public void addBRM(HttpServletRequest request,HttpServletResponse response ) throws ServletException ,IOException {
		int userid = Integer.parseInt(request.getParameter("userid"));
		String barcode = request.getParameter("barcode");
		String borrdate = request.getParameter("borrdate");
		int borrtime = Integer.parseInt(request.getParameter("borrtime"));
		String returndate= request.getParameter("returndate");
		String latestreturndate = request.getParameter("latestreturndate");
		Date borrDate = Date.valueOf(borrdate);
		Date returnDate = Date.valueOf(returndate);
		Date latestreturnDate = Date.valueOf(latestreturndate);
		BorrAndRet br = new BorrAndRet(userid,barcode,borrDate,borrtime,returnDate,latestreturnDate);
		System.out.println(br);
		BRMBussinessImpl buss = new BRMBussiness();
		buss.addBRM(br);
		request.setAttribute("mode", "addBRMSucceed");
		request.getRequestDispatcher("/WEB-INF/pages/AddBRM.jsp").forward(request, response);
	}
	
	public void updateBRMFir(HttpServletRequest request,HttpServletResponse response ) throws ServletException ,IOException {
		int id = Integer.getInteger(request.getParameter("id"));
		BRMBussinessImpl buss = new BRMBussiness();
		BorrAndRet br = buss.selectBRMById(id);
		request.setAttribute("br", br);
		request.setAttribute("mode", "updateBRM");
		request.getRequestDispatcher("/WEB-INF/pages/UpdateBRM.jsp").forward(request, response);
	}
	
	public void updateBRM(HttpServletRequest request,HttpServletResponse response ) throws ServletException ,IOException {
		int userid = Integer.parseInt(request.getParameter("userid"));
		String barcode = request.getParameter("barcode");
		String borrdate = request.getParameter("borrdate");
		int borrtime = Integer.parseInt(request.getParameter("borrtime"));
		String returndate= request.getParameter("returndate");
		String latestreturndate = request.getParameter("latestreturndate");
		Date borrDate = Date.valueOf(borrdate);
		Date returnDate = Date.valueOf(returndate);
		Date latestreturnDate = Date.valueOf(latestreturndate);
		BorrAndRet br = new BorrAndRet(userid,barcode,borrDate,borrtime,returnDate,latestreturnDate);
		System.out.println(br);
		BRMBussinessImpl buss = new BRMBussiness();
		buss.addBRM(br);
		request.setAttribute("mode", "updateBRMSucceed");
		request.getRequestDispatcher("/WEB-INF/pages/UpdateBRM.jsp").forward(request, response);
	}
	
	public void deleteBRMById(HttpServletRequest request,HttpServletResponse response ) throws ServletException ,IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		BRMBussinessImpl buss = new BRMBussiness();
		buss.deleteBRM(id);
	}
	
	public void deleteBRMByUserIdBarcode(HttpServletRequest request,HttpServletResponse response ) throws ServletException ,IOException {
		int userid = Integer.parseInt(request.getParameter("userid"));
		String barcode = request.getParameter("barcode");
		BRMBussinessImpl buss = new BRMBussiness();
		buss.deleteBRM(userid,barcode);
		request.setAttribute("mode", "deleteBRMSucceed");
	}
	
	public void selectBRMByBarcode(HttpServletRequest request,HttpServletResponse response ) throws ServletException ,IOException {
		String barcode = request.getParameter("barcode");
		BRMBussinessImpl buss = new BRMBussiness();
		BorrAndRet br = buss.selectBRM(barcode);
		request.setAttribute("br", br);
		request.setAttribute("mode", "selectBRMSucceed");
		request.setAttribute("selectmode", "ByBarcode");
		request.getRequestDispatcher("/WEB-INF/pages/SelectBRM.jsp").forward(request, response);
	}
	
	public void selectBRMByUserid(HttpServletRequest request,HttpServletResponse response ) throws ServletException ,IOException {
		int userid = Integer.parseInt(request.getParameter("userid"));
		BRMBussinessImpl buss = new BRMBussiness();
		ArrayList<BorrAndRet> byUseridAl = buss.selectBRM(userid);
		request.setAttribute("al", byUseridAl);
		request.setAttribute("mode", "selectBRMSucceed");
		request.setAttribute("selectmode", "ByUserid");
		request.getRequestDispatcher("/WEB-INF/pages/SelectBRM.jsp").forward(request, response);
	}
	
	public void selectBRMByUseridBarcode(HttpServletRequest request,HttpServletResponse response ) throws ServletException ,IOException {
		int userid = Integer.parseInt(request.getParameter("userid"));
		String barcode = request.getParameter("barcode");
		BRMBussinessImpl buss = new BRMBussiness();
		BorrAndRet br = buss.selectBRM(userid, barcode);
		request.setAttribute("br", br);
		request.setAttribute("mode", "selectBRMSucc");
		request.setAttribute("selectmode", "ByUseridBarcode");
		request.getRequestDispatcher("/WEB-INF/pages/SelectBRM.jsp").forward(request, response);
	}
	
	public void selectAllBRM(HttpServletRequest request,HttpServletResponse response ) throws ServletException ,IOException {
		BRMBussinessImpl buss = new BRMBussiness();
		ArrayList<BorrAndRet> allBRM = buss.selectAllBRM();
		request.setAttribute("al", allBRM);
		request.setAttribute("mode", "selectBRMSucc");
		request.setAttribute("selectmode", "AllMess");
		request.getRequestDispatcher("/WEB-INF/pages/SelectBRM.jsp").forward(request, response);
	}
	
	public void jspSkip(HttpServletRequest request,HttpServletResponse response ) throws ServletException ,IOException {
		String oparetion = request.getParameter("oparetion");
		if("backTop".equals(oparetion)){
			request.getRequestDispatcher("/WEB-INF/pages/BackTop.jsp").forward(request, response);
		}else if("backLeft".equals(oparetion)){
			request.getRequestDispatcher("/WEB-INF/pages/BackLeft.jsp").forward(request, response);
		}else if("addBook".equals(oparetion)){
			request.setAttribute("mode", "addBook");
			request.getRequestDispatcher("/WEB-INF/pages/AddBook.jsp").forward(request, response);
		}else if("updateBook".equals(oparetion)){
			request.setAttribute("mode", "updateBookFir");
			request.getRequestDispatcher("/WEB-INF/pages/UpdateBook.jsp").forward(request, response);
		}else if("deleteBook".equals(oparetion)){
			request.setAttribute("mode", "deleteBookFir");
			request.getRequestDispatcher("/WEB-INF/pages/DeleteBook.jsp").forward(request, response);
		}else if("deleteBookByBookid".equals(oparetion)){
			request.setAttribute("mode", "deleteBook");
			request.setAttribute("deletemode", "byBookid");
			request.getRequestDispatcher("/WEB-INF/pages/DeleteBook.jsp").forward(request, response);
		}else if("deleteBookByBarcode".equals(oparetion)){
			request.setAttribute("mode", "deleteBook");
			request.setAttribute("deletemode", "byBarcode");
			request.getRequestDispatcher("/WEB-INF/pages/DeleteBook.jsp").forward(request, response);
		}else if("selectBook".equals(oparetion)){
			request.setAttribute("mode", "selectBookFir");
			request.getRequestDispatcher("/WEB-INF/pages/SelectBook.jsp").forward(request, response);
		}else if("updateUserFir".equals(oparetion)){
			request.getRequestDispatcher("/WEB-INF/pages/UpdateUserFir.jsp").forward(request, response);
		}else if("updateUser".equals(oparetion)){
			request.getRequestDispatcher("/WEB-INF/pages/UpdateUser.jsp").forward(request, response);
		}else if("deleteUser".equals(oparetion)){
			request.setAttribute("mode","deleteUser");
			request.getRequestDispatcher("/WEB-INF/pages/DeleteUser.jsp").forward(request, response);
		}else if("selectUser".equals(oparetion)){
			request.setAttribute("mode", "selectUserFir");
			request.getRequestDispatcher("/WEB-INF/pages/SelectUser.jsp").forward(request, response);
		}else if("borrAndRet".equals(oparetion)){
			request.getRequestDispatcher("/WEB-INF/pages/BorrAndRet.jsp").forward(request, response);
		}else if("addBRM".equals(oparetion)){
			request.getRequestDispatcher("/WEB-INF/pages/AddBRM.jsp").forward(request, response);
		}else if("updateBRMFir".equals(oparetion)){
			request.setAttribute("mode","updateBRMFir");
			request.getRequestDispatcher("/WEB-INF/pages/UpdateBRM.jsp").forward(request, response);
		}else if("updateBRM".equals(oparetion)){
			request.setAttribute("mode","updateBRM");
			request.getRequestDispatcher("/WEB-INF/pages/UpdateBRM.jsp").forward(request, response);
		}else if("deleteBRM".equals(oparetion)){
			request.setAttribute("mode", "deleteBRM");
			request.getRequestDispatcher("/WEB-INF/pages/DeleteBRM.jsp").forward(request, response);
		}else if("selectBRM".equals(oparetion)){
			request.setAttribute("mode", "selectBRMFir");
			request.getRequestDispatcher("/WEB-INF/pages/SelectBRM.jsp").forward(request, response);
		}else if("selectBRMByUserid".equals(oparetion)){
			request.setAttribute("mode", "selectBRM");
			request.setAttribute("selectmode", "ByUserid");
			request.getRequestDispatcher("/WEB-INF/pages/SelectBRM.jsp").forward(request, response);
		}else if("selectBRMByUseridBarcode".equals(oparetion)){
			request.setAttribute("mode", "selectBRM");
			request.setAttribute("selectmode", "ByUseridBarcode");
			request.getRequestDispatcher("/WEB-INF/pages/SelectBRM.jsp").forward(request, response);
		}else if("selectBRMByBarcode".equals(oparetion)){
			request.setAttribute("mode", "selectBRM");
			request.setAttribute("selectmode", "ByBarcode");
			request.getRequestDispatcher("/WEB-INF/pages/SelectBRM.jsp").forward(request, response);
		}else if("select AllBorrRetMess".equals(oparetion)){
			request.setAttribute("mode", "selectBRM");
			request.setAttribute("selectmode", "AllMess");
			request.getRequestDispatcher("/WEB-INF/pages/SelectBRM.jsp").forward(request, response);
		}
	}

}
