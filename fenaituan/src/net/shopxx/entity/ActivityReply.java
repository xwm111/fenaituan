package net.shopxx.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.ManyToOne;

@Entity
public class ActivityReply extends BaseEntity {

	/**
	 * 
	 */
	private static final long serialVersionUID = -5339405035210001819L;

	public static final int DEFAULT_ACTIVITY_REPLY_LIST_PAGE_SIZE = 20;// 活动回复列表默认每页显示数

	private String content;

	private Member creatorMem; // 创建者（用户）

	private Activity belongedActivity; // 对应的活动

	@Column(length = 1024, nullable = false)
	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	public Member getCreatorMem() {
		return creatorMem;
	}

	public void setCreatorMem(Member creatorMem) {
		this.creatorMem = creatorMem;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	public Activity getBelongedActivity() {
		return belongedActivity;
	}

	public void setBelongedActivity(Activity belongedActivity) {
		this.belongedActivity = belongedActivity;
	}

}
