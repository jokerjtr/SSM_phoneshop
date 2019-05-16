package com.jtr.shop.mapper;

import java.util.List;

import com.jtr.shop.Domain.ordersoperator;

/**
 * 订单处理类操作
 * @author Administrator
 *
 */
public interface ordersoperatorMapper {
     //查找所有商品订单信息
	List<ordersoperator>findordersmessage(ordersoperator orders);
	Integer findOrderNumber(String showbandname);
	
}
