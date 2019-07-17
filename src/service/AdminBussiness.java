package service;

import java.util.ArrayList;

import dao.AdminDao;
import dao.impl.AdminDaoImpl;
import domain.Admin;
import service.impl.AdminBussinessImpl;



public class AdminBussiness implements AdminBussinessImpl {

	@Override
	public void addAdmin(Admin admin, String name) {
		// TODO Auto-generated method stub
	}

	@Override
	public void updateAdmin(Admin admin, String name) {
		// TODO Auto-generated method stub
	}

	@Override
	public void deleteAdmin(int adminid, String name) {
		// TODO Auto-generated method stub
	}

	@Override
	public ArrayList<Admin> selectAllAdmins(String name) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean isBooleanNameAndPwd(String name, String password) {
		AdminDaoImpl dao = new AdminDao();
		Admin admin = dao.selectAdmin(name);
		if(admin.getPassword().equals(password)){
			return true;
		}
		return false;
		
	}

	
}
