package com.jtr.shop.service;

import com.jtr.shop.Domain.Admin;

public interface AdminService {
	Admin findByUser(Admin admin);
	void Updatetiem(Admin admin);
	void updatepsd(Admin admin);//��������
	Admin findAdminByIdAndPsd(Admin admin);//����id��������ȷ���û�������ڸ�����
}
