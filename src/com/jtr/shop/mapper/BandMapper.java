package com.jtr.shop.mapper;

import java.util.List;

import com.jtr.shop.Domain.Band;

public interface BandMapper {
	List<Band>findBand();//��ѯ����band
	String findBandname(Integer id);
	//����Ʒ��
	void insertband(Band band);
}
