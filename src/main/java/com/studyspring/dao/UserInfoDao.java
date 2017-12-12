package com.studyspring.dao;

import java.util.List;
import java.util.Map;

import com.studyspring.vo.UserInfoDeleteRequestVO;
import com.studyspring.vo.UserInfoEnrollRequestVO;
import com.studyspring.vo.UserInfoVO;

public interface UserInfoDao {
	public String searchNameDao(Map<String, Object> info);
	public int enrollUserInfoDao(UserInfoEnrollRequestVO userInfoEnrollRequestVO);
	public List<UserInfoVO> getUserInfoListDao();
	public int deleteUserInfoDao(UserInfoDeleteRequestVO userInfoDeleteRequestVO);
	public List<Map<String, Object>> searchUserInfoDBDao(Map<String, Object> params);
	public int updateUserInfoDBDao(Map<String, Object> params);
	public int deleteUserInfoDBDao(Map<String, Object> params);
}
