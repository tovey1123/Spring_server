package com.yjde.springmvc;
import java.io.Serializable;

public class UserPO implements Serializable{
	private static final long serialVersionUID = 1520961851058396786L;
	private Integer userId;
	private String userName;
	private Integer userAge;

	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public Integer getUserAge() {
		return userAge;
	}

	public void setUserAge(Integer userAge) {
		this.userAge = userAge;
	}
}
