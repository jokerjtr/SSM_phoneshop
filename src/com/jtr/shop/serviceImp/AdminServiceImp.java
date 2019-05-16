package com.jtr.shop.serviceImp;

import org.springframework.beans.factory.annotation.Autowired;

import com.jtr.shop.Domain.Admin;
import com.jtr.shop.mapper.AdminMapper;
import com.jtr.shop.service.AdminService;

public class AdminServiceImp implements AdminService {
     @Autowired AdminMapper adminMapper;
	@Override
	public Admin findByUser(Admin admin) {
		// TODO Auto-generated method stub
		return adminMapper.findByUser(admin);
	}

	@Override
	public void Updatetiem(Admin admin) {
		// TODO Auto-generated method stub
            adminMapper.Updatetiem(admin);
	}

	@Override
	public void updatepsd(Admin admin) {
		// TODO Auto-generated method stub
		adminMapper.updatepsd(admin);
		
	}

	@Override
	public Admin findAdminByIdAndPsd(Admin admin) {
		// TODO Auto-generated method stub
		return adminMapper.findAdminByIdAndPsd(admin);
	}

}
