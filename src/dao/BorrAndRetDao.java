package dao;


import java.lang.reflect.Array;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import javax.naming.spi.DirStateFactory.Result;

import dao.impl.BorrAndRetDaoImpl;
import domain.BorrAndRet;
import util.JDBCUtil;

public class BorrAndRetDao implements BorrAndRetDaoImpl{

	@Override
	public void addBorrRetMess(BorrAndRet br) {
		Connection conn = null;
		Statement st = null;
		ResultSet rs = null;
		try {
			conn = JDBCUtil.getConnection();
			String sql = "select borrandretseq.nextval from dual";
			st = conn.createStatement();
			rs = st.executeQuery(sql);
			rs.next();
			int seq = rs.getInt(1);
			String sql1 = "insert into borrandret values("+seq+","+br.getUserId()+",'"+br.getBarCode()+"',to_date('"+br.getBorrDate()+"','yyyy-MM-DD')"+br.getBorrTime()+",to_date('"+br.getReturnDate()+"','yyyy-MM-DD')"+",to_date('"+br.getLatestretDate()+"','yyyy-MM-DD'))";
			rs = st.executeQuery(sql1);
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			JDBCUtil.release(rs, st, conn);
		}
		
		
	}
	
	@Override
	public void addBorrMess(BorrAndRet br){
		Connection conn = null;
		Statement st = null;
		ResultSet rs = null;
		try {
			conn = JDBCUtil.getConnection();
			String sql = "select borrandretseq.nextval from dual";
			st = conn.createStatement();
			rs = st.executeQuery(sql);
			rs.next();
			int seq = rs.getInt(1);
			String sql1 = "insert into borrandret(id,userid,barcode,borrdate,borrtime,latestretdate,ifborrow) values("+seq+","+br.getUserId()+",'"+br.getBarCode()+"',to_date('"+br.getBorrDate()+"','yyyy-MM-DD'),"+br.getBorrTime()+",to_date('"+br.getLatestretDate()+"','yyyy-MM-DD'),1)";
			st.executeQuery(sql1);
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			JDBCUtil.release(rs, st, conn);
		}
	}
	
	@Override
	public void addReturnMess(int userid,String barcode,Date returndate){
		Connection conn = null;
		PreparedStatement st = null;
		ResultSet rs = null;
		try{
			conn = JDBCUtil.getConnection();
			String sql = "update borrandret set retdate=?,ifborrow=0 where userid=? and barcode=?";
			st = conn.prepareStatement(sql);
			st.setDate(1,returndate);
			st.setInt(2, userid);
			st.setString(3, barcode);
			st.executeQuery();
		} catch(SQLException e){
			e.printStackTrace();
		} finally{
			JDBCUtil.release(rs, st, conn);
		}
	}
	
	@Override
	public void updateBorrRetMess(BorrAndRet br) {
		Connection conn = null;
		PreparedStatement st = null;
		ResultSet rs = null;
		try {
			conn = JDBCUtil.getConnection();
			String sql = "update borrandret set userid=? and barcode=? and borrdate=? borrtime=? and returndate=? and latestreturndate=? where id=?";
			st = conn.prepareStatement(sql);
			st.setInt(1, br.getUserId());
			st.setString(2, br.getBarCode());
			st.setDate(3, br.getBorrDate());
			st.setInt(4, br.getBorrTime());
			st.setDate(5, br.getReturnDate());
			st.setDate(6, br.getLatestretDate());
			st.setInt(7, br.getId());
			rs = st.executeQuery();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			JDBCUtil.release(rs, st, conn);
		}
		
	}
	

	@Override
	public void deleteBorrRetMess(int userid, String barcode) {
		Connection conn = null;
		PreparedStatement st = null;
		ResultSet rs = null;
		try{
			conn = JDBCUtil.getConnection();
			String sql = "delete from borrandret where userid=? and barcode=?";
			st = conn.prepareStatement(sql);
			st.setInt(1, userid);
			st.setString(2,barcode);
			rs = st.executeQuery();
		} catch (SQLException e){
			e.printStackTrace();
		} finally{
			JDBCUtil.release(rs, st, conn);
		}
	}

	@Override
	public void deleteBorrRetMess(int id) {
		Connection conn = null;
		PreparedStatement st = null;
		ResultSet rs = null;
		try{
			conn = JDBCUtil.getConnection();
			String sql = "delete from borrandret where id=?";
			st = conn.prepareStatement(sql);
			st.setInt(1, id);
			rs = st.executeQuery();
		} catch (SQLException e){
			e.printStackTrace();
		} finally{
			JDBCUtil.release(rs, st, conn);
		}
	}

	@Override
	public BorrAndRet selectBorrRetMessById(int id) {
		Connection conn = null;
		PreparedStatement st = null;
		ResultSet rs = null;
		try{
			conn = JDBCUtil.getConnection();
			String sql = "select * from borrandret where id = ?";
			st = conn.prepareStatement(sql);
			st.setInt(1, id);
			rs = st.executeQuery();
			rs.next();
			BorrAndRet br = new BorrAndRet(rs.getInt(1),rs.getInt(2),rs.getString(3),rs.getDate(4),rs.getInt(5),rs.getDate(6), rs.getDate(7),rs.getInt(8));
			return br;
		}catch (SQLException e){
			e.printStackTrace();
		} finally{
			JDBCUtil.release(rs, st, conn);
		}
		return null;
	}
	

	@Override
	public BorrAndRet selectBorrRetMess(String barcode) {
		Connection conn = null;
		PreparedStatement st = null;
		ResultSet rs = null;
		try{
			conn = JDBCUtil.getConnection();
			String sql = "select * from borrandret where barcode = ?";
			st = conn.prepareStatement(sql);
			st.setString(1, barcode);
			rs = st.executeQuery();
			rs.next();
			BorrAndRet br = new BorrAndRet(rs.getInt(1),rs.getInt(2),rs.getString(3),rs.getDate(4),rs.getInt(5),rs.getDate(6),rs.getDate(7),rs.getInt(8));
			return br;
		}catch (SQLException e){
			e.printStackTrace();
		} finally{
			JDBCUtil.release(rs, st, conn);
		}
		return null;
	}
	
	//查找此用户所有的借阅信息
	@Override
	public ArrayList<BorrAndRet> selectBorrRetMess(int userid) {
		Connection conn = null;
		PreparedStatement st = null;
		ResultSet rs = null;
		try {
			conn = JDBCUtil.getConnection();
			String sql = "select * from borrandret where userid = ?";
			st = conn.prepareStatement(sql);
			st.setInt(1, userid);
			rs = st.executeQuery();
			ArrayList<BorrAndRet> al = new ArrayList<BorrAndRet>();
			while(rs.next()){
				BorrAndRet br = new BorrAndRet(rs.getInt(1),rs.getInt(2),rs.getString(3),rs.getDate(4),rs.getInt(5),rs.getDate(6),rs.getDate(7),rs.getInt(8));
				al.add(br);
			}
			return al;
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			JDBCUtil.release(rs, st, conn);
		}
		return null;
	}
	
	
	//查找此用户已借未还的借阅信息
	@Override
	public ArrayList<BorrAndRet> selectBorrRetMessNoRet(int userid) {
		Connection conn = null;
		PreparedStatement st = null;
		ResultSet rs = null;
		try {
			conn = JDBCUtil.getConnection();
			String sql = "select * from borrandret where userid = ? and ifborrow=1";
			st = conn.prepareStatement(sql);
			st.setInt(1, userid);
			rs = st.executeQuery();
			ArrayList<BorrAndRet> al = new ArrayList<BorrAndRet>();
			while(rs.next()){
				BorrAndRet br = new BorrAndRet(rs.getInt(1),rs.getInt(2),rs.getString(3),rs.getDate(4),rs.getInt(5),rs.getDate(6),rs.getDate(7),rs.getInt(8));
				al.add(br);
			}
			return al;
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			JDBCUtil.release(rs, st, conn);
		}
		return null;
	}


	@Override
	public BorrAndRet selectBorrRetMess(int userid, String barcode) {
		Connection conn = null;
		PreparedStatement st = null;
		ResultSet rs = null;
		try{
			conn = JDBCUtil.getConnection();
			String sql = "select * from borrandret where userid = ? and barcode = ?";
			st = conn.prepareStatement(sql);
			st.setInt(1, userid);
			st.setString(2, barcode);
			rs = st.executeQuery();
			rs.next();
			BorrAndRet br = new BorrAndRet(rs.getInt(1),rs.getInt(2),rs.getString(3),rs.getDate(4),rs.getInt(5),rs.getDate(6),rs.getDate(7),rs.getInt(8));
			return br;
		}catch (SQLException e){
			e.printStackTrace();
		} finally{
			JDBCUtil.release(rs, st, conn);
		}
		return null;
	}
	
	@Override
	public ArrayList<BorrAndRet> selectAllBorrRetMess() {
		Connection conn = null;
		PreparedStatement st = null;
		ResultSet rs = null;
		try {
			conn = JDBCUtil.getConnection();
			String sql = "select * from borrandret";
			st = conn.prepareStatement(sql);
			rs = st.executeQuery();
			ArrayList<BorrAndRet> al = new ArrayList<BorrAndRet>();
			while(rs.next()){
				BorrAndRet br = new BorrAndRet(rs.getInt(1),rs.getInt(2),rs.getString(3),rs.getDate(4),rs.getInt(5),rs.getDate(6),rs.getDate(7),rs.getInt(8));
				al.add(br);
			}
			return al;
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			JDBCUtil.release(rs, st, conn);
		}
		return null;
	}
	
}
