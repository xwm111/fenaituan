package net.shopxx.dao.impl;

import net.shopxx.bean.Pager;
import net.shopxx.dao.ActivityReplyDao;
import net.shopxx.entity.ActivityReply;
import net.shopxx.query.condition.ActivityReplyCondition;
import net.shopxx.query.condition.IQueryCondition;

import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

@Repository
public class ActivityReplyDaoImpl extends BaseDaoImpl<ActivityReply, String>
		implements ActivityReplyDao {

	@Override
	public Pager queryForPager(IQueryCondition condition) {
		DetachedCriteria query = DetachedCriteria.forClass(ActivityReply.class,
				"activityReply");
		ActivityReplyCondition aCondition = (ActivityReplyCondition) condition;

		if (aCondition.getActivityId() != null) {
			query.createAlias("belongedActivity", "belongedActivity");
			query.add(Restrictions.eq("belongedActivity.id",
					aCondition.getActivityId()));
		}

		// 排序
		for (Order order : aCondition.getOrderList()) {
			query.addOrder(order);
		}
		return super.findByPager(condition.getPager(), query);
	}

	@Override
	public Long getReplyCount(String activityId) {
		String hql = "select count(*) from ActivityReply where belongedActivity_id='"
				+ activityId + "'";
		return (Long) getSession().createQuery(hql).uniqueResult();
	}

}