package com.jtr.shop.Domain;
/**
 * Ʒ�Ʊ�
 * @author Administrator
 *
 */
public class Band {
    private Integer band_id;//Ʒ��id
    private String band_name;//Ʒ������
    private String en_name;//ƥ��Ӣ������
    private String band_logo;//logo��
	public Integer getBand_id() {
		return band_id;
	}
	public void setBand_id(Integer band_id) {
		this.band_id = band_id;
	}
	public String getBand_name() {
		return band_name;
	}
	public void setBand_name(String band_name) {
		this.band_name = band_name;
	}
	public String getEn_name() {
		return en_name;
	}
	public void setEn_name(String en_name) {
		this.en_name = en_name;
	}
	public String getBand_logo() {
		return band_logo;
	}
	public void setBand_logo(String band_logo) {
		this.band_logo = band_logo;
	}
    
}
