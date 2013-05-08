package net.shopxx.entity;

import java.util.Date;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

import org.hibernate.annotations.Cascade;
import org.hibernate.annotations.CascadeType;

@Entity
public class Activity extends BaseEntity {

	/**
	 * 
	 */
	private static final long serialVersionUID = 6453191656533862631L;

	public static final int DEFAULT_ACTIVITY_LIST_PAGE_SIZE = 12;// 活动列表默认每页显示数

	private String name;
	private String content;
	private String description;
	private Date lastReplyDate;// 最后回复日期
	private Member lastReplyMem;// 最后回复用户
	private Long replyNum = (long) 0;// 回复的数量
	private Boolean isTop = false;// 是否置顶

	private Member creatorMem; // 创建者（用户）

	private Set<Region> regionSet;// 地区
	private Set<ActivityReply> replySet;// 回复

	@Column(nullable = false)
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Column
	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	@ManyToMany(fetch = FetchType.LAZY)
	public Set<Region> getRegionSet() {
		return regionSet;
	}

	public void setRegionSet(Set<Region> regionSet) {
		this.regionSet = regionSet;
	}

	public void setCreatorMem(Member creatorMem) {
		this.creatorMem = creatorMem;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	public Member getCreatorMem() {
		return creatorMem;
	}

	public void setContent(String content) {
		this.content = content;
	}

	@Column(length = 2000)
	public String getContent() {
		return content;
	}

	public void setLastReplyDate(Date lastReplyDate) {
		this.lastReplyDate = lastReplyDate;
	}

	@Column
	public Date getLastReplyDate() {
		return lastReplyDate;
	}

	public void setReplySet(Set<ActivityReply> replySet) {
		this.replySet = replySet;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "belongedActivity")
	@Cascade(value = { CascadeType.DELETE })
	public Set<ActivityReply> getReplySet() {
		return replySet;
	}

	public void setLastReplyMem(Member lastReplyMem) {
		this.lastReplyMem = lastReplyMem;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	public Member getLastReplyMem() {
		return lastReplyMem;
	}

	public void setReplyNum(Long replyNum) {
		this.replyNum = replyNum;
	}

	@Column
	public Long getReplyNum() {
		return replyNum;
	}

	public void setIsTop(Boolean isTop) {
		this.isTop = isTop;
	}

	@Column(nullable = false, updatable = true)
	public Boolean getIsTop() {
		return isTop;
	}

}
