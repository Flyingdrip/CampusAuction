package com.model;

/**
 * TAdmin generated by MyEclipse Persistence Tools 
 * 对应一个“管理员”
 */

public class TAdmin implements java.io.Serializable {
	
	private Integer userId;//用户ID
	private String userName;//用户名
	private String userPw;//密码

	/** 
	 * 默认构造方法 
	 */
	public TAdmin() {
	}
	/**
	 * 根据成员变量进行构造方法的完成工作
	 * @param userName
	 * @param userPw
	 */
	public TAdmin(String userName, String userPw) {
		this.userName = userName;
		this.userPw = userPw;
	}

	public String getUserName() {
		return this.userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserPw() {
		return this.userPw;
	}

	public void setUserPw(String userPw) {
		this.userPw = userPw;
	}

	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}
}