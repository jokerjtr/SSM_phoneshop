package com.jtr.shop.mapper;

import com.jtr.shop.Domain.Admin;

public interface AdminMapper {
	Admin findByUser(Admin admin);
	void Updatetiem(Admin admin);
	void updatepsd(Admin admin);//��������
	Admin findAdminByIdAndPsd(Admin admin);//����id��������ȷ���û�������ڸ�����
}
