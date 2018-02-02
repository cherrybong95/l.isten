package org.edu.lotte.model;

public class MemberVO {
private String userId;
private String passWord;
public MemberVO(String userId, String passWord) {
	super();
	this.userId = userId;
	this.passWord = passWord;
}
public MemberVO() {
	super();
	// TODO Auto-generated constructor stub
}
public String getUserId() {
	return userId;
}
public void setUserId(String userId) {
	this.userId = userId;
}
public String getPassWord() {
	return passWord;
}
public void setPassWord(String passWord) {
	this.passWord = passWord;
}
@Override
public String toString() {
	return "MemberVO [userId=" + userId + ", passWord=" + passWord + "]";
}


}
