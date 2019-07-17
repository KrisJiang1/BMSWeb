package dao.impl;

import java.util.ArrayList;

import domain.Admin;

public interface AdminDaoImpl {

	public void addAdmin(Admin admin);
	
	public void updateAdmin(Admin admin);
	
	public void deleteAdmin(int adminid);
	
	public Admin selectAdmin(String adminname);
}
