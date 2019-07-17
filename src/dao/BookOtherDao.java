package dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Calendar;

import dao.impl.BookOtherDaoImpl;
import domain.Book;
import domain.BookOther;
import util.JDBCUtil;

public class BookOtherDao implements BookOtherDaoImpl{

	@Override
	public void addBookOther(BookOther bookother) {
		Connection conn = null;
		Statement st = null;
		ResultSet rs = null;
		try{
			conn = JDBCUtil.getConnection();
			String sql = "select to_char(bookotherseq.nextval,'000') from dual";
			st = conn.createStatement();
			rs = st.executeQuery(sql);
			rs.next();
			int seq = rs.getInt(1);
			System.out.println(seq);
			Calendar cal = Calendar.getInstance();
			int year = cal.get(Calendar.YEAR);
			int month = cal.get(Calendar.MONTH)+1;
			int day = cal.get(Calendar.DAY_OF_MONTH);
			String month1 = (String) (month>10?month:0+""+String.valueOf(month));
			String zero = null;
			if(seq<=9){
				zero="00";
			}else if(seq>9&&seq<99){
				zero="0";
			}else if(seq>99){
				zero="";
			}
			String barCode = year+""+month1+""+day+zero+seq;
			String sql1 = "insert into bookother values("+bookother.getBookId()+","+bookother.getIfBorrowed()+",'"+barCode+"')";
			rs = st.executeQuery(sql1);
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			JDBCUtil.release(rs, st, conn);
		}
	}

	@Override
	public void updateBookStatus(String barcode,int ifBorrowed) {
		Connection conn = null;
		PreparedStatement st = null;
		ResultSet rs = null;
		try{
			conn = JDBCUtil.getConnection();
			String sql = "update bookother set ifBorrowed=? where barcode=?";
			st = conn.prepareStatement(sql);
			st.setInt(1, ifBorrowed);
			st.setString(2, barcode);
			st.executeQuery();
		}catch (Exception e) {
			e.getStackTrace();
		}finally{
			JDBCUtil.release(rs, st, conn);
		}
	}

	@Override
	public void deleteBookOther(String barCode) {
		Connection conn = null;
		PreparedStatement st = null;
		try {
			conn = JDBCUtil.getConnection();
			String sql = "delete from bookother where barCode=?";
			st = conn.prepareStatement(sql);
			st.setString(1, barCode);
			st.executeQuery();
		}catch(Exception e){
			e.getStackTrace();
		} finally {
			JDBCUtil.release(null, st, conn);
		}
	}
	
	@Override
	public ArrayList<BookOther> selectBookOtherById(int bookid) {
		Connection conn = null;
		PreparedStatement st = null;
		ResultSet rs = null;
		try{
			conn = JDBCUtil.getConnection();
			String sql = "select * from bookother where bookid=?";
			st = conn.prepareStatement(sql);
			st.setInt(1, bookid);
			st.executeQuery();
			ArrayList<BookOther> al = new ArrayList<BookOther>();
			while(rs.next()){
				BookOther book = new BookOther(rs.getInt(1),rs.getInt(2),rs.getString(3));
				al.add(book);
			}
			return al;
		}catch(Exception e){
			e.getStackTrace();
		} finally {
			JDBCUtil.release(null, st, conn);
		}
			return null;
	}
	
	@Override
	public ArrayList<String> selectBarCode(int bookid,int ifBorrowed) {
		Connection conn = null;
		PreparedStatement st = null;
		ResultSet rs = null;
		try{
			conn = JDBCUtil.getConnection();
			String sql = "select barcode from bookother where bookid=? and ifBorrowed=?";
			st = conn.prepareStatement(sql);
			st.setInt(1, bookid);
			st.setInt(2, ifBorrowed);
			rs = st.executeQuery();
			ArrayList<String> al = new ArrayList<String>();
			while(rs.next()){
				al.add(rs.getString(1));
			}
			return al;
		}catch(Exception e){
			e.getStackTrace();
		} finally {
			JDBCUtil.release(null, st, conn);
		}
		return null;
	}
	
	@Override
	public boolean selectIfHasBook(int bookid) {
		Connection conn = null;
		PreparedStatement st = null;
		ResultSet rs = null;
		try{
			conn = JDBCUtil.getConnection();
			String sql = "select * from bookother where bookid = ? and ifBorrowed=0";
			st = conn.prepareStatement(sql);
			st.setInt(1, bookid);
			rs = st.executeQuery();
			if(rs.next()){
				return true;
			}else{
				return false;
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			JDBCUtil.release(rs, st, conn);
		}
		return false;
	}

	@Override
	public BookOther selectBookOtherByCode(String barCode) {
		Connection conn = null;
		PreparedStatement st = null;
		ResultSet rs = null;
		try{
			conn = JDBCUtil.getConnection();
			String sql = "select * from bookother where barCode = ?";
			st = conn.prepareStatement(sql);
			st.setString(1, barCode);
			rs = st.executeQuery();
			rs.next();
			BookOther bookother = new BookOther(rs.getInt(1),rs.getInt(2),rs.getString(3));
			return bookother;
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			JDBCUtil.release(rs, st, conn);
		}
		return null;
	}

}
