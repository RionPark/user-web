package com.study.jwc.dao;

public interface UserInfoDAO {
	public int insertUserInfo(int tiNum, String tiName, int tiAge, String tiDesc);
	public int updateUserInfo();
	public int deleteUserInfo();
}
