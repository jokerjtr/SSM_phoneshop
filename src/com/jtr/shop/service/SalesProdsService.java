package com.jtr.shop.service;

import java.util.List;

import com.jtr.shop.Domain.SalesProdes;
/**
 * ����ͳ�ƽӿ�
 * @author Administrator
 *
 */
public interface SalesProdsService {
	//����ͳ��
		List<SalesProdes>findsales(SalesProdes salesprodes);
		//��ѯ���۶�������
		Integer findtotal(SalesProdes salesprodes);
}
