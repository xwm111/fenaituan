package net.shopxx.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

@Entity
@Table(name = "product_region")
public class ProductRegion extends BaseEntity {

	/**
	 * 
	 */
	private static final long serialVersionUID = 593693514392436377L;

	private String regionId = "";

	private String productId = "";

	@Column(name = "region_id")
	public String getRegionId() {
		return regionId;
	}

	public void setRegionId(String regionId) {
		this.regionId = regionId;
	}

	@Column(name = "product_id")
	public String getProductId() {
		return productId;
	}

	public void setProductId(String productId) {
		this.productId = productId;
	}

}
