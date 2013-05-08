package net.shopxx.dao.impl;

import java.util.List;

import net.shopxx.dao.RegionDao;
import net.shopxx.entity.Region;

import org.springframework.stereotype.Repository;

@Repository
public class RegionDaoImpl extends BaseDaoImpl<Region, String> implements
		RegionDao {

	@SuppressWarnings("unchecked")
	@Override
	public List<Region> getByProductId(String id) {
		//String hql = "from Region region join region.productSet product where product.id = ?";
		String hql = "from Region region where (select count(*) from region.productSet product where product.id = ?)>0";
		return getSession().createQuery(hql).setParameter(0, id).list();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Region> getByAdminId(String id) {
		String hql = "from Region region where (select count(*) from region.adminSet admin where admin.id = ?)>0";
		return getSession().createQuery(hql).setParameter(0, id).list();
	}
	
	

}
