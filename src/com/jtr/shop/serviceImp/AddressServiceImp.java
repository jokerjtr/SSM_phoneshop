package com.jtr.shop.serviceImp;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.jtr.shop.Domain.Address;
import com.jtr.shop.mapper.AddressMapper;
import com.jtr.shop.service.AddressService;

public class AddressServiceImp implements AddressService{
   @Autowired
    AddressMapper addressmapper;
    
	@Override
	public void insertmessage(Address address) {
		// TODO Auto-generated method stub
		addressmapper.insertmessage(address);
		
	}

	@Override
	public void updatemessage(Address address) {
		// TODO Auto-generated method stub
		addressmapper.updatemessage(address);
	}

	@Override
	public void deletemessage(Integer id) {
		// TODO Auto-generated method stub
		addressmapper.deletemessage(id);
	}

	@Override
	public List<Address> findmessage(Integer id) {
		// TODO Auto-generated method stub
		return addressmapper.findmessage(id);
	}

}
