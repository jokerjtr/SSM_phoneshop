package com.jtr.shop.mapper;

import com.jtr.shop.Domain.Admin;

public interface AdminMapper {
	Admin findByUser(Admin admin);
	void Updatetiem(Admin admin);
	void updatepsd(Admin admin);//更行密码
	Admin findAdminByIdAndPsd(Admin admin);//根据id和密码来确定用户身份用于该密码
}
