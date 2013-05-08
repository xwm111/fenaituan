package net.shopxx.query.condition;

import java.util.ArrayList;
import java.util.List;

import net.shopxx.bean.Pager;

import org.hibernate.criterion.Order;

public class DefaultCondition implements IQueryCondition {

	private String id = "";
	private String beginTime = ""; // ��ʼʱ��
	private String endTime = ""; // ����ʱ��
	private String fuzzy = ""; // �Ƿ�Ϊģ���ѯ 1���� 0����
	private String currentPage = "1";
	private String pageSize = "15";

	private Pager pager;

	private List<Order> orderList = new ArrayList<Order>();// 排序方式

	@Override
	public boolean isFuzzy() {
		if (getFuzzy().equals("") || getFuzzy().equals("0"))
			return false;
		return true;
	}

	// 添加排序方式
	public void addOrder(Order order) {
		if (orderList == null)
			orderList = new ArrayList<Order>();
		orderList.add(order);
	}

	public String getBeginTime() {
		return beginTime;
	}

	public void setBeginTime(String beginTime) {
		this.beginTime = beginTime;
	}

	public String getEndTime() {
		return endTime;
	}

	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}

	public String getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(String currentPage) {
		this.currentPage = currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage + "";
	}

	public String getPageSize() {
		return pageSize;
	}

	public void setPageSize(String pageSize) {
		this.pageSize = pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize + "";
	}

	public void setFuzzy(String fuzzy) {
		this.fuzzy = fuzzy;
	}

	public String getFuzzy() {
		return fuzzy;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getId() {
		return id;
	}

	public void setPager(Pager pager) {
		this.pager = pager;
	}

	public Pager getPager() {
		return pager;
	}

	public void setOrderList(List<Order> orderList) {
		this.orderList = orderList;
	}

	public List<Order> getOrderList() {
		return orderList;
	}

}
