package test;


import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashSet;
import java.util.Random;

import javax.enterprise.inject.New;import javax.persistence.criteria.CriteriaBuilder.In;

import org.junit.Test;

import dao.AdminDao;
import dao.BookDao;
import dao.BookOtherDao;
import dao.BorrAndRetDao;
import dao.UserDao;
import dao.impl.AdminDaoImpl;
import dao.impl.BookOtherDaoImpl;
import dao.impl.UserDaoImpl;
import domain.Admin;
import domain.Book;
import domain.BookOther;
import domain.BorrAndRet;
import domain.User;
import service.BRMBussiness;
import service.BookBussiness;
import service.BookOtherBussiness;
import service.impl.BRMBussinessImpl;
import service.impl.BookBussinessImpl;
import service.impl.BookOtherBussinessImpl;
import util.JDBCUtil;

public class Test1 {
	public static void main(String[] args) {
		BookBussiness buss = new BookBussiness();
		System.out.println(buss.weeklyRecommended().size());
	}

	

}
