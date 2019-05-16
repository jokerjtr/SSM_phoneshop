package com.jtr.shop.service;

import java.util.List;

import com.jtr.shop.Domain.Address;

public interface AddressService {
	void insertmessage(Address address);
	void updatemessage(Address address);
	void deletemessage(Integer id);
	List<Address>findmessage(Integer id);
}
