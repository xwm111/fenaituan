package net.shopxx.dao;

import java.util.List;

import net.shopxx.entity.Region;

public interface RegionDao extends BaseDao<Region, String> {

	public List<Region> getByProductId(String id);
	
	public List<Region> getByAdminId(String id);
	
}
