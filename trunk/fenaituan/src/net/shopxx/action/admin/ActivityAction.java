package net.shopxx.action.admin;

import javax.annotation.Resource;

import net.shopxx.bean.Pager;
import net.shopxx.entity.Activity;
import net.shopxx.entity.ActivityReply;
import net.shopxx.query.condition.ActivityCondition;
import net.shopxx.query.condition.ActivityReplyCondition;
import net.shopxx.service.ActivityReplyService;
import net.shopxx.service.ActivityService;

import org.apache.struts2.convention.annotation.ParentPackage;

import com.opensymphony.xwork2.interceptor.annotations.InputConfig;
import com.opensymphony.xwork2.validator.annotations.RequiredFieldValidator;
import com.opensymphony.xwork2.validator.annotations.Validations;

@ParentPackage("admin")
public class ActivityAction extends BaseAdminAction {

	/**
	 * 
	 */
	private static final long serialVersionUID = -7152043619153610787L;

	private Activity activity;
	private ActivityReply activityReply;
	private ActivityCondition condition = new ActivityCondition();
	private ActivityReplyCondition replyCondition = new ActivityReplyCondition();

	@Resource
	private ActivityService activityService;
	@Resource
	private ActivityReplyService activityReplyService;

	// 列表
	public String list() {
		if (pager == null) {
			pager = new Pager();
			pager.setPageSize(Activity.DEFAULT_ACTIVITY_LIST_PAGE_SIZE);
		}
		condition.setPager(pager);
		pager = activityService.queryForPager(condition);
		return "list";
	}

	// 回复列表
	public String replyList() {
		if (pager == null) {
			pager = new Pager();
			pager.setPageSize(Activity.DEFAULT_ACTIVITY_LIST_PAGE_SIZE);
		}
		activity = activityService.load(id);
		replyCondition.setActivityId(id);
		replyCondition.setPager(pager);
		pager = activityReplyService.queryForPager(replyCondition);
		return "replyList";
	}

	public String edit() {
		if (pager == null) {
			pager = new Pager();
			pager.setPageSize(Activity.DEFAULT_ACTIVITY_LIST_PAGE_SIZE);
		}
		activity = activityService.load(id);
		replyCondition.setActivityId(id);
		replyCondition.setPager(pager);
		pager = activityReplyService.queryForPager(replyCondition);
		return "input";
	}

	public String editReply() {
		activityReply = activityReplyService.load(id);
		return "reply_input";
	}

	// 删除
	public String delete() throws Exception {
		activityService.delete(ids);
		return ajaxJsonSuccessMessage("删除成功！");
	}

	// 删除回复
	public String deleteReply() throws Exception {
		for (int i = 0; i < ids.length; i++) {
			ActivityReply persist = activityReplyService.load(ids[i]);
			Activity activity = persist.getBelongedActivity();
			activity.setReplyNum(activity.getReplyNum() - 1);
			activityService.update(activity);
		}
		activityReplyService.delete(ids);
		return ajaxJsonSuccessMessage("删除成功！");
	}

	// 置顶
	public String topActivity() throws Exception {
		// activityService.topActivity(ids, true);
		for (int i = 0; i < ids.length; i++) {
			Activity activity = activityService.load(ids[i]);
			activity.setIsTop(true);
			activityService.update(activity);
		}
		return ajaxJsonSuccessMessage("置顶成功！");
	}

	// 取消置顶
	public String cancelTop() throws Exception {
		// activityService.topActivity(ids, false);
		for (int i = 0; i < ids.length; i++) {
			Activity activity = activityService.load(ids[i]);
			activity.setIsTop(false);
			activityService.update(activity);
		}
		return ajaxJsonSuccessMessage("操作成功！");
	}

	public String detail() {
		if (pager == null) {
			pager = new Pager();
			pager.setPageSize(ActivityReply.DEFAULT_ACTIVITY_REPLY_LIST_PAGE_SIZE);
		}
		setActivity(activityService.load(id));
		replyCondition.setActivityId(id);
		replyCondition.setPager(pager);
		pager = activityReplyService.queryForPager(replyCondition);
		return "detail";
	}

	@Validations(requiredFields = { @RequiredFieldValidator(fieldName = "activity.name", message = "活动标题不允许为空!") })
	@InputConfig(resultName = "error")
	public String update() {
		Activity persist = activityService.load(activity.getId());
		persist.setContent(activity.getContent());
		persist.setName(activity.getName());
		persist.setIsTop(activity.getIsTop());
		persist.setReplyNum((long) persist.getReplySet().size());
		activityService.update(persist);
		redirectionUrl = "activity!list.action";
		return SUCCESS;
	}

	public String updateReply() {
		ActivityReply persist = activityReplyService
				.load(activityReply.getId());
		persist.setContent(activityReply.getContent());
		activityReplyService.update(persist);
		redirectionUrl = "activity!replyList.action?id="
				+ persist.getBelongedActivity().getId();
		return SUCCESS;
	}

	public void setActivity(Activity activity) {
		this.activity = activity;
	}

	public Activity getActivity() {
		return activity;
	}

	public void setActivityReply(ActivityReply activityReply) {
		this.activityReply = activityReply;
	}

	public ActivityReply getActivityReply() {
		return activityReply;
	}

}
