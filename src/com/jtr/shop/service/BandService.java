package com.jtr.shop.service;

import java.util.List;

import com.jtr.shop.Domain.Band;

public interface BandService {
	List<Band>findBand();//��ѯ����band
	String findBandname(Integer id);
	//����Ʒ��
		void insertband(Band Band);

}
