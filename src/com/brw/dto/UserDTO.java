package com.brw.dto;

import java.io.Serializable;

public class UserDTO implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private String userId;
	private String userPassword;
	private String userName;
	private String userEmail;
	private String userNickName;
	private int userGrade;
	private int userPoint;
	private String userEnrollDate;
	
	public UserDTO() {}
	
	public UserDTO(String userId, String userPassword, String userName, String userEmail,String userNickName) {
		super();
		this.userId = userId;
		this.userPassword = userPassword;
		this.userName = userName;
		this.userEmail = userEmail;
		this.userNickName = userNickName;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserPassword() {
		return userPassword;
	}

	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserEmail() {
		return userEmail;
	}

	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}

	
	public String getUserNickName() {
		return userNickName;
	}

	public void setUserNickName(String userNickName) {
		this.userNickName = userNickName;
	}

	public int getUserGrade() {
		return userGrade;
	}

	public void setUserGrade(int userGrade) {
		this.userGrade = userGrade;
	}

	public int getUserPoint() {
		return userPoint;
	}

	public void setUserPoint(int userPoint) {
		this.userPoint = userPoint;
	}

	public String getUserEnrollDate() {
		return userEnrollDate;
	}

	public void setUserEnrollDate(String userEnrollDate) {
		this.userEnrollDate = userEnrollDate;
	}

	@Override
	public String toString() {
		return "UserDTO [userId=" + userId + ", userPassword=" + userPassword + ", userName=" + userName
				+ ", userEmail=" + userEmail + ", userNickName=" + userNickName + ", userGrade=" + userGrade
				+ ", userPoint=" + userPoint + "]";

	}

	
	
}
