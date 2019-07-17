package dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import javax.swing.JButton;

import dao.impl.BookDaoImpl;
import domain.Admin;
import domain.Book;
import domain.User;
import util.JDBCUtil;

public class BookDao implements BookDaoImpl{

	@Override
	public void addBook(Book book) {
		Connection conn = null;
		Statement st = null;
		ResultSet rs = null;
		try{
			conn = JDBCUtil.getConnection();
			String sql = "select bookseq.nextval from dual";
			st = conn.createStatement();
			rs = st.executeQuery(sql);
			rs.next();
			int seq = rs.getInt(1);
			String sql1 = "insert into book values("+seq+",'"+book.getBookName()+"','"+book.getBookType()+"','"+book.getBookAuthor()+"',"+book.getBookPageNum()+",'"+book.getBookTranslator()+"',to_date('"+book.getBookLibtime()+"','yyyy-MM-DD')"+","+book.getBookPrice()+",'"+book.getBookPub()+"','"+book.getBookSynopsi()+"')";
			rs = st.executeQuery(sql1);
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			JDBCUtil.release(rs, st, conn);
		}
	}

	@Override
	public void updateBook(Book book) {
		Connection conn = null;
		PreparedStatement st = null;
		ResultSet rs = null;
		try{
			conn = JDBCUtil.getConnection();
			String sql = "update book set bookname=? and booktype=? and bookauthor=? and bookpagenum=? and booktranslator=? and booklibtime=? and bookprice=? and bookpub=? and booksynopsi=? where bookid=?";
			st = conn.prepareStatement(sql);
			st.setString(1, book.getBookName());
			st.setString(2, book.getBookType());
			st.setString(3, book.getBookAuthor());
			st.setInt(4, book.getBookPageNum());
			st.setString(5, book.getBookTranslator());
			st.setDate(6, book.getBookLibtime());
			st.setDouble(6, book.getBookPrice());
			st.setString(7, book.getBookPub());
			st.setString(8, book.getBookSynopsi());
			st.setInt(9,book.getBookId() );
			st.executeQuery();
		}catch (Exception e) {
			e.getStackTrace();
		}finally{
			JDBCUtil.release(rs, st, conn);
		}
		
	}

	@Override
	public void deleteBook(int bookid) {
		Connection conn = null;
		PreparedStatement st = null;
		try {
			conn = JDBCUtil.getConnection();
			String sql = "delete from book where bookid=?";
			st = conn.prepareStatement(sql);
			st.setInt(1, bookid);
			st.executeQuery();
		}catch(Exception e){
			e.getStackTrace();
		} finally {
			JDBCUtil.release(null, st, conn);
		}
	}

	@Override
	public Book selectBook(int bookid) {
		Connection conn = null;
		PreparedStatement st = null;
		ResultSet rs = null;
		try{
			conn = JDBCUtil.getConnection();
			String sql = "select * from book where bookid=?";
			st= conn.prepareStatement(sql);
			st.setInt(1, bookid);
			rs = st.executeQuery();
			rs.next();
			Book book = new Book(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getInt(5),rs.getString(6),rs.getDate(7),rs.getDouble(8),rs.getString(9),rs.getString(10));
			return book;
		}catch(Exception e){
			e.getStackTrace();
		} finally {
			JDBCUtil.release(rs, st, conn);
		}
		return null;
	}
	

	@Override
	public Book selectBook(String bookname) {
		Connection conn = null;
		PreparedStatement st = null;
		ResultSet rs = null;
		try{
			conn = JDBCUtil.getConnection();
			String sql = "select * from book where bookname=?";
			st= conn.prepareStatement(sql);
			st.setString(1, bookname);
			rs = st.executeQuery();
			rs.next();
			Book book = new Book(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getInt(5),rs.getString(6),rs.getDate(7),rs.getDouble(8),rs.getString(9),rs.getString(10));
			return book;
		}catch(Exception e){
			e.getStackTrace();
		} finally {
			JDBCUtil.release(null, st, conn);
		}
		return null;
	}
	
	
	@Override
	public Book selectBookByBookId(int bookid) {
		Connection conn = null;
		PreparedStatement st = null;
		ResultSet rs = null;
		try{
			conn = JDBCUtil.getConnection();
			String sql = "select * from book where bookid=?";
			st= conn.prepareStatement(sql);
			st.setInt(1, bookid);
			rs = st.executeQuery();
			rs.next();
			Book book = new Book(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getInt(5),rs.getString(6),rs.getDate(7),rs.getDouble(8),rs.getString(9),rs.getString(10));
			return book;
		}catch(Exception e){
			e.getStackTrace();
		} finally {
			JDBCUtil.release(null, st, conn);
		}
		return null;
	}
	
	@Override
	public ArrayList<Book> selectBookByKeyWord(String keyword){
		Connection conn = null;
		Statement st = null;
		ResultSet rs = null;
		try{
			conn = JDBCUtil.getConnection();
			String sql = "select * from book where bookname like '%"+keyword+"%'";
			st = conn.createStatement();
			rs = st.executeQuery(sql);
			ArrayList<Book> al = new ArrayList<Book>();
			while(rs.next()){
				Book book = new Book(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getInt(5),rs.getString(6),rs.getDate(7),rs.getDouble(8),rs.getString(9),rs.getString(10));
				al.add(book);
			}
			return al;
		}catch(Exception e){
			e.getStackTrace();
		}finally{
			JDBCUtil.release(rs, st, conn);
		}
		return null;
	}
	@Override
	public ArrayList<Book> selectBookByType(String booktype) {
		Connection conn = null;
		PreparedStatement st = null;
		ResultSet rs = null;
		
		try{
			conn = JDBCUtil.getConnection();
			String sql = "select * from book where booktype=?";
			st = conn.prepareStatement(sql);
			st.setString(1, booktype);
			rs = st.executeQuery();
			ArrayList<Book> al = new ArrayList<Book>();
			while(rs.next()){
				Book book = new Book(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getInt(5),rs.getString(6),rs.getDate(7),rs.getDouble(8),rs.getString(9),rs.getString(10));
				al.add(book);
			}
			return al;
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			JDBCUtil.release(rs, null, conn);
		}
		return null;
	}
	
	@Override
	public ArrayList<Book> selectBookByAuthor(String bookauthor) {
		Connection conn = null;
		PreparedStatement st = null;
		ResultSet rs = null;
		
		try{
			conn = JDBCUtil.getConnection();
			String sql = "select * from book where bookauther=?";
			st = conn.prepareStatement(sql);
			st.setString(1, bookauthor);
			rs = st.executeQuery();
			ArrayList<Book> al = new ArrayList<Book>();
			while(rs.next()){
				Book book = new Book(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getInt(5),rs.getString(6),rs.getDate(7),rs.getDouble(8),rs.getString(9),rs.getString(10));
				al.add(book);
			}
			return al;
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			JDBCUtil.release(rs, null, conn);
		}
		return null;
	}
	
	
	@Override
	public ArrayList<Integer> selectAllBookId(){
		Connection conn = null;
		PreparedStatement st = null;
		ResultSet rs = null;
		try{
			conn = JDBCUtil.getConnection();
			String sql = "select * from book";
			st = conn.prepareStatement(sql);
			rs = st.executeQuery();
			ArrayList<Integer> al = new ArrayList<Integer>();
			while(rs.next()){
				al.add(rs.getInt(1));
			}
			return al;
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			JDBCUtil.release(rs, null, conn);
		}
		return null;
	}
	
	@Override
	public ArrayList<Book> selectAllBook(){
		Connection conn = null;
		PreparedStatement st = null;
		ResultSet rs = null;
		try{
			conn = JDBCUtil.getConnection();
			String sql = "select * from book";
			st = conn.prepareStatement(sql);
			rs = st.executeQuery();
			ArrayList<Book> al = new ArrayList<Book>();
			while(rs.next()){
				Book book = new Book(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getInt(5),rs.getString(6),rs.getDate(7),rs.getDouble(8),rs.getString(9),rs.getString(10));
				al.add(book);
			}
			return al;
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			JDBCUtil.release(rs, null, conn);
		}
		return null;
	}
	
	
	
}
