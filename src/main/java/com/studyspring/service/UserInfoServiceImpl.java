package com.studyspring.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.studyspring.dao.UserInfoDao;
import com.studyspring.vo.UserInfoDeleteRequestVO;
import com.studyspring.vo.UserInfoEnrollRequestVO;
import com.studyspring.vo.UserInfoVO;

@Service
public class UserInfoServiceImpl implements UserInfoService{
	@Autowired
	UserInfoDao userInfoDao;
	
	@Override
	public String searchNameService(Map<String, Object> info) {
		return userInfoDao.searchNameDao(info);
	}

	@Override
	public int enrollUserInfoService(UserInfoEnrollRequestVO userInfoEnrollRequestVO) {
		return userInfoDao.enrollUserInfoDao(userInfoEnrollRequestVO);
	}

	@Override
	public List<UserInfoVO> getUserInfoListService() {
		return userInfoDao.getUserInfoListDao();
	}

	@Override
	public int deleteUserInfoService(UserInfoDeleteRequestVO userInfoDeleteRequestVO) {
		return userInfoDao.deleteUserInfoDao(userInfoDeleteRequestVO);
	}

	@Override
	public List<Map<String, Object>> searchUserInfoDBService(Map<String, Object> params) {
		return userInfoDao.searchUserInfoDBDao(params);
	}

	@Override
	public int updateUserInfoDBService(Map<String, Object> params) {
		return userInfoDao.updateUserInfoDBDao(params);
	}

	@Override
	public int deleteUserInfoDBService(Map<String, Object> params) {
		return userInfoDao.deleteUserInfoDBDao(params);
	}
}
