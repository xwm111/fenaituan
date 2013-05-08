package net.shopxx.service;

import net.shopxx.bean.Pager;
import net.shopxx.entity.Activity;
import net.shopxx.query.condition.ActivityCondition;

public interface ActivityService extends BaseService<Activity, String> {
	/**
	 * 根据条件查询
	 * 
	 * @param condition
	 * @return
	 */
	public Pager queryForPager(ActivityCondition condition);

	public void topActivity(String[] ids, boolean isTop);
	public void topActivity(String id, boolean isTop);
}
