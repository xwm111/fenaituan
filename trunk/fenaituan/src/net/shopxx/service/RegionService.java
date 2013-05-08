package net.shopxx.service;

import java.util.List;

import net.sf.json.JSONArray;
import net.shopxx.entity.Region;

public interface RegionService extends BaseService<Region, String> {

	public JSONArray getJsonArrayAll();

	public JSONArray getJsonArrayByProductId(String productId);

	public JSONArray getJsonArrayByAdminId(String adminId);

	public String getArrayAll();

	public String getArrayByProductId(String productId);

	public String getArrayByAdminId(String adminId);

	public List<Region> getRegionByProductId(String productId);

	public List<Region> getRegionByAdminId(String adminId);

	public List<Region> getAllChildRegionByRegionId(String regionId);

}
