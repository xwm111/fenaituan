package net.shopxx.dao.impl;

import net.shopxx.bean.Pager;
import net.shopxx.dao.AdminDao;
import net.shopxx.entity.Admin;
import net.shopxx.query.condition.AdminCondition;

import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

/**
 * Dao实现类 - 管理员
 * ============================================================================
 * 版权所有 2008-2010 长沙鼎诚软件有限公司，并保留所有权利。
 * ----------------------------------------------------------------------------
 * 提示：在未取得SHOP++商业授权之前，您不能将本软件应用于商业用途，否则SHOP++将保留追究的权力。
 * ----------------------------------------------------------------------------
 * 官方网站：http://www.shopxx.net
 * ----------------------------------------------------------------------------
 * KEY: SHOPXX2A5505E6E90FBFF03FB4B33E05AE2E5C
 * ============================================================================
 */

@Repository
public class AdminDaoImpl extends BaseDaoImpl<Admin, String> implements
		AdminDao {

	public boolean isExistByUsername(String username) {
		String hql = "from Admin admin where lower(admin.username) = lower(?)";
		Admin admin = (Admin) getSession().createQuery(hql)
				.setParameter(0, username).uniqueResult();
		if (admin != null) {
			return true;
		} else {
			return false;
		}
	}

	public Admin getAdminByUsername(String username) {
		String hql = "from Admin admin where lower(admin.username) = lower(?)";
		return (Admin) getSession().createQuery(hql).setParameter(0, username)
				.uniqueResult();
	}

	@Override
	public Pager queryForPager(AdminCondition condition) {
		DetachedCriteria query = DetachedCriteria
				.forClass(Admin.class, "Admin");
		AdminCondition aCondition = (AdminCondition) condition;

		if (!aCondition.getRegionId().trim().equals("")) {
			query.createAlias("regionSet", "region");
			query.add(Restrictions.eq("region.id", aCondition.getRegionId()));
		}

		// 排序
		for (Order order : aCondition.getOrderList()) {
			query.addOrder(order);
		}
		return super.findByPager(condition.getPager(), query);
	}

}