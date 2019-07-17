package domain;

import java.sql.Date;

public class User {
	
	private int userId;
	
	private String userName;
	
	private String userPassword;
	
	private int userAge;
	
	private String userTel;
	
	private String userSex;
	


	
	public User() {
		
	}
	
	public User(String userName,String userPassword){
		this.userName = userName;
		this.userPassword = userPassword;
	}
	

	public User(int userId, String userName, String userPassword) {
		super();
		this.userId = userId;
		this.userName = userName;
		this.userPassword = userPassword;
	}

	

	public User(String userName, String userPassword, int userAge, String userTel, String userSex) {
		super();
		this.userName = userName;
		this.userPassword = userPassword;
		this.userAge = userAge;
		this.userTel = userTel;
		this.userSex = userSex;
	}


	public User(int userId, String userName, String userPassword, int userAge, String userTel, String userSex) {
		super();
		this.userId = userId;
		this.userName = userName;
		this.userPassword = userPassword;
		this.userAge = userAge;
		this.userTel = userTel;
		this.userSex = userSex;
		
	}

	public int getUserId() {
		return userId;
	}



	public void setUserId(int userId) {
		this.userId = userId;
	}



	public String getUserName() {
		return userName;
	}



	public void setUserName(String userName) {
		this.userName = userName;
	}



	public String getUserPassword() {
		return userPassword;
	}



	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}



	public int getUserAge() {
		return userAge;
	}



	public void setUserAge(int userAge) {
		this.userAge = userAge;
	}



	public String getUserTel() {
		return userTel;
	}



	public void setUserTel(String userTel) {
		this.userTel = userTel;
	}



	public String getUserSex() {
		return userSex;
	}



	public void setUserSex(String userSex) {
		this.userSex = userSex;
	}



	@Override
	public String toString() {
		return "User [userId=" + userId + ", userName=" + userName + ", userPassword=" + userPassword + ", userAge="
				+ userAge + ", userTel=" + userTel + ", userSex=" + userSex + ", userRegTime=]";
	}

	
}
