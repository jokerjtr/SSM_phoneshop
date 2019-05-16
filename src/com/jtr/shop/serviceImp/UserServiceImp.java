package com.jtr.shop.serviceImp;

import org.springframework.beans.factory.annotation.Autowired;

import com.jtr.shop.Domain.UserCustor;
import com.jtr.shop.Domain.UserPxoyVo;
import com.jtr.shop.mapper.UserMapper;
import com.jtr.shop.service.UserService;

public class UserServiceImp implements UserService {
	@Autowired
    private UserMapper usermapper;
	@Override
	public UserCustor findUserByName(UserPxoyVo userPxoyVo) {
		// TODO Auto-generated method stub
               UserCustor userCustor= usermapper.findUserByName(userPxoyVo);
               return userCustor;
	}

	@Override
	public void insertUser(UserPxoyVo userPxoyVo) {
		// TODO Auto-generated method stub
                    usermapper.insertUser(userPxoyVo);
	}

	@Override
	public void updateUser(UserPxoyVo userPxoyVo) {
		// TODO Auto-generated method stub
		  usermapper.updateUser(userPxoyVo);

	}

	@Override
	public void deleteUserById(Integer id) {
		// TODO Auto-generated method stub
		usermapper.deleteUserById(id);

	}

	@Override
	public UserCustor findUserByNameAndPassword(UserPxoyVo userPxoyVo) {
		// TODO Auto-generated method stub
		return usermapper.findUserByNameAndPassword(userPxoyVo);
	}

	@Override
	public void updateUserByid(UserPxoyVo userPxoyVo) {
		// TODO Auto-generated method stub
		usermapper.updateUserByid(userPxoyVo);
		
	}

	@Override
	public UserCustor findUserById(UserPxoyVo userPxoyVo) {
		// TODO Auto-generated method stub
		return usermapper.findUserById(userPxoyVo);
	}

}
