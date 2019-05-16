package com.jtr.shop.service;

import java.util.List;

import com.jtr.shop.Domain.SalesProdes;
/**
 * 销售统计接口
 * @author Administrator
 *
 */
public interface SalesProdsService {
	//销售统计
		List<SalesProdes>findsales(SalesProdes salesprodes);
		//查询销售订单总量
		Integer findtotal(SalesProdes salesprodes);
}
