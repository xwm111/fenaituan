package net.shopxx.service.impl;

import javax.annotation.Resource;

import net.shopxx.bean.Pager;
import net.shopxx.dao.ActivityDao;
import net.shopxx.entity.Activity;
import net.shopxx.query.condition.ActivityCondition;
import net.shopxx.service.ActivityService;

import org.hibernate.criterion.Order;
import org.springframework.stereotype.Service;

@Service
public class ActivityServiceImpl extends BaseServiceImpl<Activity, String>
		implements ActivityService {

	@Resource
	private ActivityDao activityDao;

	@Resource
	public void setBaseDao(ActivityDao activityDao) {
		super.setBaseDao(activityDao);
	}

	@Override
	public Pager queryForPager(ActivityCondition condition) {
		condition.addOrder(Order.desc("isTop"));
		condition.addOrder(Order.desc("lastReplyDate"));
		return activityDao.queryForPager(condition);
	}

	@Override
	public void topActivity(String[] ids, boolean isTop) {
		for (int i = 0; i < ids.length; i++) {
			Activity activity = activityDao.get(ids[i]);
			activity.setIsTop(isTop);
			this.update(activity);
			this.flush();
		}
		
	}

	@Override
	public void topActivity(String id, boolean isTop) {
		topActivity(new String[] { id }, isTop);
	}

	@Override
	public String save(Activity entity) {
		return activityDao.save(entity);
	}

}
