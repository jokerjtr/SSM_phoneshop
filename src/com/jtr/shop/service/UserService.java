package com.jtr.shop.service;

import com.jtr.shop.Domain.UserCustor;
import com.jtr.shop.Domain.UserPxoyVo;

public interface UserService {
	UserCustor findUserByName(UserPxoyVo userPxoyVo);
	UserCustor findUserById(UserPxoyVo userPxoyVo);
	void insertUser(UserPxoyVo userPxoyVo);
	void updateUser(UserPxoyVo userPxoyVo);
	void deleteUserById(Integer id);
	UserCustor findUserByNameAndPassword(UserPxoyVo userPxoyVo);
	void updateUserByid(UserPxoyVo userPxoyVo);
}
