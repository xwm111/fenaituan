package org.shopxx.dao;

import java.util.List;

import net.shopxx.entity.Product;
import net.shopxx.entity.ProductCategory;

public interface ICategoryDAO {
	
	public List<ProductCategory>  getList();
	
	public List<ProductCategory>  findChildById(String id);
	
	public List<Product> findByCategoryId(String categoryid);
	
	public String getImage(String pic,String type);
	
	public List<Product> findHotProdoct();
	public List<Product> findBestProdoct();
}
