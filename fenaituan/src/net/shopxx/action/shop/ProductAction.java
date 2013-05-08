package net.shopxx.action.shop;

import java.io.File;

import java.io.UnsupportedEncodingException;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.annotation.Resource;
import javax.servlet.jsp.PageContext;
import org.hibernate.criterion.Order;
import net.shopxx.bean.Pager;
import net.shopxx.bean.Pager.OrderType;
import net.shopxx.bean.ProductImage;
import net.shopxx.bean.SystemConfig;
import net.shopxx.bean.SystemConfig.PointType;
import net.shopxx.entity.Brand;
import net.shopxx.entity.Member;
import net.shopxx.entity.Product;
import net.shopxx.entity.Product.Trusteeship;
import net.shopxx.entity.Product.WeightUnit;
import net.shopxx.entity.ProductAttribute;
import net.shopxx.entity.ProductAttribute.AttributeType;
import net.shopxx.entity.ProductCategory;
import net.shopxx.entity.ProductType;
import net.shopxx.entity.Region;
import net.shopxx.query.condition.ProductCondition;
import net.shopxx.service.BrandService;
import net.shopxx.service.ProductAttributeService;
import net.shopxx.service.ProductCategoryService;
import net.shopxx.service.ProductImageService;
import net.shopxx.service.ProductService;
import net.shopxx.service.ProductTypeService;
import net.shopxx.service.RegionService;
import net.shopxx.util.SerialNumberUtil;

import org.apache.commons.lang.ArrayUtils;
import org.apache.commons.lang.StringUtils;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.springframework.beans.BeanUtils;

import com.opensymphony.oscache.base.Cache;
import com.opensymphony.oscache.web.ServletCacheAdministrator;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.interceptor.annotations.InputConfig;
import com.opensymphony.xwork2.validator.annotations.IntRangeFieldValidator;
import com.opensymphony.xwork2.validator.annotations.RequiredFieldValidator;
import com.opensymphony.xwork2.validator.annotations.RequiredStringValidator;
import com.opensymphony.xwork2.validator.annotations.Validations;

/**
 * 前台Action类 - 商品
 * ============================================================================
 * 版权所有 2008-2010 长沙鼎诚软件有限公司，并保留所有权利。
 * ----------------------------------------------------------------------------
 * 提示：在未取得SHOP++商业授权之前，您不能将本软件应用于商业用途，否则SHOP++将保留追究的权力。
 * ----------------------------------------------------------------------------
 * 官方网站：http://www.shopxx.net
 * ----------------------------------------------------------------------------
 * KEY: SHOPXXD555C0667F7008EC5F71FFFB78A4F6AB
 * ============================================================================
 */

@ParentPackage("shop")
public class ProductAction extends BaseShopAction {

	private static final long serialVersionUID = -4969421249817468001L;

	private File[] productImages;
	private String[] productImagesFileName;
	private String[] productImageParameterTypes;
	private String[] productImageIds;

	private ProductCategory productCategory;
	private String orderType;// 排序类型
	private String viewType;// 查看类型
	private String currentPage; // 当前页

	private String regionId;// 地区id
	private String regionIds = "";
	private Region region = new Region();
	private String regionData = "[]";
	private String regionCur = "[]";

	private Product product;

	private ProductCondition condition = new ProductCondition();

	private List<ProductCategory> rootProductCategoryList;

	private List<Product> bestProductList;
	private List<Product> hotProductList;
	private List<Product> newProductList;
	private List<ProductCategory> pathList;

	@Resource
	private ProductService productService;
	@Resource
	private ProductCategoryService productCategoryService;
	@Resource
	private RegionService regionService;
	@Resource
	private ProductImageService productImageService;
	@Resource
	private ProductTypeService productTypeService;
	@Resource
	private ProductAttributeService productAttributeService;
	@Resource
	private BrandService brandService;

	// 获取商品分类树
	public List<ProductCategory> getProductCategoryTreeList() {
		return productCategoryService.getProductCategoryTreeList();
	}

	// 获取所有品牌
	public List<Brand> getAllBrand() {
		return brandService.getAll();
	}

	// 获取所有商品类型
	public List<ProductType> getAllProductType() {
		return productTypeService.getAll();
	}

	// 获取所有重量单位
	public List<WeightUnit> getAllWeightUnit() {
		List<WeightUnit> allWeightUnit = new ArrayList<WeightUnit>();
		for (WeightUnit weightUnit : WeightUnit.values()) {
			allWeightUnit.add(weightUnit);
		}
		return allWeightUnit;
	}

	// 添加
	public String add() {
		if (!hasLogin())
			return "login";
		return "secondary_input";
	}

	// 编辑
	public String edit() {
		if (!hasLogin())
			return "login";
		product = productService.load(id);
		regionCur = regionService.getJsonArrayByProductId(id).toString();
		Set<Region> regionSet = product.getRegionSet();
		for (Region region : regionSet) {
			regionIds += region.getId() + ",";
		}
		return "secondary_input";
	}

	public String listSecondary() {
		if (!hasLogin())
			return "login";
		if (pager == null) {
			pager = new Pager();
			pager.setPageSize(Product.DEFAULT_PRODUCT_LIST_PAGE_SIZE);
		}
		pager.setProperty(null);
		pager.setKeyword(null);

		if (StringUtils.equalsIgnoreCase(orderType, "priceAsc")) {
			pager.setOrderBy("price");
			pager.setOrderType(OrderType.asc);
		} else if (StringUtils.equalsIgnoreCase(orderType, "priceDesc")) {
			pager.setOrderBy("price");
			pager.setOrderType(OrderType.desc);
		} else if (StringUtils.equalsIgnoreCase(orderType, "dateAsc")) {
			pager.setOrderBy("createDate");
			pager.setOrderType(OrderType.asc);
		} else {
			pager.setOrderBy(null);
			pager.setOrderType(null);
		}

		condition.setPager(pager);
		condition.setProductCategory(productCategory);
		String loginMemberId = (String) getSession().get(
				Member.LOGIN_MEMBER_ID_SESSION_NAME);

		pager = productService.getSecondaryProductPagerByMember(condition,
				memberService.load(loginMemberId));

		currentPage = "product!listSecondary.action";
		return "secondary_list";
	}

	private boolean hasLogin() {
		Map<String, Object> session = ActionContext.getContext().getSession();
		String loginMemberId = (String) session
				.get(Member.LOGIN_MEMBER_ID_SESSION_NAME);
		if (loginMemberId != null)
			return true;
		return false;
	}

	@InputConfig(resultName = "error")
	public String list() throws UnsupportedEncodingException {
		productCategory = productCategoryService.load(id);
		bestProductList = productService.getBestProductList(productCategory,
				Product.MAX_BEST_PRODUCT_LIST_COUNT);
		hotProductList = productService.getHotProductList(productCategory,
				Product.MAX_HOT_PRODUCT_LIST_COUNT);
		newProductList = productService.getNewProductList(productCategory,
				Product.MAX_NEW_PRODUCT_LIST_COUNT);
		pathList = productCategoryService
				.getProductCategoryPathList(productCategory);
		regionData = regionService.getJsonArrayAll().toString();

		String regionId = region.getId();
		regionId = regionId == null ? getCookie("regionId") : regionId;
		if (regionId != null && !regionId.trim().equals("")) {
			region = regionService.get(regionId);
			if (region != null) {
				addCookie("regionId", region.getId());
				addCookie("regionName", region.getRegionName());
			}
		} else {
			region.setRegionName("选择地区");
			addCookie("regionName", "选择地区");
		}

		if (pager == null) {
			pager = new Pager();
			pager.setPageSize(Product.DEFAULT_PRODUCT_LIST_PAGE_SIZE);
		}
		pager.setProperty(null);
		pager.setKeyword(null);

		if (StringUtils.equalsIgnoreCase(orderType, "priceAsc")) {
			pager.setOrderBy("price");
			pager.setOrderType(OrderType.asc);
		} else if (StringUtils.equalsIgnoreCase(orderType, "priceDesc")) {
			pager.setOrderBy("price");
			pager.setOrderType(OrderType.desc);
		} else if (StringUtils.equalsIgnoreCase(orderType, "dateAsc")) {
			pager.setOrderBy("createDate");
			pager.setOrderType(OrderType.asc);
		} else {
			pager.setOrderBy(null);
			pager.setOrderType(null);
		}

		condition.setPager(pager);
		condition.setProductCategory(productCategory);
		condition.setRegion(region);
		condition.setMarketable(true);

		// 线下交易默认排在后面
		condition.addOrder(Order.asc("salesType"));
		condition.addOrder(Order.desc("trusteeship"));
		pager = productService.queryForPager(condition);
		// pager = productService.getProductPager(productCategory,
		// pager,getRegion());

		if (StringUtils.equalsIgnoreCase(viewType, "tableType")) {
			return "table_list";
		} else {
			return "picture_list";
		}
	}
	
	public String applyTrusteeship(){
		if (!hasLogin())
			return "login";
		product = productService.load(id);
		if(!product.getTrusteeship().equals(Trusteeship.unused))
			return ERROR;
		product.setTrusteeship(Trusteeship.processing);
		productService.update(product);
		redirectionUrl = "product!listSecondary.action";
		return SUCCESS;
	}

	@Validations(requiredStrings = { @RequiredStringValidator(fieldName = "pager.keyword", message = "搜索关键词不允许为空!") })
	@InputConfig(resultName = "error")
	public String search() throws Exception {
		bestProductList = productService
				.getBestProductList(Product.MAX_BEST_PRODUCT_LIST_COUNT);
		hotProductList = productService
				.getHotProductList(Product.MAX_HOT_PRODUCT_LIST_COUNT);
		newProductList = productService
				.getNewProductList(Product.MAX_NEW_PRODUCT_LIST_COUNT);
		regionData = regionService.getJsonArrayAll().toString();

		if (pager == null) {
			pager = new Pager();
			pager.setPageSize(Product.DEFAULT_PRODUCT_LIST_PAGE_SIZE);
		}

		if (StringUtils.equalsIgnoreCase(orderType, "priceAsc")) {
			pager.setOrderBy("price");
			pager.setOrderType(OrderType.asc);
		} else if (StringUtils.equalsIgnoreCase(orderType, "priceDesc")) {
			pager.setOrderBy("price");
			pager.setOrderType(OrderType.desc);
		} else if (StringUtils.equalsIgnoreCase(orderType, "dateAsc")) {
			pager.setOrderBy("createDate");
			pager.setOrderType(OrderType.asc);
		} else {
			pager.setOrderBy(null);
			pager.setOrderType(null);
		}

		pager = productService.search(pager);

		if (StringUtils.equalsIgnoreCase(viewType, "tableType")) {
			return "table_search";
		} else {
			return "picture_search";
		}
	}

	// 保存
	@Validations(requiredStrings = { @RequiredStringValidator(fieldName = "product.name", message = "商品名称不允许为空!") }, requiredFields = {
			@RequiredFieldValidator(fieldName = "product.price", message = "销售价不允许为空!"),
			@RequiredFieldValidator(fieldName = "product.marketPrice", message = "市场价不允许为空!"),
			@RequiredFieldValidator(fieldName = "product.weight", message = "商品重量不允许为空!"),
			@RequiredFieldValidator(fieldName = "product.weightUnit", message = "商品重量单位不允许为空!"),
			@RequiredFieldValidator(fieldName = "product.isMarketable", message = "是否上架不允许为空!"),
			@RequiredFieldValidator(fieldName = "product.productCategory.id", message = "所属分类不允许为空!") }, intRangeFields = {
			@IntRangeFieldValidator(fieldName = "product.point", min = "0", message = "积分必须为零或正整数!"),
			@IntRangeFieldValidator(fieldName = "product.store", min = "0", message = "库存必须为零或正整数!") })
	@InputConfig(resultName = "error")
	public String save() throws Exception {
		if (!hasLogin())
			return "login";

		product.setIsBest(false);
		product.setIsNew(false);
		product.setIsHot(false);
		product.setSalesType(Product.SALES_TYPE_SECONDARY);
		String loginMemberId = (String) getSession().get(
				Member.LOGIN_MEMBER_ID_SESSION_NAME);
		product.setCreatorMem(memberService.load(loginMemberId));

		if (product.getPrice().compareTo(new BigDecimal("0")) < 0) {
			addActionError("销售价不允许小于0");
			return ERROR;
		}
		if (product.getMarketPrice().compareTo(new BigDecimal("0")) < 0) {
			addActionError("市场价不允许小于0");
			return ERROR;
		}
		if (product.getWeight() < 0) {
			addActionError("商品重量只允许为正数或零!");
			return ERROR;
		}
		if (StringUtils.isNotEmpty(product.getProductSn())) {
			if (productService.isExist("productSn", product.getProductSn())) {
				addActionError("货号重复,请重新输入!");
				return ERROR;
			}
		} else {
			String productSn = SerialNumberUtil.buildProductSn();
			product.setProductSn(productSn);
		}
		ProductType productType = product.getProductType();
		if (productType != null && StringUtils.isNotEmpty(productType.getId())) {
			productType = productTypeService.load(productType.getId());
		} else {
			productType = null;
		}

		if (productType != null) {
			Map<ProductAttribute, List<String>> productAttributeMap = new HashMap<ProductAttribute, List<String>>();
			List<ProductAttribute> enabledProductAttributeList = productAttributeService
					.getEnabledProductAttributeList(productType);
			for (ProductAttribute productAttribute : enabledProductAttributeList) {
				String[] parameterValues = getParameterValues(productAttribute
						.getId());
				if (productAttribute.getIsRequired()
						&& (parameterValues == null
								|| parameterValues.length == 0 || StringUtils
								.isEmpty(parameterValues[0]))) {
					addActionError(productAttribute.getName() + "不允许为空!");
					return ERROR;
				}
				if (parameterValues != null && parameterValues.length > 0
						&& StringUtils.isNotEmpty(parameterValues[0])) {
					if (productAttribute.getAttributeType() == AttributeType.number) {
						Pattern pattern = Pattern
								.compile("^-?(?:\\d+|\\d{1,3}(?:,\\d{3})+)(?:\\.\\d+)?");
						Matcher matcher = pattern.matcher(parameterValues[0]);
						if (!matcher.matches()) {
							addActionError(productAttribute.getName()
									+ "只允许输入数字!");
							return ERROR;
						}
					}
					if (productAttribute.getAttributeType() == AttributeType.alphaint) {
						Pattern pattern = Pattern.compile("[a-zA-Z]+");
						Matcher matcher = pattern.matcher(parameterValues[0]);
						if (!matcher.matches()) {
							addActionError(productAttribute.getName()
									+ "只允许输入字母!");
							return ERROR;
						}
					}
					if (productAttribute.getAttributeType() == AttributeType.date) {
						Pattern pattern = Pattern
								.compile("\\d{4}[\\/-]\\d{1,2}[\\/-]\\d{1,2}");
						Matcher matcher = pattern.matcher(parameterValues[0]);
						if (!matcher.matches()) {
							addActionError(productAttribute.getName()
									+ "日期格式错误!");
							return ERROR;
						}
					}
					if (productAttribute.getAttributeType() == AttributeType.select
							|| productAttribute.getAttributeType() == AttributeType.checkbox) {
						List<String> attributeOptionList = productAttribute
								.getAttributeOptionList();
						for (String parameterValue : parameterValues) {
							if (!attributeOptionList.contains(parameterValue)) {
								addActionError("参数错误!");
								return ERROR;
							}
						}
					}
					productAttributeMap.put(productAttribute,
							Arrays.asList(parameterValues));
				}
			}
			product.setProductAttributeMap(productAttributeMap);
		} else {
			product.setProductAttributeMap(null);
		}
		product.setProductType(productType);

		if (productImages != null) {
			String allowedUploadImageExtension = getSystemConfig()
					.getAllowedUploadImageExtension().toLowerCase();
			if (StringUtils.isEmpty(allowedUploadImageExtension)) {
				addActionError("不允许上传图片文件!");
				return ERROR;
			}
			for (int i = 0; i < productImages.length; i++) {
				String productImageExtension = StringUtils.substringAfterLast(
						productImagesFileName[i], ".").toLowerCase();
				String[] imageExtensionArray = allowedUploadImageExtension
						.split(SystemConfig.EXTENSION_SEPARATOR);
				if (!ArrayUtils.contains(imageExtensionArray,
						productImageExtension)) {
					addActionError("只允许上传图片文件类型: "
							+ allowedUploadImageExtension + "!");
					return ERROR;
				}
				if (getSystemConfig().getUploadLimit() != 0
						&& productImages[i].length() > getSystemConfig()
								.getUploadLimit() * 1024) {
					addActionError("此上传文件大小超出限制!");
					return ERROR;
				}
			}
		}

		if (StringUtils.isEmpty(product.getBrand().getId())) {
			product.setBrand(null);
		}

		if (getSystemConfig().getPointType() == PointType.productSet) {
			if (product.getPoint() == null) {
				addActionError("积分不允许为空!");
				return ERROR;
			}
		} else {
			product.setPoint(0);
		}

		List<ProductImage> productImageList = new ArrayList<ProductImage>();
		if (productImages != null && productImages.length > 0) {
			for (int i = 0; i < productImages.length; i++) {
				ProductImage productImage = productImageService
						.buildProductImage(productImages[i]);
				productImageList.add(productImage);
			}
		}
		product.setProductImageList(productImageList);
		product.setFreezeStore(0);
		product.setFavoriteMemberSet(null);
		productService.save(product);
		flushCache();
		redirectionUrl = "product!listSecondary.action";
		return SUCCESS;
	}

	// 更新
	@Validations(requiredStrings = { @RequiredStringValidator(fieldName = "product.name", message = "商品名称不允许为空!") }, requiredFields = {
			@RequiredFieldValidator(fieldName = "product.price", message = "销售价不允许为空!"),
			@RequiredFieldValidator(fieldName = "product.marketPrice", message = "市场价不允许为空!"),
			@RequiredFieldValidator(fieldName = "product.weight", message = "商品重量不允许为空!"),
			@RequiredFieldValidator(fieldName = "product.weightUnit", message = "商品重量单位不允许为空!"),
			@RequiredFieldValidator(fieldName = "product.isMarketable", message = "是否上架不允许为空!"),
			@RequiredFieldValidator(fieldName = "product.productCategory.id", message = "所属分类不允许为空!") }, intRangeFields = {
			@IntRangeFieldValidator(fieldName = "product.point", min = "0", message = "积分必须为零或正整数!"),
			@IntRangeFieldValidator(fieldName = "product.store", min = "0", message = "库存必须为零或正整数!") })
	@InputConfig(resultName = "error")
	public String update() throws Exception {
		if (!hasLogin())
			return "login";

		if (product.getPrice().compareTo(new BigDecimal("0")) < 0) {
			addActionError("销售价不允许小于0");
			return ERROR;
		}
		if (product.getMarketPrice().compareTo(new BigDecimal("0")) < 0) {
			addActionError("市场价不允许小于0");
			return ERROR;
		}
		if (product.getWeight() < 0) {
			addActionError("商品重量只允许为正数或零!");
			return ERROR;
		}
		Product persistent = productService.load(id);
		product.setIsBest(persistent.getIsBest());
		product.setIsNew(persistent.getIsNew());
		product.setIsHot(persistent.getIsHot());
		product.setCreatorMem(persistent.getCreatorMem());
		product.setTrusteeship(persistent.getTrusteeship());

		if (StringUtils.isNotEmpty(product.getProductSn())) {
			if (!productService.isUnique("productSn",
					persistent.getProductSn(), product.getProductSn())) {
				addActionError("货号重复,请重新输入!");
				return ERROR;
			}
		} else {
			String productSn = SerialNumberUtil.buildProductSn();
			product.setProductSn(productSn);
		}

		ProductType productType = product.getProductType();
		if (productType != null && StringUtils.isNotEmpty(productType.getId())) {
			productType = productTypeService.load(productType.getId());
		} else {
			productType = null;
		}

		if (productType != null) {
			Map<ProductAttribute, List<String>> productAttributeMap = new HashMap<ProductAttribute, List<String>>();
			List<ProductAttribute> enabledProductAttributeList = productAttributeService
					.getEnabledProductAttributeList(productType);
			for (ProductAttribute productAttribute : enabledProductAttributeList) {
				String[] parameterValues = getParameterValues(productAttribute
						.getId());
				if (productAttribute.getIsRequired()
						&& (parameterValues == null
								|| parameterValues.length == 0 || StringUtils
								.isEmpty(parameterValues[0]))) {
					addActionError(productAttribute.getName() + "不允许为空!");
					return ERROR;
				}
				if (parameterValues != null && parameterValues.length > 0
						&& StringUtils.isNotEmpty(parameterValues[0])) {
					if (productAttribute.getAttributeType() == AttributeType.number) {
						Pattern pattern = Pattern
								.compile("^-?(?:\\d+|\\d{1,3}(?:,\\d{3})+)(?:\\.\\d+)?");
						Matcher matcher = pattern.matcher(parameterValues[0]);
						if (!matcher.matches()) {
							addActionError(productAttribute.getName()
									+ "只允许输入数字!");
							return ERROR;
						}
					}
					if (productAttribute.getAttributeType() == AttributeType.alphaint) {
						Pattern pattern = Pattern.compile("[a-zA-Z]+");
						Matcher matcher = pattern.matcher(parameterValues[0]);
						if (!matcher.matches()) {
							addActionError(productAttribute.getName()
									+ "只允许输入字母!");
							return ERROR;
						}
					}
					if (productAttribute.getAttributeType() == AttributeType.date) {
						Pattern pattern = Pattern
								.compile("\\d{4}[\\/-]\\d{1,2}[\\/-]\\d{1,2}");
						Matcher matcher = pattern.matcher(parameterValues[0]);
						if (!matcher.matches()) {
							addActionError(productAttribute.getName()
									+ "日期格式错误!");
							return ERROR;
						}
					}
					if (productAttribute.getAttributeType() == AttributeType.select
							|| productAttribute.getAttributeType() == AttributeType.checkbox) {
						List<String> attributeOptionList = productAttribute
								.getAttributeOptionList();
						for (String parameterValue : parameterValues) {
							if (!attributeOptionList.contains(parameterValue)) {
								addActionError("参数错误!");
								return ERROR;
							}
						}
					}
					productAttributeMap.put(productAttribute,
							Arrays.asList(parameterValues));
				}
			}
			product.setProductAttributeMap(productAttributeMap);
		} else {
			product.setProductAttributeMap(null);
		}
		product.setProductType(productType);
		if (productImages != null) {
			String allowedUploadImageExtension = getSystemConfig()
					.getAllowedUploadImageExtension().toLowerCase();
			if (StringUtils.isEmpty(allowedUploadImageExtension)) {
				addActionError("不允许上传图片文件!");
				return ERROR;
			}
			for (int i = 0; i < productImages.length; i++) {
				String productImageExtension = StringUtils.substringAfterLast(
						productImagesFileName[i], ".").toLowerCase();
				String[] imageExtensionArray = allowedUploadImageExtension
						.split(SystemConfig.EXTENSION_SEPARATOR);
				if (!ArrayUtils.contains(imageExtensionArray,
						productImageExtension)) {
					addActionError("只允许上传图片文件类型: "
							+ allowedUploadImageExtension + "!");
					return ERROR;
				}
				if (getSystemConfig().getUploadLimit() != 0
						&& productImages[i].length() > getSystemConfig()
								.getUploadLimit() * 1024) {
					addActionError("此上传文件大小超出限制!");
					return ERROR;
				}
			}
		}

		List<ProductImage> productImageList = new ArrayList<ProductImage>();
		if (productImageParameterTypes != null) {
			int index = 0;
			int productImageFileIndex = 0;
			int productImageIdIndex = 0;
			for (String parameterType : productImageParameterTypes) {
				if (StringUtils.equalsIgnoreCase(parameterType,
						"productImageFile")) {
					ProductImage destProductImage = productImageService
							.buildProductImage(productImages[productImageFileIndex]);
					productImageList.add(destProductImage);
					productImageFileIndex++;
					index++;
				} else if (StringUtils.equalsIgnoreCase(parameterType,
						"productImageId")) {
					ProductImage destProductImage = persistent
							.getProductImage(productImageIds[productImageIdIndex]);
					productImageList.add(destProductImage);
					productImageIdIndex++;
					index++;
				}
			}
		}

		// 更新区域
		if (regionIds != null && !regionIds.trim().equals("")) {
			List<Region> regionList = regionService.get(regionIds.split(","));
			Set<Region> regionSet = persistent.getRegionSet();
			Set<Region> temp = new HashSet<Region>();
			for (Region region : regionSet) {
				if (!regionList.contains(region)) {
					temp.add(region);
				}
			}
			regionSet.removeAll(temp);
			regionSet.addAll(regionList);
			// persistent.setRegionSet(regionSet);
			product.setRegionSet(regionSet);
		}

		if (StringUtils.isEmpty(product.getBrand().getId())) {
			product.setBrand(null);
		}
		if (getSystemConfig().getPointType() == PointType.productSet) {
			if (product.getPoint() == null) {
				addActionError("积分不允许为空!");
				return ERROR;
			}
		} else {
			product.setPoint(0);
		}
		if (product.getStore() == null) {
			product.setFreezeStore(0);
		} else {
			product.setFreezeStore(persistent.getFreezeStore());
		}

		List<ProductImage> persistentProductImageList = persistent
				.getProductImageList();
		if (persistentProductImageList != null) {
			for (ProductImage persistentProductImage : persistentProductImageList) {
				if (!productImageList.contains(persistentProductImage)) {
					productImageService.deleteFile(persistentProductImage);
				}
			}
		}
		product.setProductImageList(productImageList);
		BeanUtils.copyProperties(product, persistent, new String[] { "id",
				"createDate", "modifyDate", "htmlFilePath", "salesType","creatorMem",
				"favoriteMemberSet", "cartItemSet", "orderItemSet",
				"deliveryItemSet", "regionSet" });
		productService.update(persistent);
		flushCache();
		redirectionUrl = "product!listSecondary.action";
		return SUCCESS;
	}

	// 更新页面缓存
	private void flushCache() {
		Cache cache = ServletCacheAdministrator.getInstance(
				getRequest().getSession().getServletContext()).getCache(
				getRequest(), PageContext.APPLICATION_SCOPE);
		cache.flushAll(new Date());
	}

	public File[] getProductImages() {
		return productImages;
	}

	public void setProductImages(File[] productImages) {
		this.productImages = productImages;
	}

	public String[] getProductImagesFileName() {
		return productImagesFileName;
	}

	public void setProductImagesFileName(String[] productImagesFileName) {
		this.productImagesFileName = productImagesFileName;
	}

	public String[] getProductImageParameterTypes() {
		return productImageParameterTypes;
	}

	public void setProductImageParameterTypes(
			String[] productImageParameterTypes) {
		this.productImageParameterTypes = productImageParameterTypes;
	}

	public String[] getProductImageIds() {
		return productImageIds;
	}

	public void setProductImageIds(String[] productImageIds) {
		this.productImageIds = productImageIds;
	}

	public String getRegionIds() {
		return regionIds;
	}

	public void setRegionIds(String regionIds) {
		this.regionIds = regionIds;
	}

	public ProductCategory getProductCategory() {
		return productCategory;
	}

	public void setProductCategory(ProductCategory productCategory) {
		this.productCategory = productCategory;
	}

	public String getOrderType() {
		return orderType;
	}

	public void setOrderType(String orderType) {
		this.orderType = orderType;
	}

	public String getViewType() {
		return viewType;
	}

	public void setViewType(String viewType) {
		this.viewType = viewType;
	}

	public List<ProductCategory> getRootProductCategoryList() {
		rootProductCategoryList = productCategoryService
				.getRootProductCategoryList();
		return rootProductCategoryList;
	}

	public void setRootProductCategoryList(
			List<ProductCategory> rootProductCategoryList) {
		this.rootProductCategoryList = rootProductCategoryList;
	}

	public List<Product> getBestProductList() {
		return bestProductList;
	}

	public void setBestProductList(List<Product> bestProductList) {
		this.bestProductList = bestProductList;
	}

	public List<Product> getHotProductList() {
		return hotProductList;
	}

	public void setHotProductList(List<Product> hotProductList) {
		this.hotProductList = hotProductList;
	}

	public List<Product> getNewProductList() {
		return newProductList;
	}

	public void setNewProductList(List<Product> newProductList) {
		this.newProductList = newProductList;
	}

	public List<ProductCategory> getPathList() {
		return pathList;
	}

	public void setPathList(List<ProductCategory> pathList) {
		this.pathList = pathList;
	}

	public void setRegionId(String regionId) {
		this.regionId = regionId;
	}

	public String getRegionId() {
		return regionId;
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

	public void setCondition(ProductCondition condition) {
		this.condition = condition;
	}

	public ProductCondition getCondition() {
		return condition;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public Product getProduct() {
		return product;
	}

	public void setCurrentPage(String currentPage) {
		this.currentPage = currentPage;
	}

	public String getCurrentPage() {
		return currentPage;
	}

	public void setRegionCur(String regionCur) {
		this.regionCur = regionCur;
	}

	public String getRegionCur() {
		return regionCur;
	}

}