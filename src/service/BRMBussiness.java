package service;

import java.sql.Date;
import java.util.ArrayList;

import dao.BorrAndRetDao;
import dao.impl.BorrAndRetDaoImpl;
import domain.BorrAndRet;
import service.impl.BRMBussinessImpl;

public class BRMBussiness implements BRMBussinessImpl{
	
	BorrAndRetDaoImpl dao = new BorrAndRetDao();
	
	@Override
	public void addBRM(BorrAndRet br) {
		dao.addBorrRetMess(br);
	}
	@Override
	public void addBorrMess(BorrAndRet br){
		dao.addBorrMess(br);
	}
	
	@Override
	public void addReturnMess(int userid,String barcode,Date returndate){
		dao.addReturnMess(userid, barcode, returndate);
	}

	@Override
	public void updateBRM(BorrAndRet br) {
		dao.updateBorrRetMess(br);
	}

	@Override
	public void deleteBRM(int userid, String barcode) {
		dao.deleteBorrRetMess(userid,barcode);
	}

	@Override
	public void deleteBRM(int id) {
		dao.deleteBorrRetMess(id);
	}

	@Override
	public BorrAndRet selectBRMById(int id) {
		return dao.selectBorrRetMessById(id);
	}

	@Override
	public BorrAndRet selectBRM(String barcode) {
		return dao.selectBorrRetMess(barcode);
	}

	@Override
	public ArrayList<BorrAndRet> selectBRM(int userid) {
		return dao.selectBorrRetMess(userid);
	}

	@Override
	public BorrAndRet selectBRM(int userid, String barcode) {
		return dao.selectBorrRetMess(userid, barcode);
	}

	@Override
	public ArrayList<BorrAndRet> selectAllBRM() {
		return dao.selectAllBorrRetMess();
	}
	
	@Override
	public ArrayList<BorrAndRet> selectBorrRetMessNoRet(int userid){
		return dao.selectBorrRetMessNoRet(userid);
	}

}
