package net.shopxx.dao.impl;

import java.util.Collection;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import net.shopxx.bean.Pager;
import net.shopxx.bean.Pager.OrderType;
import net.shopxx.dao.ProductDao;
import net.shopxx.entity.DeliveryItem;
import net.shopxx.entity.Member;
import net.shopxx.entity.OrderItem;
import net.shopxx.entity.Product;
import net.shopxx.entity.ProductCategory;
import net.shopxx.entity.Region;
import net.shopxx.entity.Product.Trusteeship;
import net.shopxx.query.condition.IQueryCondition;
import net.shopxx.query.condition.ProductCondition;
import net.shopxx.util.SystemConfigUtil;

import org.apache.commons.lang.StringUtils;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Expression;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.hibernate.criterion.Subqueries;
import org.springframework.stereotype.Repository;

/**
 * Dao实现类 - 商品
 * ============================================================================
 * 版权所有 2008-2010 长沙鼎诚软件有限公司，并保留所有权利。
 * ----------------------------------------------------------------------------
 * 提示：在未取得SHOP++商业授权之前，您不能将本软件应用于商业用途，否则SHOP++将保留追究的权力。
 * ----------------------------------------------------------------------------
 * 官方网站：http://www.shopxx.net
 * ----------------------------------------------------------------------------
 * KEY: SHOPXX027556F67EB15567DE4DCC7E9D2E5516
 * ============================================================================
 */

@Repository
public class ProductDaoImpl extends BaseDaoImpl<Product, String> implements
		ProductDao {

	@SuppressWarnings("unchecked")
	public List<Product> getProductList(ProductCategory productCategory) {
		String hql = "from Product as product where product.isMarketable = ? and product.productCategory.path like ? order by product.createDate desc";
		return getSession().createQuery(hql).setParameter(0, true)
				.setParameter(1, productCategory.getPath() + "%").list();
	}

	@SuppressWarnings("unchecked")
	public List<Product> getProductList(int firstResult, int maxResults) {
		String hql = "from Product as product where product.isMarketable = ? order by product.createDate desc";
		return getSession().createQuery(hql).setParameter(0, true)
				.setFirstResult(firstResult).setMaxResults(maxResults).list();
	}

	@SuppressWarnings("unchecked")
	public List<Product> getProductList(ProductCategory productCategory,
			int firstResult, int maxResults) {
		String hql = "from Product as product where product.isMarketable = ? and product.productCategory.path like ? order by product.createDate desc";
		return getSession().createQuery(hql).setParameter(0, true)
				.setParameter(1, productCategory.getPath() + "%")
				.setFirstResult(firstResult).setMaxResults(maxResults).list();
	}

	@SuppressWarnings("unchecked")
	public List<Product> getProductList(Date beginDate, Date endDate,
			int firstResult, int maxResults) {
		if (beginDate != null && endDate == null) {
			String hql = "from Product as product where product.isMarketable = ? and product.createDate > ? order by product.createDate desc";
			return getSession().createQuery(hql).setParameter(0, true)
					.setParameter(1, beginDate).setFirstResult(firstResult)
					.setMaxResults(maxResults).list();
		} else if (endDate != null && beginDate == null) {
			String hql = "from Product as product where product.isMarketable = ? and product.createDate < ? order by product.createDate desc";
			return getSession().createQuery(hql).setParameter(0, true)
					.setParameter(1, endDate).setFirstResult(firstResult)
					.setMaxResults(maxResults).list();
		} else if (endDate != null && beginDate != null) {
			String hql = "from Product as product where product.isMarketable = ? and product.createDate > ? and product.createDate < ? order by product.createDate desc";
			return getSession().createQuery(hql).setParameter(0, true)
					.setParameter(1, beginDate).setParameter(2, endDate)
					.setFirstResult(firstResult).setMaxResults(maxResults)
					.list();
		} else {
			String hql = "from Product as product where product.isMarketable = ? order by product.createDate desc";
			return getSession().createQuery(hql).setParameter(0, true)
					.setFirstResult(firstResult).setMaxResults(maxResults)
					.list();
		}
	}

	public Pager getProductPager(ProductCategory productCategory, Pager pager) {
		return getProductPager(productCategory, pager, null);
	}

	@Override
	public Pager getProductPager(ProductCategory productCategory, Pager pager,
			Collection<Region> regions) {
		DetachedCriteria detachedCriteria = DetachedCriteria.forClass(
				Product.class, "product");
		detachedCriteria.createAlias("productCategory", "productCategory");
		detachedCriteria.add(Restrictions.or(
				Restrictions.eq("productCategory", productCategory),
				Restrictions.like("productCategory.path",
						productCategory.getPath() + "%")));
		detachedCriteria.add(Restrictions.eq("isMarketable", true));
		if (regions != null && regions.size() > 0) {
			Set<String> idSet = new HashSet<String>();
			for (Region region : regions) {
				idSet.add(region.getId());
			}

			// 子查询
			DetachedCriteria regionQuery = DetachedCriteria.forClass(
					Region.class, "re");
			regionQuery.createAlias("productSet", "p");
			regionQuery.setProjection(Projections.rowCount());
			regionQuery.add(Expression.eqProperty("p.id", "product.id"));
			regionQuery.add(Restrictions.in("id", idSet));

			detachedCriteria.add(Subqueries.lt(0, regionQuery)); // 通过子查询防止出现重复记录
		}
		return super.findByPager(pager, detachedCriteria);
	}

	@Override
	public Pager queryForPager(IQueryCondition condition) {
		DetachedCriteria query = DetachedCriteria.forClass(Product.class,
				"product");
		ProductCondition pCondition = (ProductCondition) condition;

		// 销售类型
		if (!pCondition.getSalesType().trim().equals("")) {
			query.add(Restrictions.eq("salesType", pCondition.getSalesType()));
		}

		// 线下交易
		if (pCondition.getTradeType().trim().equals("outline")) {
			// 未托管即为线下交易
			query.add(Restrictions
					.sqlRestriction("(trusteeship<>2 and trusteeship is not null)"));
		}

		// 托管
		if (!pCondition.getTrusteeship().trim().equals("")) {
			Trusteeship trusteeship = null;
			if (pCondition.getTrusteeship().equals("0"))
				trusteeship = Trusteeship.unused;
			else if (pCondition.getTrusteeship().equals("1"))
				trusteeship = Trusteeship.processing;
			else if (pCondition.getTrusteeship().equals("2"))
				trusteeship = Trusteeship.received;
			else if (pCondition.getTrusteeship().equals("3"))
				trusteeship = Trusteeship.cancel;

			// 为null也表示未托管
			if (pCondition.getTrusteeship().equals("0")) {
				query.add(Restrictions.or(
						Restrictions.eq("trusteeship", trusteeship),
						Restrictions.isNull("trusteeship")));
			} else
				query.add(Restrictions.eq("trusteeship", trusteeship));
		}

		// 商品创建者
		if (pCondition.getMember() != null) {
			query.createAlias("creatorMem", "creatorMem");
			query.add(Restrictions.eq("creatorMem.id", pCondition.getMember()
					.getId()));
		}

		// 商品类型
		if (pCondition.getProductCategory() != null) {
			ProductCategory productCategory = pCondition.getProductCategory();
			query.createAlias("productCategory", "productCategory");
			query.add(Restrictions.or(
					Restrictions.eq("productCategory", productCategory),
					Restrictions.like("productCategory.path",
							productCategory.getPath() + "%")));
		}

		// 区域
		Set<Region> regions = pCondition.getRegions();
		if (regions != null && regions.size() > 0) {
			Set<String> idSet = new HashSet<String>();
			for (Region region : regions) {
				idSet.add(region.getId());
			}

			// 子查询
			DetachedCriteria regionQuery = DetachedCriteria.forClass(
					Region.class, "re");
			regionQuery.createAlias("productSet", "p");
			regionQuery.setProjection(Projections.rowCount());
			regionQuery.add(Expression.eqProperty("p.id", "product.id"));

			regionQuery.add(Restrictions.in("id", idSet));

			if (pCondition.getAdmin() != null)
				query.add(Subqueries.le(0, regionQuery));
			else
				query.add(Subqueries.lt(0, regionQuery)); // 通过子查询防止出现重复记录
		}

		if (pCondition.isMarketable())
			query.add(Restrictions.eq("isMarketable", true));

		Pager pager = pCondition.getPager();
		if (pager != null) {
			String orderBy = pager.getOrderBy();
			OrderType orderType = pager.getOrderType();
			if (StringUtils.isNotEmpty(orderBy) && orderType != null) {
				if (orderType == OrderType.asc) {
					query.addOrder(Order.asc(orderBy));
				} else {
					query.addOrder(Order.desc(orderBy));
				}
			}
		}

		// 排序
		for (Order order : pCondition.getOrderList()) {
			query.addOrder(order);
		}
		return super.findByPager(condition.getPager(), query);
	}

	@SuppressWarnings("unchecked")
	public List<Product> getBestProductList(int maxResults) {
		String hql = "from Product as product where product.isMarketable = ? and product.isBest = ? order by product.createDate desc";
		return getSession().createQuery(hql).setParameter(0, true)
				.setParameter(1, true).list();
	}

	@SuppressWarnings("unchecked")
	public List<Product> getBestProductList(ProductCategory productCategory,
			int maxResults) {
		String hql = "from Product as product where product.isMarketable = ? and product.isBest = ? and (productCategory = ? or product.productCategory.path like ?) order by product.createDate desc";
		return getSession().createQuery(hql).setParameter(0, true)
				.setParameter(1, true).setParameter(2, productCategory)
				.setParameter(3, productCategory.getPath() + "%").list();
	}

	@SuppressWarnings("unchecked")
	public List<Product> getHotProductList(int maxResults) {
		String hql = "from Product as product where product.isMarketable = ? and product.isHot = ? order by product.createDate desc";
		return getSession().createQuery(hql).setParameter(0, true)
				.setParameter(1, true).list();
	}

	@SuppressWarnings("unchecked")
	public List<Product> getHotProductList(ProductCategory productCategory,
			int maxResults) {
		String hql = "from Product as product where product.isMarketable = ? and product.isHot = ? and (productCategory = ? or product.productCategory.path like ?) order by product.createDate desc";
		return getSession().createQuery(hql).setParameter(0, true)
				.setParameter(1, true).setParameter(2, productCategory)
				.setParameter(3, productCategory.getPath() + "%").list();
	}

	@SuppressWarnings("unchecked")
	public List<Product> getNewProductList(int maxResults) {
		String hql = "from Product as product where product.isMarketable = ? and product.isNew = ? order by product.createDate desc";
		return getSession().createQuery(hql).setParameter(0, true)
				.setParameter(1, true).list();
	}

	@SuppressWarnings("unchecked")
	public List<Product> getNewProductList(ProductCategory productCategory,
			int maxResults) {
		String hql = "from Product as product where product.isMarketable = ? and product.isNew = ? and (productCategory = ? or product.productCategory.path like ?) order by product.createDate desc";
		return getSession().createQuery(hql).setParameter(0, true)
				.setParameter(1, true).setParameter(2, productCategory)
				.setParameter(3, productCategory.getPath() + "%").list();
	}

	public Pager getFavoriteProductPager(Member member, Pager pager) {
		DetachedCriteria detachedCriteria = DetachedCriteria
				.forClass(Product.class);
		detachedCriteria.createAlias("favoriteMemberSet", "favoriteMemberSet");
		detachedCriteria.add(Restrictions.eq("favoriteMemberSet.id",
				member.getId()));
		detachedCriteria.addOrder(Order.desc("name"));
		return findByPager(pager, detachedCriteria);
	}

	public Long getStoreAlertCount() {
		String hql = "select count(*) from Product as product where product.isMarketable = ? and product.store - product.freezeStore <= ?";
		return (Long) getSession()
				.createQuery(hql)
				.setParameter(0, true)
				.setParameter(1,
						SystemConfigUtil.getSystemConfig().getStoreAlertCount())
				.uniqueResult();
	}

	public Long getMarketableProductCount() {
		String hql = "select count(*) from Product as product where product.isMarketable = ?";
		return (Long) getSession().createQuery(hql).setParameter(0, true)
				.uniqueResult();
	}

	public Long getUnMarketableProductCount() {
		String hql = "select count(*) from Product as product where product.isMarketable = ?";
		return (Long) getSession().createQuery(hql).setParameter(0, false)
				.uniqueResult();
	}

	// 关联处理
	@Override
	public void delete(Product product) {
		Set<Member> favoriteMemberSet = product.getFavoriteMemberSet();
		if (favoriteMemberSet != null) {
			for (Member favoriteMember : favoriteMemberSet) {
				Set<Product> favoriteProductSet = favoriteMember
						.getFavoriteProductSet();
				favoriteProductSet.remove(product);
			}
		}
		Set<OrderItem> orderItemSet = product.getOrderItemSet();
		if (orderItemSet != null) {
			for (OrderItem orderItem : orderItemSet) {
				orderItem.setProduct(null);
			}
		}
		Set<DeliveryItem> deliveryItemSet = product.getDeliveryItemSet();
		if (deliveryItemSet != null) {
			for (DeliveryItem deliveryItem : deliveryItemSet) {
				deliveryItem.setProduct(null);
			}
		}
		super.delete(product);
	}

	// 关联处理
	@Override
	public void delete(String id) {
		Product product = load(id);
		this.delete(product);
	}

	// 关联处理
	@Override
	public void delete(String[] ids) {
		for (String id : ids) {
			Product product = load(id);
			this.delete(product);
		}
	}

}