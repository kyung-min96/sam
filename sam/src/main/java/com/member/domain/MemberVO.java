package com.member.domain;

import java.util.Date;

public class MemberVO {
	/*
	create table tbl_member (
		userId      		varchar(30)		not null,
		userPass		varchar(100)		not null,
		userName		varchar(30)		not null,
		nickName		varchar(30)		not null,
		regDate			timestamp		not null	default now(),
		updateDate	timestamp		not null	default now(),
		primary key(userId),
		unique (nickName)
	);
	*/
	private String userId;
	private String userPass;
	private String userName;
	private String nickName;
	private Date regDate;
	private Date updateDate;
	
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserPass() {
		return userPass;
	}
	public void setUserPass(String userPass) {
		this.userPass = userPass;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getNickName() {
		return nickName;
	}
	public void setNickName(String nickName) {
		this.nickName = nickName;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	public Date getUpdateDate() {
		return updateDate;
	}
	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}
	
}
