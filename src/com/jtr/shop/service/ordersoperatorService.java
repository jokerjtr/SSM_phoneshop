package com.jtr.shop.service;

import java.util.List;

import com.jtr.shop.Domain.ordersoperator;

/**
 * 
 * ����������Ľӿ�(admin)
 * @author Administrator
 *
 */
public interface ordersoperatorService {
	List<ordersoperator>findordersmessage(ordersoperator orders);//�Ҷ������
	Integer findOrderNumber(String showbandname);//�Ҷ�������
}
