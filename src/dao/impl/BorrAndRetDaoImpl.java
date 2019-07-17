package dao.impl;

import java.sql.Date;
import java.util.ArrayList;

import domain.BorrAndRet;

public interface BorrAndRetDaoImpl {
	
	public void addBorrRetMess(BorrAndRet br);
	
	public void updateBorrRetMess(BorrAndRet br);
	
	public void deleteBorrRetMess(int userid,String barcode);
	
	public void deleteBorrRetMess(int id);
	
	public BorrAndRet selectBorrRetMessById(int id);
	
	public BorrAndRet selectBorrRetMess(String barcode);
	
	public ArrayList<BorrAndRet> selectBorrRetMess(int userid);
	
	public BorrAndRet selectBorrRetMess(int userid,String barcode);

	public ArrayList<BorrAndRet> selectAllBorrRetMess();

	public void addReturnMess(int userid, String barcode, Date returndate);

	public void addBorrMess(BorrAndRet br);

	public ArrayList<BorrAndRet> selectBorrRetMessNoRet(int userid);

}
