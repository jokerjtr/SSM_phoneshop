package com.jtr.shop.serviceImp;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.jtr.shop.Domain.SalesProdes;
import com.jtr.shop.mapper.SalesMapper;
import com.jtr.shop.service.SalesProdsService;

public class SalesProdsServiceImp implements SalesProdsService {
    @Autowired
    private SalesMapper salesMapper;
	@Override
	public List<SalesProdes> findsales(SalesProdes salesprodes) {
		// TODO Auto-generated method stub
		return salesMapper.findsales(salesprodes);
	}
	@Override
	public Integer findtotal(SalesProdes salesprodes) {
		// TODO Auto-generated method stub
		return salesMapper.findtotal(salesprodes);
	}

}
