package com.jtr.shop.serviceImp;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.jtr.shop.Domain.Band;
import com.jtr.shop.Domain.goods;
import com.jtr.shop.Domain.goodsCustor;
import com.jtr.shop.Domain.goodsPxoyVo;

import com.jtr.shop.mapper.ShopMapper;
import com.jtr.shop.service.ShopService;

public class ShopServiceImp implements ShopService{
    @Autowired
	private ShopMapper shopmapper;
     @Autowired
     private goodsCustor goodsCustor;
     @Autowired
     private Band band;
	
	

	@Override
	public List<goodsCustor> findByGoodsName(goodsPxoyVo goodsPxoyVo) {
		// TODO Auto-generated method stub
		return shopmapper.findByGoodsName(goodsPxoyVo);
	}

	@Override
	public goodsCustor findByGoodsId(goodsPxoyVo goodsPxoyVo) {
		// TODO Auto-generated method stub
		return shopmapper.findByGoodsId(goodsPxoyVo);
	}

	@Override
	public List<goods> findBybandName(goods goods) {
		// TODO Auto-generated method stub
		return shopmapper.findBybandName(goods);
	}

	@Override
	public List<goodsCustor> findGoodsolad(goodsPxoyVo goodsPxoyVo) {
		// TODO Auto-generated method stub
		return shopmapper.findGoodsolad(goodsPxoyVo);
	}

	@Override
	public String findGoodsDistnct(String goods_name) {
		// TODO Auto-generated method stub
		return shopmapper.findGoodsDistnct(goods_name);
	}

	@Override
	public List<String> findGoodsDistnctColor(String goods_name) {
		// TODO Auto-generated method stub
		return shopmapper.findGoodsDistnctColor(goods_name);
	}

	@Override
	public List<String> findGoodsDistnctRAM(String goods_name) {
		// TODO Auto-generated method stub
		return shopmapper.findGoodsDistnctRAM(goods_name);
	}

	@Override
	public List<String> findGoodsDistnctimage(String goods_name) {
		// TODO Auto-generated method stub
		return shopmapper.findGoodsDistnctimage(goods_name);
	}

	@Override
	public Double findmoneyBycolorOrRam(goods goods) {
		// TODO Auto-generated method stub
		return shopmapper.findmoneyBycolorOrRam(goods);
	}

	@Override
	public String findBygoodsnameAndRamAndColor(goods goods) {
		// TODO Auto-generated method stub
		return shopmapper.findBygoodsnameAndRamAndColor(goods);
	}

	@Override
	public List<goods> findBybandEnName(String en_name) {
		// TODO Auto-generated method stub
		return shopmapper.findBybandEnName(en_name);
	}

	@Override
	public Integer findCount() {
		// TODO Auto-generated method stub
		return shopmapper.findCount();
	}

	@Override
	public Integer findByBandnameCount(goodsCustor goodsCustor) {
		// TODO Auto-generated method stub
		return shopmapper.findByBandnameCount(goodsCustor);
	}

	@Override
	public List<goodsCustor> findtotalgoodsPage(goodsCustor goodsCustor) {
		// TODO Auto-generated method stub
		return shopmapper.findtotalgoodsPage(goodsCustor);
	}

	@Override
	public List<goodsCustor> findByBandnamePage(goodsCustor goodsCustor) {
		// TODO Auto-generated method stub
		return shopmapper.findByBandnamePage(goodsCustor);
	}

	@Override
	public void deleteGoods(String goods_id) {
		// TODO Auto-generated method stub
		shopmapper.deleteGoods(goods_id);
		
	}

	@Override
	public Integer findgoodscountBygoodsNameLike(goodsCustor goodsCustor) {
		// TODO Auto-generated method stub
		return shopmapper.findgoodscountBygoodsNameLike(goodsCustor);
	}

	@Override
	public List<goodsCustor> findgoodsPageBygoodsNameLike(
			goodsCustor goodsCustor) {
		// TODO Auto-generated method stub
		return shopmapper.findgoodsPageBygoodsNameLike(goodsCustor);
	}

	@Override
	public void updateSalenumber(goodsCustor goodsCustor) {
		// TODO Auto-generated method stub
		shopmapper.updateSalenumber(goodsCustor);
		
	}

	@Override
	public String findlastid() {
		// TODO Auto-generated method stub
		return shopmapper.findlastid();
	}

	@Override
	public void inserdate(goodsCustor goodsCustor) {
		// TODO Auto-generated method stub
		shopmapper.inserdate(goodsCustor);
	}

	

}
