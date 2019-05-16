package com.jtr.shop.serviceImp;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.jtr.shop.Domain.ordersoperator;
import com.jtr.shop.mapper.ordersoperatorMapper;
import com.jtr.shop.service.ordersoperatorService;

public class ordersoperatorServiceImp implements ordersoperatorService {
    @Autowired
    private ordersoperatorMapper ordersoperator;
	@Override
	public List<ordersoperator> findordersmessage(ordersoperator orders) {
		// TODO Auto-generated method stub
		return ordersoperator.findordersmessage(orders);
	}
	@Override
	public Integer findOrderNumber(String showbandname) {
		// TODO Auto-generated method stub
		return ordersoperator.findOrderNumber(showbandname);
	}

}
