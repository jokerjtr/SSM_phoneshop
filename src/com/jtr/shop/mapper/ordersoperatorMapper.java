package com.jtr.shop.mapper;

import java.util.List;

import com.jtr.shop.Domain.ordersoperator;

/**
 * �������������
 * @author Administrator
 *
 */
public interface ordersoperatorMapper {
     //����������Ʒ������Ϣ
	List<ordersoperator>findordersmessage(ordersoperator orders);
	Integer findOrderNumber(String showbandname);
	
}
