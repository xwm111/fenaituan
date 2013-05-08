package net.shopxx.dao;

import net.shopxx.bean.Pager;
import net.shopxx.entity.ActivityReply;
import net.shopxx.query.condition.IQueryCondition;

public interface ActivityReplyDao extends BaseDao<ActivityReply, String> {

	/**
	 * 根据条件查询
	 * 
	 * @param condition
	 * @return
	 */
	public Pager queryForPager(IQueryCondition condition);
	
	/**
	 * 根据活动id查询回复的数量
	 * 
	 * @param activityId
	 * @return
	 */
	public Long getReplyCount(String activityId);
}
