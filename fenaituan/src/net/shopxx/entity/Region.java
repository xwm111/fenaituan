package net.shopxx.entity;

import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.annotations.Cascade;
import org.hibernate.annotations.CascadeType;

@Entity
@Table(name = "region")
public class Region extends BaseEntity {

	/**
	 * 
	 */
	private static final long serialVersionUID = -4024972468468770627L;

	private String regionName = "";// 地区名

	private String regionType;// 地区类型

	private Region parentRegion;// 父节点

	private Set<Region> regionSet; // 子节点

	private Set<Product> productSet;// 区域内的商品
	private Set<Admin> adminSet;// 区域内的管理员

	public String toJsonString() {
		return "{'id':'"
				+ getId()
				+ "','pId':"
				+ (parentRegion == null ? null : "'" + parentRegion.getId()
						+ "'") + ",'name':'" + regionName + "'}";
	}

	@Column(name = "region_name")
	public String getRegionName() {
		return regionName;
	}

	public void setRegionName(String regionName) {
		this.regionName = regionName;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "parent_region_id", nullable = true)
	public Region getParentRegion() {
		return parentRegion;
	}

	public void setParentRegion(Region parentRegion) {
		this.parentRegion = parentRegion;
	}

	@OneToMany(mappedBy = "parentRegion", fetch = FetchType.LAZY)
	@Cascade(value = { CascadeType.DELETE })
	public Set<Region> getRegionSet() {
		return regionSet;
	}

	public void setRegionSet(Set<Region> regionSet) {
		this.regionSet = regionSet;
	}

	public void setRegionType(String regionType) {
		this.regionType = regionType;
	}

	@Column(name = "region_type")
	public String getRegionType() {
		return regionType;
	}

	public void setProductSet(Set<Product> productSet) {
		this.productSet = productSet;
	}

	@ManyToMany(fetch = FetchType.LAZY, mappedBy = "regionSet")
	public Set<Product> getProductSet() {
		return productSet;
	}

	public void setAdminSet(Set<Admin> adminSet) {
		this.adminSet = adminSet;
	}

	@ManyToMany(fetch = FetchType.LAZY, mappedBy = "regionSet")
	public Set<Admin> getAdminSet() {
		return adminSet;
	}

	@Override
	public boolean equals(Object obj) {
		if (obj != null && obj instanceof Region) {
			Region region = (Region) obj;
			if (region.getId() != null
					&& region.getId().trim().equals(this.getId()))
				return true;
		}
		return false;
	}

}
