package org.shopxx.action;

import java.util.ArrayList;
import java.util.List;

import net.shopxx.entity.ProductCategory;

import org.apache.log4j.Category;
import org.shopxx.dao.impl.CategoryDAO;

import com.opensymphony.xwork2.ActionSupport;

public class CategoryAction extends ActionSupport{
	public void setProductCategory(List<ProductCategory> productCategory) {
		this.productCategory = productCategory;
	}
	private List<ProductCategory> productCategory=new ArrayList<ProductCategory>();
	private CategoryDAO categoryDAO=new CategoryDAO();
	public List<ProductCategory> getProductCategory() {
		return productCategory;
	}
	public String getparentcategory()
	{
		productCategory=categoryDAO.getList();
		return SUCCESS;
	}

}
