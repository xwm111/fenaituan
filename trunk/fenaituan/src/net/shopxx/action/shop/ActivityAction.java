package net.shopxx.action.shop;

import java.sql.Date;
import java.util.Map;

import javax.annotation.Resource;

import net.shopxx.bean.Pager;
import net.shopxx.entity.Activity;
import net.shopxx.entity.ActivityReply;
import net.shopxx.entity.Member;
import net.shopxx.query.condition.ActivityCondition;
import net.shopxx.query.condition.ActivityReplyCondition;
import net.shopxx.service.ActivityReplyService;
import net.shopxx.service.ActivityService;

import org.apache.struts2.convention.annotation.ParentPackage;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.interceptor.annotations.InputConfig;
import com.opensymphony.xwork2.validator.annotations.RequiredFieldValidator;
import com.opensymphony.xwork2.validator.annotations.Validations;

@ParentPackage("shop")
public class ActivityAction extends BaseShopAction {

	/**
	 * 
	 */
	private static final long serialVersionUID = 5273788392814882686L;

	private ActivityCondition condition = new ActivityCondition();

	private ActivityReplyCondition replyCondition = new ActivityReplyCondition();

	private Activity activity;
	private ActivityReply activityReply;

	@Resource
	private ActivityService activityService;
	@Resource
	private ActivityReplyService activityReplyService;

	public String add() {
		if (!hasLogin())
			return "login";
		return "input";
	}

	public String list() {
		if (pager == null) {
			pager = new Pager();
			pager.setPageSize(Activity.DEFAULT_ACTIVITY_LIST_PAGE_SIZE);
		}
		condition.setPager(pager);
		pager = activityService.queryForPager(condition);
		return "list";
	}

	private boolean hasLogin() {
		Map<String, Object> session = ActionContext.getContext().getSession();
		String loginMemberId = (String) session
				.get(Member.LOGIN_MEMBER_ID_SESSION_NAME);
		if (loginMemberId != null)
			return true;
		return false;
	}

	public String detail() {
		if (pager == null) {
			pager = new Pager();
			pager.setPageSize(ActivityReply.DEFAULT_ACTIVITY_REPLY_LIST_PAGE_SIZE);
		}
		activity = activityService.load(id);
		replyCondition.setActivityId(id);
		replyCondition.setPager(pager);
		pager = activityReplyService.queryForPager(replyCondition);
		return "detail";
	}

	@Validations(requiredFields = { @RequiredFieldValidator(fieldName = "activity.name", message = "活动标题不允许为空!") })
	@InputConfig(resultName = "error")
	public String save() {
		if (!hasLogin())
			return "login";
		String loginMemberId = (String) getSession().get(
				Member.LOGIN_MEMBER_ID_SESSION_NAME);
		Member member = memberService.load(loginMemberId);
		activity.setCreatorMem(member);
		activity.setLastReplyDate(new Date(System.currentTimeMillis()));
		activity.setLastReplyMem(member);
		activityService.save(activity);
		redirectionUrl = "activity!list.action";
		return SUCCESS;
	}

	public String saveReply() {
		if (!hasLogin())
			return "login";
		String loginMemberId = (String) getSession().get(
				Member.LOGIN_MEMBER_ID_SESSION_NAME);
		Member member = memberService.load(loginMemberId);
		Activity activity = activityService.load(this.activity.getId());
		activity.setLastReplyDate(new Date(System.currentTimeMillis()));
		activity.setLastReplyMem(member);
		activity.setReplyNum((activityReplyService.getReplyCount(activity
				.getId()) + 1));
		activityService.update(activity);

		if (getActivityReply() == null)
			setActivityReply(new ActivityReply());
		getActivityReply().setBelongedActivity(activity);
		getActivityReply().setCreatorMem(member);
		activityReplyService.save(getActivityReply());
		redirectionUrl = "activity!detail.action?id=" + activity.getId();
		return SUCCESS;
	}

	public void setActivity(Activity activity) {
		this.activity = activity;
	}

	public Activity getActivity() {
		return activity;
	}

	public void setReplyCondition(ActivityReplyCondition replyCondition) {
		this.replyCondition = replyCondition;
	}

	public ActivityReplyCondition getReplyCondition() {
		return replyCondition;
	}

	public void setActivityReply(ActivityReply activityReply) {
		this.activityReply = activityReply;
	}

	public ActivityReply getActivityReply() {
		return activityReply;
	}

}
