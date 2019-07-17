package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import dao.impl.AdminDaoImpl;
import domain.Admin;
import domain.Book;
import util.JDBCUtil;

public class AdminDao implements AdminDaoImpl{

	@Override
	public void addAdmin(Admin admin) {
		Connection conn = null;
		Statement st = null;
		ResultSet rs = null;
		try {
			conn = JDBCUtil.getConnection();
			String sql = "select adminseq.nextval from dual";
			st = conn.createStatement();
			rs = st.executeQuery(sql);
			rs.next();
			int seq = rs.getInt(1);
			String sql1 = "insert into admin values("+seq+",'"+admin.getName()+"','"+admin.getPassword()+"','"+admin.getType()+"')";
			rs = st.executeQuery(sql1);
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			JDBCUtil.release(rs, st, conn);
		}
		
	}		

	@Override
	public void updateAdmin(Admin admin) {
		Connection conn = null;
		PreparedStatement st = null;
		try{
			conn = JDBCUtil.getConnection();
			String sql = "update admin set name=? and password=?";
			 st = conn.prepareStatement(sql);
			 st.setString(1, admin.getName());
			 st.setString(2, admin.getPassword());
			 st.executeQuery();
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			JDBCUtil.release(null, st, conn);
		}
		
	}

	@Override
	public void deleteAdmin(int id) {
		Connection conn = null;
		PreparedStatement st = null;
		try{
			conn = JDBCUtil.getConnection();
			String sql = "delete from admin where id=? ";
			st.setInt(1,id);
			st.executeQuery();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			JDBCUtil.release(null, st, conn);
		}
		
	}

	@Override
	public Admin selectAdmin(String name) {
		Connection conn = null;
		PreparedStatement st = null;
		ResultSet rs = null;
		try{
			conn = JDBCUtil.getConnection();
			String sql = "select * from admin where name = ?";
			st = conn.prepareStatement(sql);
			st.setString(1, name);
			rs = st.executeQuery();
			rs.next();
			Admin admin = new Admin(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4));
			return admin;
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			JDBCUtil.release(rs, st, conn);
		}
		return null;
	}


}
