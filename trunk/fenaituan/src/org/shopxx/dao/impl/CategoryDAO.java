package org.shopxx.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import net.sf.json.JSONObject;
import net.shopxx.entity.Product;
import net.shopxx.entity.ProductCategory;
import net.shopxx.util.DBConnection;

import org.shopxx.dao.ICategoryDAO;
public class CategoryDAO  implements ICategoryDAO   {



	public List<ProductCategory> getList() {
		String sql="SELECT * FROM  productcategory WHERE parent_id  IS NULL";
		List<ProductCategory> list=new ArrayList<ProductCategory>();
		Connection con=DBConnection.getCon();
		try {
			PreparedStatement ps=con.prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				String name=rs.getString("name");
				String id=rs.getString("id");
				ProductCategory pc=new ProductCategory();
				pc.setName(name);
				pc.setId(id);
				list.add(pc);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		DBConnection.close(con);
		return list;
	}

	@Override
	public List<ProductCategory> findChildById(String pid) {
		List<ProductCategory> list=new ArrayList<ProductCategory>();
		Connection con=DBConnection.getCon();
		String sql="select * from productcategory WHERE parent_id  ='"+pid+"'";
		try {
			PreparedStatement ps=con.prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				String name=rs.getString("name");
				String id=rs.getString("id");
				ProductCategory pc=new ProductCategory();
				pc.setName(name);
				pc.setId(id);
				list.add(pc);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		DBConnection.close(con);
		return list;
		
	}

	@Override
	public List<Product> findByCategoryId(String categoryid) {
		List<Product> products=new ArrayList<Product>();
		Connection con=DBConnection.getCon();
		String sql="select * from product where productCategory_id ='"+categoryid+"'";
		System.out.println(sql);
		try {
			PreparedStatement ps=con.prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				Product p=new Product();
				String htmlFilePath=rs.getString("htmlFilePath");
				p.setId(rs.getString("id"));
				p.setHtmlFilePath(htmlFilePath);
				p.setName(rs.getString("name"));
				p.setMarketPrice(rs.getBigDecimal("marketPrice"));
				p.setPrice(rs.getBigDecimal("price"));
				p.setProductImageListStore(rs.getString("productImageListStore"));
				products.add(p);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		DBConnection.close(con);
		return products;
	}

  public String getImage(String pic,String type)
  {
	  pic=pic.substring(1, pic.length()-1);
	  JSONObject json=JSONObject.fromObject(pic);
	  return json.getString(type);
  }

@Override
public List<Product> findHotProdoct() {
	List<Product> products=new ArrayList<Product>();
	Connection con=DBConnection.getCon();
	String sql="select * from product where isHot=1 ;";
	System.out.println(sql);
	try {
		PreparedStatement ps=con.prepareStatement(sql);
		ResultSet rs=ps.executeQuery();
		while(rs.next())
		{
			Product p=new Product();
			String htmlFilePath=rs.getString("htmlFilePath");
			p.setId(rs.getString("id"));
			p.setHtmlFilePath(htmlFilePath);
			p.setName(rs.getString("name"));
			p.setMarketPrice(rs.getBigDecimal("marketPrice"));
			p.setPrice(rs.getBigDecimal("price"));
			p.setProductImageListStore(rs.getString("productImageListStore"));
			p.setDescription(rs.getString("description"));
			products.add(p);
		}
		
	} catch (SQLException e) {
		e.printStackTrace();
	}
	DBConnection.close(con);
	return products;
}

@Override
public List<Product> findBestProdoct() {
	List<Product> products=new ArrayList<Product>();
	Connection con=DBConnection.getCon();
	String sql="select * from product where isBest=1 limit 0,4;";
	System.out.println(sql);
	try {
		PreparedStatement ps=con.prepareStatement(sql);
		ResultSet rs=ps.executeQuery();
		while(rs.next())
		{
			Product p=new Product();
			String htmlFilePath=rs.getString("htmlFilePath");
			p.setId(rs.getString("id"));
			p.setHtmlFilePath(htmlFilePath);
			p.setName(rs.getString("name"));
			p.setMarketPrice(rs.getBigDecimal("marketPrice"));
			p.setPrice(rs.getBigDecimal("price"));
			p.setProductImageListStore(rs.getString("productImageListStore"));
			products.add(p);
		}
		
	} catch (SQLException e) {
		e.printStackTrace();
	}
	DBConnection.close(con);
	return products;
}

}
