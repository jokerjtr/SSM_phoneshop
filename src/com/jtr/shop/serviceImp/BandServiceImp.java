package com.jtr.shop.serviceImp;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.jtr.shop.Domain.Band;
import com.jtr.shop.mapper.BandMapper;
import com.jtr.shop.service.BandService;

public class BandServiceImp implements BandService {
    @Autowired
    private BandMapper band;
	@Override
	public List<Band> findBand() {
		// TODO Auto-generated method stub
		return band.findBand();
	}
	@Override
	public String findBandname(Integer id) {
		// TODO Auto-generated method stub
		return band.findBandname(id);
	}
	@Override
	public void insertband(Band Band) {
		// TODO Auto-generated method stub
		band.insertband(Band);
		
	}

}
