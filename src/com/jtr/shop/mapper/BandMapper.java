package com.jtr.shop.mapper;

import java.util.List;

import com.jtr.shop.Domain.Band;

public interface BandMapper {
	List<Band>findBand();//查询所有band
	String findBandname(Integer id);
	//插入品牌
	void insertband(Band band);
}
