package com.jtr.shop.Domain;

import org.springframework.stereotype.Controller;

@Controller
public class json {
    private String en_name;

	public String getEn_name() {
		return en_name;
	}

	public void setEn_name(String en_name) {
		this.en_name = en_name;
	}
    
}
