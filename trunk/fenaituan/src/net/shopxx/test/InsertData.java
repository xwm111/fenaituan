package net.shopxx.test;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONArray;
import net.shopxx.bean.ProductImage;

public class InsertData {

	public static void main(String args[]) {
		InsertData instance = new InsertData();
		instance.execute();
	}

	public void execute() {
		Connection shopxxCon = null;
		Connection fenaituanCon = null;

		ResultSet categoryRs = null;
		ResultSet goodsRs = null;
		try {
			shopxxCon = getShopxxConnection();
			fenaituanCon = getFenaituanConnection();

			Statement shopxxState = shopxxCon.createStatement();
			Statement fenaituanState = fenaituanCon.createStatement();

			String categoryQuerySql = "select * from sc_category order by cat_id asc";
			String goodsQuerySql = "select * from sc_goods  ";

			categoryRs = fenaituanState.executeQuery(categoryQuerySql);

			// 转换 sc_category->productcategory
			while (categoryRs.next()) {
				Date createDate = new Date(System.currentTimeMillis());
				SimpleDateFormat db = new SimpleDateFormat(
						"yyyy-MM-dd HH:mm:ss");
				try {
					if (categoryRs.getString("parent_id") != null
							&& !categoryRs.getString("parent_id").equals("0"))
						shopxxState
								.execute("insert into productcategory(id,createDate,modifyDate,name,parent_id,orderList) values("
										+ "'"
										+ categoryRs.getString("cat_id")
										+ "','"
										+ db.format(createDate)
										+ "','"
										+ db.format(createDate)
										+ "','"
										+ categoryRs.getString("cat_name")
										+ "','"
										+ categoryRs.getString("parent_id")
										+ "',0)");
					else
						shopxxState
								.execute("insert into productcategory(id,createDate,modifyDate,name,orderList) values("
										+ "'"
										+ categoryRs.getString("cat_id")
										+ "','"
										+ db.format(createDate)
										+ "','"
										+ db.format(createDate)
										+ "','"
										+ categoryRs.getString("cat_name")
										+ "',0)");
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			categoryRs.close();
			goodsRs = fenaituanState.executeQuery(goodsQuerySql);

			// 转换sc_goods->product
			while (goodsRs.next()) {
				System.out.println(goodsRs.getString("goods_thumb") + " "
						+ goodsRs.getString("goods_img") + " "
						+ goodsRs.getString("original_img"));

				Map<String, String> thumbMap = new HashMap<String, String>();
				thumbMap.put("bigProductImagePath",
						"/" + goodsRs.getString("goods_img"));
				thumbMap.put("smallProductImagePath",
						"/" + goodsRs.getString("original_img"));
				thumbMap.put("sourceProductImagePath",
						"/" + goodsRs.getString("original_img"));
				thumbMap.put("thumbnailProductImagePath",
						"/" + goodsRs.getString("goods_thumb"));

				ProductImage pi = new ProductImage();
				pi.setBigProductImagePath("/" + goodsRs.getString("goods_img"));
				pi.setSmallProductImagePath("/"
						+ goodsRs.getString("original_img"));
				pi.setSourceProductImagePath("/"
						+ goodsRs.getString("original_img"));
				pi.setThumbnailProductImagePath("/"
						+ goodsRs.getString("goods_thumb"));

				List<ProductImage> piList = new ArrayList<ProductImage>();
				piList.add(pi);

				JSONArray jsonArray = JSONArray.fromObject(piList);

				long addTime = goodsRs.getLong("add_time");
				long lastUpdate = goodsRs.getLong("last_update");
				Date createDate = new Date(addTime * 1000);
				Date modifyDate = new Date(lastUpdate * 1000);
				SimpleDateFormat db = new SimpleDateFormat(
						"yyyy-MM-dd HH:mm:ss");
				System.out.println(goodsRs.getString("is_best"));
				try {
					String sql = "insert into product(id,productCategory_id,freezeStore,weightUnit,htmlFilePath,createDate,modifyDate,isBest,isNew,isHot,isMarketable,marketPrice,name,point,price,productImageListStore,productSn,store,weight,trusteeship) values("
							+ "'"
							+ goodsRs.getString("goods_id")
							+ "','"
							+ goodsRs.getString("cat_id")
							+ "',0,0,'','"
							+ db.format(createDate)
							+ "','"
							+ db.format(modifyDate)
							+ "',"
							+ goodsRs.getString("is_best")
							+ ","
							+ goodsRs.getString("is_new")
							+ ","
							+ goodsRs.getString("is_hot")
							+ ",1,"
							+ goodsRs.getFloat("market_price")
							+ ",'"
							+ goodsRs.getString("goods_name")
							+ "',0,'"
							+ goodsRs.getString("shop_price")
							+ "','"
							+ jsonArray
							+ "','"
							+ goodsRs.getString("goods_sn")
							+ "','"
							+ goodsRs.getString("goods_number")
							+ "','"
							+ goodsRs.getString("goods_weight") + "',0)";
					System.out.println(sql);
					shopxxState.execute(sql);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			goodsRs.close();
			System.out.println("数据转换完毕！");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {

				shopxxCon.close();
				fenaituanCon.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

	public Connection getFenaituanConnection() throws SQLException,
			ClassNotFoundException {
		String driver = "com.mysql.jdbc.Driver";
		String url = "jdbc:mysql://127.0.0.1:3306/fenai";
		String user = "root";
		String password = "123";
		Class.forName(driver);
		return DriverManager.getConnection(url, user, password);
	}

	public Connection getShopxxConnection() throws SQLException,
			ClassNotFoundException {
		String driver = "com.mysql.jdbc.Driver";
		String url = "jdbc:mysql://127.0.0.1:3306/shopxx";
		String user = "root";
		String password = "123";
		Class.forName(driver);
		return DriverManager.getConnection(url, user, password);
	}

}
