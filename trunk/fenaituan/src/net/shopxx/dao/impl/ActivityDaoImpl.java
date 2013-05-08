package net.shopxx.dao.impl;

import net.shopxx.bean.Pager;
import net.shopxx.dao.ActivityDao;
import net.shopxx.entity.Activity;
import net.shopxx.query.condition.ActivityCondition;
import net.shopxx.query.condition.IQueryCondition;

import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

@Repository
public class ActivityDaoImpl extends BaseDaoImpl<Activity, String> implements
		ActivityDao {

	@Override
	public Pager queryForPager(IQueryCondition condition) {
		DetachedCriteria query = DetachedCriteria.forClass(Activity.class,
				"activity");
		ActivityCondition aCondition = (ActivityCondition) condition;

		query.add(Restrictions.isNotNull("creatorMem"));
		// 排序
		for (Order order : aCondition.getOrderList()) {
			query.addOrder(order);
		}
		return super.findByPager(condition.getPager(), query);
	}

}
