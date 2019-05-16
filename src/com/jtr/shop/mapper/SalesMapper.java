package com.jtr.shop.mapper;

import java.util.List;

import com.jtr.shop.Domain.SalesProdes;

/**
 * 销售统计
 * @author Administrator
 *
 */
public interface SalesMapper {
	//销售统计
	List<SalesProdes>findsales(SalesProdes salesprodes);
	//查询销售订单总量
	Integer findtotal(SalesProdes salesprodes);
   
}
