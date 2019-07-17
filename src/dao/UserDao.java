package dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import dao.impl.UserDaoImpl;
import domain.Admin;
import domain.Book;
import domain.User;
import util.JDBCUtil;


public class UserDao implements UserDaoImpl{
	@Override
	public void addUser(User user) {
		Connection conn = null;
		Statement st = null;
		ResultSet rs = null;
		try{
			conn = JDBCUtil.getConnection();
			String sql = "select userseq.nextval from dual";
			st = conn.createStatement();
			rs = st.executeQuery(sql);
			rs.next();
			int seq = rs.getInt(1);
			String sql1 = "insert into users values("+seq+",'"+user.getUserName()+"','"+user.getUserPassword()+"',"+user.getUserAge()+",'"+user.getUserTel()+"','"+user.getUserSex()+"')";
			rs = st.executeQuery(sql1);
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			JDBCUtil.release(rs, st, conn);
		}
	}

	@Override
	public void updateUser(User user) {
		Connection conn = null;
		PreparedStatement st = null;
		ResultSet rs = null;
		try{
			conn = JDBCUtil.getConnection();
			String sql = "update users set username=? and userpassword=? and userage=? and usertel=? and usersex=? where userid=?";
			st = conn.prepareStatement(sql);
			st.setString(1, user.getUserName());
			st.setString(2, user.getUserPassword());
			st.setInt(3, user.getUserAge());
			st.setString(4, user.getUserTel());
			st.setString(5, user.getUserSex()); 
			st.setInt(6, user.getUserId());
			st.executeQuery();
		}catch (Exception e) {
			e.getStackTrace();
		}finally{
			JDBCUtil.release(rs, st, conn);
		}
	}

	@Override
	public void deleteUser(int userid) {
		Connection conn = null;
		PreparedStatement st = null;
		try {
			conn = JDBCUtil.getConnection();
			String sql = "delete from users where userid=?";
			st = conn.prepareStatement(sql);
			st.setInt(1, userid);
			st.executeQuery();
		}catch(Exception e){
			e.getStackTrace();
		} finally {
			JDBCUtil.release(null, st, conn);
		}
	}
	

	@Override
	public User selectUser(int userid) {
		Connection conn = null;
		PreparedStatement st = null;
		ResultSet rs = null;
		try {
			conn = JDBCUtil.getConnection();
			String sql = "select * from users where userid=?";
			st = conn.prepareStatement(sql);
			st.setInt(1, userid);
			rs = st.executeQuery();
			rs.next();
			User user = new User(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getInt(4),rs.getString(5),rs.getString(6));
			return user;
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			JDBCUtil.release(rs, st, conn);
		}
		return null;
	}

	@Override
	public boolean isExistUserName(String username) {
		Connection conn = null;
		PreparedStatement st = null;
		ResultSet rs = null;
		try{
			conn = JDBCUtil.getConnection();
			String sql = "select * from users where username=?";
			st = conn.prepareStatement(sql);
			st.setString(1, username);
			rs = st.executeQuery();
			if(rs.next()){
				return true;
			}else{
				return false;
			}
		}catch(Exception e){
			e.getStackTrace();
		}finally{
			JDBCUtil.release(rs, null, conn);
		}
		return false;
	}

	@Override
	public User verifyNameAndPwd(String username, String userpassword) {
		Connection conn = null; 
		PreparedStatement st = null; 
		ResultSet rs = null;
		try{
			conn = JDBCUtil.getConnection();
			String sql = "select * from users where username = ? and userpassword = ?";
			st = conn.prepareStatement(sql);
			st.setString(1, username);
			st.setString(2, userpassword);
			rs = st.executeQuery();
			if(rs.next()){
				User user = new User(rs.getInt(1),username,userpassword);
				return user;
			}else{
				return null;
			}
		}catch(Exception e){
			e.getStackTrace();
		}finally{
			JDBCUtil.release(rs, null, conn);
		}
		return null;
	}	
}
