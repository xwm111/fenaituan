package net.shopxx.query.condition;

import java.util.Set;

import net.shopxx.entity.Admin;
import net.shopxx.entity.Member;
import net.shopxx.entity.ProductCategory;
import net.shopxx.entity.Region;

public class ProductCondition extends DefaultCondition {

	private String salesType = ""; // 销售分类
	private String tradeType = ""; // 交易类型
	private boolean isMarketable = false;// 是否上架
	private String trusteeship = ""; // 托管

	private Region region;
	private Member member; // 商品添加者
	private Admin admin; // 管理员
	private Set<Region> regions;
	private ProductCategory productCategory;
	
	public void setRegions(Set<Region> regions) {
		this.regions = regions;
	}

	public Set<Region> getRegions() {
		return regions;
	}

	public void setProductCategory(ProductCategory productCategory) {
		this.productCategory = productCategory;
	}

	public ProductCategory getProductCategory() {
		return productCategory;
	}

	public void setSalesType(String salesType) {
		this.salesType = salesType;
	}

	public String getSalesType() {
		return salesType;
	}

	public void setRegion(Region region) {
		this.region = region;
	}

	public Region getRegion() {
		return region;
	}

	public void setMember(Member member) {
		this.member = member;
	}

	public Member getMember() {
		return member;
	}

	public void setMarketable(boolean isMarketable) {
		this.isMarketable = isMarketable;
	}

	public boolean isMarketable() {
		return isMarketable;
	}

	public void setTrusteeship(String trusteeship) {
		this.trusteeship = trusteeship;
	}

	public String getTrusteeship() {
		return trusteeship;
	}

	public void setAdmin(Admin admin) {
		this.admin = admin;
	}

	public Admin getAdmin() {
		return admin;
	}

	public void setTradeType(String tradeType) {
		this.tradeType = tradeType;
	}

	public String getTradeType() {
		return tradeType;
	}

}
