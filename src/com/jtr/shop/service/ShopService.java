package com.jtr.shop.service;

import java.util.List;

import com.jtr.shop.Domain.goods;
import com.jtr.shop.Domain.goodsCustor;
import com.jtr.shop.Domain.goodsPxoyVo;

public interface ShopService {
	List<goods> findBybandName(goods goods);//����Ʒ����Ϣ����
	List<goodsCustor>findByGoodsName(goodsPxoyVo goodsPxoyVo);//������Ʒ���ֲ�ѯ
	goodsCustor findByGoodsId(goodsPxoyVo goodsPxoyVo);//����id����ѯ��Ʒ
	List<goodsCustor> findGoodsolad(goodsPxoyVo goodsPxoyVo);//��ѯ������Ʒ
	//��ѯ��ƷDistenct
		String findGoodsDistnct(String goods_name);
		//��ѯ��Ʒ�µ�������ɫ
		List<String>findGoodsDistnctColor(String goods_name);
		//��ѯ��Ʒ�µ�����RAM
		List<String>findGoodsDistnctRAM(String goods_name);
		List<String>findGoodsDistnctimage(String goods_name);
		Double findmoneyBycolorOrRam(goods goods);
		//�������ƺ�ram����ɫȷ���������
		String findBygoodsnameAndRamAndColor(goods goods);
		//���ݲ�ƷӢ����ȷ�ϲ�Ʒϵ��
		List<goods>findBybandEnName(String en_name);
		//��ѯ����Ʒ
		Integer findCount();
		//��ѯ��Ʒ���ҳ��ʾ
		List<goodsCustor>findtotalgoodsPage(goodsCustor goodsCustor);
		//��ѯƷ�Ƶ������� 
		Integer findByBandnameCount(goodsCustor goodsCustor);
		//��ѯƷ���µ�������Ʒ���ڽ��з�ҳ��ʾ
		List<goodsCustor>findByBandnamePage(goodsCustor goodsCustor);
		//ɾ����Ʒ
		void deleteGoods(String goods_id);
		//ģ���Ҳ�Ʒ��������
		Integer findgoodscountBygoodsNameLike(goodsCustor goodsCustor);
		//��ҳ��ѯ��Ʒ
		List<goodsCustor>findgoodsPageBygoodsNameLike(goodsCustor goodsCustor);
		//����������
		void updateSalenumber(goodsCustor goodsCustor);
		//�������һ��
		String findlastid();
		//��������
		void inserdate(goodsCustor goodsCustor);
}
