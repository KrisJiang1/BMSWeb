package service.impl;

import java.util.ArrayList;

import domain.Admin;

public interface AdminBussinessImpl {
	
	public void addAdmin(Admin admin,String adminname);

	public void updateAdmin(Admin admin, String adminname);

	public void deleteAdmin(int adminid, String adminname);

	public ArrayList<Admin> selectAllAdmins(String adminname);

	public boolean isBooleanNameAndPwd(String adminname, String adminpwd);

}
