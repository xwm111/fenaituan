package net.shopxx.dao;

import net.shopxx.bean.Pager;
import net.shopxx.entity.Activity;
import net.shopxx.query.condition.IQueryCondition;

public interface ActivityDao extends BaseDao<Activity, String>{
	
	/**
	 * 根据条件查询
	 * 
	 * @param condition
	 * @return
	 */
	public Pager queryForPager(IQueryCondition condition);
}
