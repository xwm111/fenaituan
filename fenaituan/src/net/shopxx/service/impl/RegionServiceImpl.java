package net.shopxx.service.impl;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import javax.annotation.Resource;

import net.sf.json.JSONArray;
import net.shopxx.dao.AdminDao;
import net.shopxx.dao.ProductDao;
import net.shopxx.dao.RegionDao;
import net.shopxx.entity.Admin;
import net.shopxx.entity.Product;
import net.shopxx.entity.Region;
import net.shopxx.service.RegionService;

import org.springframework.stereotype.Service;

/**
 * RegionService实现类 - 地区
 * 
 * @author Administrator
 * 
 */
@Service
public class RegionServiceImpl extends BaseServiceImpl<Region, String>
		implements RegionService {

	@Resource
	private RegionDao regionDao;
	@Resource
	private AdminDao adminDao;
	@Resource
	private ProductDao productDao;

	@Resource
	public void setBaseDao(RegionDao regionDao) {
		super.setBaseDao(regionDao);
	}

	@Override
	public void delete(String[] ids) {
		for (int i = 0; i < ids.length; i++) {
			delete(ids[i]);
		}
	}

	@Override
	public void delete(String id) {
		Region region = regionDao.get(id);
		if (region != null) {
			Set<Region> regionSet = region.getRegionSet();
			if (regionSet != null) {
				for (Iterator<Region> iterator = regionSet.iterator(); iterator
						.hasNext();) {
					delete(iterator.next().getId());
				}
			}
			if (region.getAdminSet() != null)
				for (Iterator<Admin> iterator = region.getAdminSet().iterator(); iterator
						.hasNext();) {
					Admin admin = (Admin) iterator.next();
					admin.getRegionSet().remove(region);
					adminDao.update(admin);
				}
			if (region.getProductSet() != null)
				for (Iterator<Product> iterator = region.getProductSet()
						.iterator(); iterator.hasNext();) {
					Product product = (Product) iterator.next();
					product.getRegionSet().remove(region);
					productDao.update(product);
				}
			regionDao.delete(region);
		}
	}

	@Override
	public JSONArray getJsonArrayAll() {
		return convertToJsonArray(regionDao.getAll());
	}

	@Override
	public List<Region> getRegionByProductId(String productId) {
		return regionDao.getByProductId(productId);
	}

	@Override
	public List<Region> getRegionByAdminId(String adminId) {
		return regionDao.getByAdminId(adminId);
	}

	@Override
	public JSONArray getJsonArrayByProductId(String productId) {
		return convertToJsonArray(getRegionByProductId(productId));
	}

	@Override
	public JSONArray getJsonArrayByAdminId(String adminId) {
		return convertToJsonArray(getRegionByAdminId(adminId));
	}

	@Override
	public String getArrayAll() {
		return convertToString(regionDao.getAll());
	}

	@Override
	public String getArrayByProductId(String productId) {
		return convertToString(getRegionByProductId(productId));
	}

	@Override
	public String getArrayByAdminId(String adminId) {
		return convertToString(getRegionByAdminId(adminId));
	}

	@Override
	public List<Region> getAllChildRegionByRegionId(String regionId) {
		List<Region> list = new ArrayList<Region>();
		if (regionId == null || regionId.trim().equals(""))
			return list;
		Region region = regionDao.load(regionId);
		Set<Region> regionSet = getChildRegion(region);
		list.addAll(regionSet);
		return list;
	}

	private Set<Region> getChildRegion(Region region) {
		Set<Region> set = new HashSet<Region>();
		set.add(region);
		for (Region r : region.getRegionSet()) {
			set.addAll(getChildRegion(r));
		}
		return set;
	}

	/**
	 * 将List转换为Json数据
	 * 
	 * @param regionList
	 * @return
	 */
	private JSONArray convertToJsonArray(List<Region> regionList) {
		JSONArray ja = new JSONArray();
		for (Region region : regionList) {
			ja.add(region.toJsonString());
		}
		return ja;
	}

	private String convertToString(List<Region> regionList) {
		StringBuffer sb = new StringBuffer();
		sb.append("[");
		for (Region region : regionList) {
			sb.append(region.toJsonString() + ",");
		}
		sb.append("]");
		return sb.toString();
	}

}
