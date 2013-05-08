package net.shopxx.action.admin;

import java.util.Date;

import javax.annotation.Resource;
import javax.servlet.jsp.PageContext;

import net.shopxx.entity.Region;
import net.shopxx.query.condition.AdminCondition;
import net.shopxx.service.AdminService;
import net.shopxx.service.RegionService;

import org.apache.struts2.convention.annotation.ParentPackage;

import com.opensymphony.oscache.base.Cache;
import com.opensymphony.oscache.web.ServletCacheAdministrator;

@ParentPackage("admin")
public class RegionAction extends BaseAdminAction {

	/**
	 * 
	 */
	private static final long serialVersionUID = -6964547911432359268L;

	private Region region = new Region();
	private String parentId = "";
	private String regionData = "";

	@Resource
	private RegionService regionService;

	@Resource
	private AdminService adminService;

	// 添加
	public String add() {
		init();
		return INPUT;
	}

	// 编辑
	public String edit() {
		setRegion(regionService.load(id));
		init();
		return INPUT;
	}

	private void init() {
		setRegionData(regionService.getArrayAll().toString());
		if (region != null && region.getParentRegion() != null) {
			parentId = region.getParentRegion().getId();
		}
	}

	// 列表
	public String list() {
		pager = regionService.findByPager(pager);
		return LIST;
	}

	// 管理员列表
	public String listAdmin() {
		AdminCondition condition = new AdminCondition();
		condition.setRegionId(id);
		pager = adminService.queryForPager(condition);
		return "admin_list";
	}

	// 删除
	public String delete() throws Exception {
		regionService.delete(ids);
		return ajaxJsonSuccessMessage("删除成功！");
	}

	// 保存
	public String save() throws Exception {
		parentId = parentId.split(",")[0];
		if (!parentId.trim().equals(""))
			region.setParentRegion(regionService.get(parentId));
		else
			region.setParentRegion(null);
		regionService.save(region);
		flushCache();
		redirectionUrl = "region!list.action";
		return SUCCESS;
	}

	// 更新
	public String update() throws Exception {
		parentId = parentId.split(",")[0];
		if (!parentId.trim().equals(""))
			region.setParentRegion(regionService.get(parentId));
		else
			region.setParentRegion(null);
		region.setId(id);
		regionService.update(region);
		flushCache();
		redirectionUrl = "region!list.action";
		return SUCCESS;
	}

	// 更新页面缓存
	private void flushCache() {
		Cache cache = ServletCacheAdministrator.getInstance(
				getRequest().getSession().getServletContext()).getCache(
				getRequest(), PageContext.APPLICATION_SCOPE);
		cache.flushAll(new Date());
	}

	public void setRegion(Region region) {
		this.region = region;
	}

	public Region getRegion() {
		return region;
	}

	public void setRegionData(String regionData) {
		this.regionData = regionData;
	}

	public String getRegionData() {
		return regionData;
	}

	public void setParentId(String parentId) {
		this.parentId = parentId;
	}

	public String getParentId() {
		return parentId;
	}

}
