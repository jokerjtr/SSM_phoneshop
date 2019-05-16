package com.jtr.shop.serviceImp;

import org.springframework.beans.factory.annotation.Autowired;

import com.jtr.shop.Domain.Orders;
import com.jtr.shop.mapper.OrdersMapper;
import com.jtr.shop.service.OrdersService;

public class OrderServiceImp implements OrdersService {
   @Autowired
   private OrdersMapper ordersmapper;
	@Override
	public void insertOrder(Orders orders) {
		// TODO Auto-generated method stub
		ordersmapper.insertOrder(orders);
		
		
	}
	//确订单后跟新
	@Override
	public void updateorders(Orders orders) {
		// TODO Auto-generated method stub
		ordersmapper.updateorders(orders);
		
	}

}
