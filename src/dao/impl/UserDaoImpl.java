package dao.impl;

import java.util.ArrayList;

import domain.Book;
import domain.User;

public interface UserDaoImpl {
	
	public void addUser(User user);
	
	public void updateUser(User user);
	
	public void deleteUser(int userid);
	
	public User selectUser(int userid);

	/**
	 * 判断用户名是否重复
	 * @param username 用户用户名
	 * @return 如果重复 返回true 如果不重复 返回false
	 */
	public boolean isExistUserName(String username);
	
	/**
	 * 判断用户名和密码是否正确
	 * @param username	用户用户名
	 * @param userpwd	用户密码
	 * @return	如果用户名和密码都正确返回true 如果有错误则返回 false
	 */
	public User verifyNameAndPwd(String username,String userpassword); 
	
}
