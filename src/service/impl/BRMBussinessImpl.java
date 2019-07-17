package service.impl;

import java.sql.Date;
import java.util.ArrayList;

import domain.BorrAndRet;

public interface BRMBussinessImpl {
	
	
	public void addBRM(BorrAndRet br);
	
	public void updateBRM(BorrAndRet br);
	
	public void deleteBRM(int userid, String barcode);
	
	public void deleteBRM(int id);
	
	public BorrAndRet selectBRMById(int id);
	
	public BorrAndRet selectBRM(String barcode);
	
	public ArrayList<BorrAndRet> selectBRM(int userid);
	
	public BorrAndRet selectBRM(int userid, String barcode);
	
	public ArrayList<BorrAndRet> selectAllBRM();
	
	public void addReturnMess(int userid, String barcode, Date returndate);

	public void addBorrMess(BorrAndRet br);

	public ArrayList<BorrAndRet> selectBorrRetMessNoRet(int userid);
}
