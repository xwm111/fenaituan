package net.shopxx.query.condition;

import net.shopxx.bean.Pager;

public interface IQueryCondition {

	public boolean isFuzzy();

	public String getCurrentPage();

	public String getPageSize();
	
	public Pager getPager();

	public void setCurrentPage(String currentPage);

	public void setPageSize(String pageSize);
}
