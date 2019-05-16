package com.jtr.shop.mapper;

import java.util.List;

import com.jtr.shop.Domain.goods;
import com.jtr.shop.Domain.goodsCustor;
import com.jtr.shop.Domain.goodsPxoyVo;

public interface ShopMapper {
	List<goods> findBybandName(goods goods);//更具品牌信息查找
	List<goodsCustor>findByGoodsName(goodsPxoyVo goodsPxoyVo);//根据商品名字查询
	goodsCustor findByGoodsId(goodsPxoyVo goodsPxoyVo);//根据id来查询商品
	List<goodsCustor> findGoodsolad(goodsPxoyVo goodsPxoyVo);//查询热门商品
	//查询商品Distenct
	String findGoodsDistnct(String goods_name);
	//查询商品下的所有颜色
	List<String>findGoodsDistnctColor(String goods_name);
	//查询商品下的所有RAM
	List<String>findGoodsDistnctRAM(String goods_name);
	//查询该商品下的所有图片地址
	List<String>findGoodsDistnctimage(String goods_name);
	Double findmoneyBycolorOrRam(goods goods);
	String findBygoodsnameAndRamAndColor(goods goods);
	//根据英文名搜索
	List<goods>findBybandEnName(String en_name);
	
	//查询总商品
	Integer findCount();
	//查询商品后分页显示
	List<goodsCustor>findtotalgoodsPage(goodsCustor goodsCustor);
	//查询品牌的总总数 
	Integer findByBandnameCount(goodsCustor goodsCustor);
	//查询品牌下的所有商品，在进行分页显示
	List<goodsCustor>findByBandnamePage(goodsCustor goodsCustor);
	//查询所有品牌
	
	//删除商品
	void deleteGoods(String goods_id);
	//模糊找产品名的数量
	Integer findgoodscountBygoodsNameLike(goodsCustor goodsCustor);
	//分页查询产品
	List<goodsCustor>findgoodsPageBygoodsNameLike(goodsCustor goodsCustor);
	//更新产品销量
	void updateSalenumber(goodsCustor goodsCustor);
	//查找最后一条
	String findlastid();
	//插入数据
	void inserdate(goodsCustor goodsCustor);
	
}
