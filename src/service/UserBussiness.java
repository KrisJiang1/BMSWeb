package service;

import java.util.ArrayList;

import dao.UserDao;
import dao.impl.UserDaoImpl;
import domain.User;
import exception.UserNameExistException;
import service.impl.UserBussinessImpl;



public class UserBussiness implements UserBussinessImpl {
	
	UserDaoImpl dao = new UserDao();
	
	@Override
	public void register(User user) throws UserNameExistException{
		if(dao.isExistUserName(user.getUserName())){
			throw new UserNameExistException("用户名重复");
		}else{
			dao.addUser(user);
		}
	}
		
	
	@Override
	public User login(String username,String userpwd){
		return dao.verifyNameAndPwd(username, userpwd);
	}


	@Override
	public void addUser(User user) {
		dao.addUser(user);
	}


	@Override
	public void updateUser(User user) {
		dao.updateUser(user);
	}


	@Override
	public void deleteUser(int userid) {
		dao.deleteUser(userid);
	}

	@Override
	public User selectUser(int userid) {
		return dao.selectUser(userid);
	}

}
