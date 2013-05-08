<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>会员中心 - Powered By ${systemConfig.systemName}</title>
<meta name="Author" content="SHOP++ Team" />
<meta name="Copyright" content="SHOP++" />
<link rel="icon" href="favicon.ico" type="image/x-icon" />
<#include "/WEB-INF/template/common/include.ftl">
<link href="${base}/template/shop/css/login.css" rel="stylesheet" type="text/css" />
<link href="${base}/template/shop/css/register.css" rel="stylesheet" type="text/css" />
<link href="${base}/template/shop/css/member_center.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${base}/template/shop/js/login.js"></script>
<script type="text/javascript" src="${base}/template/shop/js/register.js"></script>
<script type="text/javascript" >

$(function(){
	function applyTrusteeship(){
		if(!confirm("确定申请托管？"))
			return false;
		return true;
	}
});

</script>


</head>
<body class="memberCenter">
	<#include "/WEB-INF/template/shop/header.ftl">
	<div class="body memberCenterIndex">
		<#include "/WEB-INF/template/shop/body_left.ftl">
		<div class="bodyRight">
			<div class="memberCenterDetail">
				<div class="top">
					会员中心首页
				</div>
				<div class="middle">
					<div class="blank"></div>
					<table class="listTable">
						<tr>
							<td colspan="4">
								<a href="${base}/shop/product!add.action">添加二手商品</a>
							</td>
						</tr>
					</table>
					<div class="blank"></div>
					<table class="listTable">
				<tr>
					<th style="width:20px" class="check">
						<input type="checkbox" class="allCheck" />
					</th>
					<th>
						<span class="sort" name="name">商品名称</span>
					</th>
					<th>
						<span class="sort" name="productCategory">分类</span>
					</th>
					<th>
						<span class="sort" name="price">本店价格</span>
					</th>
					<th>
						<span class="sort" name="isMarketable">上架</span>
					</th>
					<th>
						<span class="sort" name="isBest">精品</span>
					</th>
					<th>
						<span class="sort" name="isNew">新品</span>
					</th>
					<th>
						<span class="sort" name="isHot">热销</span>
					</th>
					<th>
						<span class="sort" name="store">库存</span>
					</th>
					<th>
						<span class="sort" name="trusteeship">托管</span>
					</th>
					<th style="width:70px">
						操作
					</th>
				</tr>
				<#list pager.list as list>
					<tr>
						<td>
							<input type="checkbox" name="ids" value="${list.id}" />
						</td>
						<td>
							<#if (list.name?length <= 20)!>
								<span title="${list.name}">${list.name}</span>
							<#else>
								<span title="${list.name}">${list.name[0..20]}...</span>
							</#if>
						</td>
						<td>
							${list.productCategory.name}
						</td>
						<td>
							${list.price?string(priceCurrencyFormat)}
						</td>
						<td>
							<#if list.isMarketable == true>
								<img src="${base}/template/admin/images/list_true_icon.gif" />
							<#else>
								<img src="${base}/template/admin/images/list_false_icon.gif" />
							</#if>
						</td>
						<td>
							<#if list.isBest == true>
								<img src="${base}/template/admin/images/list_true_icon.gif" />
							<#else>
								<img src="${base}/template/admin/images/list_false_icon.gif" />
							</#if>
						</td>
						<td>
							<#if list.isNew == true>
								<img src="${base}/template/admin/images/list_true_icon.gif" />
							<#else>
								<img src="${base}/template/admin/images/list_false_icon.gif" />
							</#if>
						</td>
						<td>
							<#if list.isHot == true>
								<img src="${base}/template/admin/images/list_true_icon.gif" />
							<#else>
								<img src="${base}/template/admin/images/list_false_icon.gif" />
							</#if>
						</td>
						<td>
							<span title="被占用数: ${(list.freezeStore)}">${(list.store)!"-"}<#if list.isOutOfStock> <span class="red">[缺货]</span></#if></span>
						</td>
						<td>
							${action.getText("Trusteeship." + list.trusteeship)}
						</td>
						<td>
							<a href="product!edit.action?id=${list.id}" title="编辑">[编辑]</a>
							<#if list.trusteeship == 'unused'>
							<br />
							<a href="product!applyTrusteeship.action?id=${list.id}" title="申请托管" onclick="javascript:if(!confirm('确定申请托管？'))return false;">[申请托管]</a>
							</#if>
							<#if list.isMarketable == true>
								<br />
								<a href="${base}${list.htmlFilePath}" target="_blank" title="浏览">[浏览]</a>
							<#else>
								<br />
								<span title="未上架">[未上架]</span>
							</#if>
						</td>
					</tr>
				</#list>
			</table>
					<div class="blank"></div>
					<link href="${base}/template/shop/css/pager.css" rel="stylesheet" type="text/css" />
         			<#import "/WEB-INF/template/shop/pager.ftl" as p>
         			<@p.pager pager = pager baseUrl = "/shop/product!secondaryList.action" />
         			
				</div>
				<div class="bottom"></div>
			</div>
		</div>
		<div class="blank"></div>
		<#include "/WEB-INF/template/shop/friend_link.ftl">
	</div>
	<div class="blank"></div>
	<#include "/WEB-INF/template/shop/footer.ftl">
</body>
</html>