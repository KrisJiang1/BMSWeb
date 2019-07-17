package bean;

import java.util.HashMap;
import java.util.Map;

public class UserFormBean {
	private String username;
	private String userpwd;
	private String userrepwd;
	
	//存储校验错误信息的
	private Map<String,String> errors =  new HashMap<String,String>();
	
	public UserFormBean(){
		super();
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getUserpwd() {
		return userpwd;
	}

	public void setUserpwd(String userpwd) {
		this.userpwd = userpwd;
	}

	public String getUserrepwd() {
		return userrepwd;
	}

	public void setUserrepwd(String userrepwd) {
		this.userrepwd = userrepwd;
	}

	public Map<String, String> getErrors() {
		return errors;
	}

	public void setErrors(Map<String, String> errors) {
		this.errors = errors;
	}
	
	public boolean validate(){
		if(username == null||username==""){
			errors.put("username", "用户名不能为空");
		}
		if(userpwd == null||userpwd==""){
			errors.put("userpwd", "密码不能为空");
		}
		if(userrepwd == null||userrepwd==""){
			errors.put("userrepwd", "确认密码不能为空");
		}
		if(!(userrepwd.equals(userpwd))){
			errors.put("userrepwd","两次输入的密码不同");
		}
		return errors.isEmpty();
		
	}
		
	
}
