package com.jtr.shop.service;

import java.util.List;

import com.jtr.shop.Domain.ordersoperator;

/**
 * 
 * 订单处理类的接口(admin)
 * @author Administrator
 *
 */
public interface ordersoperatorService {
	List<ordersoperator>findordersmessage(ordersoperator orders);//找订单类表
	Integer findOrderNumber(String showbandname);//找订单总数
}
