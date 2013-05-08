package net.shopxx.service.impl;

import javax.annotation.Resource;

import net.shopxx.bean.Pager;
import net.shopxx.dao.ActivityReplyDao;
import net.shopxx.entity.ActivityReply;
import net.shopxx.query.condition.ActivityReplyCondition;
import net.shopxx.service.ActivityReplyService;

import org.hibernate.criterion.Order;
import org.springframework.stereotype.Service;

@Service
public class ActivityReplyServiceImpl extends
		BaseServiceImpl<ActivityReply, String> implements ActivityReplyService {

	@Resource
	private ActivityReplyDao activityReplyDao;

	@Resource
	public void setBaseDao(ActivityReplyDao activityReplyDao) {
		super.setBaseDao(activityReplyDao);
	}

	@Override
	public Long getReplyCount(String activityId) {
		return activityReplyDao.getReplyCount(activityId);
	}

	@Override
	public Pager queryForPager(ActivityReplyCondition condition) {
		condition.addOrder(Order.asc("createDate"));
		return activityReplyDao.queryForPager(condition);
	}

	@Override
	public String save(ActivityReply entity) {
		return activityReplyDao.save(entity);
	}

}