package service.impl;

import java.util.ArrayList;

import domain.User;
import exception.UserNameExistException;



public interface UserBussinessImpl {
	
	/**
	 * 
	 * @param user 用户对象
	 * @throws UserNameExistException 如果用户名存在则抛UserNameExistException异常
	 */
	public void register(User user) throws UserNameExistException;
	
	/**
	 * 
	 * @param username 用户用户名和密码是否正确
	 * @param userpwd  用户密码
	 * @return	判断是否正确
	 */
	public User login(String username, String userpwd);


	public void addUser(User user);
	
	public void updateUser(User user);
	
	public void deleteUser(int userid);
	
	public User selectUser(int userid);
	
}
