package com.jtr.shop.mapper;

import java.util.List;

import com.jtr.shop.Domain.Address;

/**
 * 
 * 收货人信息表
 * @author Administrator
 *
 */
public interface AddressMapper {
	void insertmessage(Address address);
	void updatemessage(Address address);
	void deletemessage(Integer id);
	List<Address>findmessage(Integer id);
}
