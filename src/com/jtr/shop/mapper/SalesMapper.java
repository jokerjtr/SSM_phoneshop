package com.jtr.shop.mapper;

import java.util.List;

import com.jtr.shop.Domain.SalesProdes;

/**
 * ����ͳ��
 * @author Administrator
 *
 */
public interface SalesMapper {
	//����ͳ��
	List<SalesProdes>findsales(SalesProdes salesprodes);
	//��ѯ���۶�������
	Integer findtotal(SalesProdes salesprodes);
   
}
