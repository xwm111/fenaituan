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
<link href="${base}/template/shop/css/activity_detail.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${base}/template/shop/js/login.js"></script>
<script type="text/javascript" src="${base}/template/shop/js/register.js"></script>
</head>
<body class="memberCenter">
	<#include "/WEB-INF/template/shop/header.ftl">
	<div class="body memberCenterIndex">
			<div>
					<div class="blank"></div>
					<span style="FLOAT: right;MARGIN: 5px;CURSOR: pointer;"><a href="activity!add.action"><img alt="发新话题" src="${base}/template/shop/images/newtopic.gif" border="0"></a></span>
					<form name="form1" method="post" action="activity!list.action" id="form1">
					<table class="listTable">
						<tr>
							<th style="width: 30px;"></th>
							<th style="width: 300px;">主题</th>
							<th>作者</th>
							<th>回复</th>
							<th>最后发表</th>
						</tr>
						<#list pager.list as list>
							<tr>
								<td class="folder"><a title="新窗口打开" href="activity!detail.action?id=${list.id}" target="_blank"><img src="${base}/template/shop/images/folder_common.gif"></a></td>
								<td>
									<a href="activity!detail.action?id=${list.id}">${list.name}</a> 
							<#if list.isTop==true>
							(<span class="red">置顶</span>)
							</#if>
								</td>
								<td>
									<cite>
									<a href="#">							
									<#if list.creatorMem!=null>
									${list.creatorMem.username}
									</#if></a>
									</cite><br/>
									<em>${list.createDate?string("yyyy-MM-dd HH:mm:ss")}</em>
								</td>
								<td>
									<!--<span>0</span> / <em>0</em>-->
									<span>${list.replyNum}</span>
								</td>
								<td>
									<#if list.lastReplyDate==null || list.lastReplyMem==null>
										<em><a href="#">${list.createDate?string("yyyy-MM-dd HH:mm:ss")}</a></em><br/>
										<cite>by <a href="#">
										<#if list.creatorMem!=null>
									${list.creatorMem.username}
									</#if></a></cite>
									<#else>
										<em><a href="#">${list.lastReplyDate?string("yyyy-MM-dd HH:mm:ss")}</a></em><br/>
										<cite>by <a href="#">${list.lastReplyMem.username}</a></cite>
									</#if>
								</td>
							</tr>
							<#if (list_index + 1 > 10)>
								<#break />
							</#if>
						</#list>
						<tr>
							<td colspan="5">
							<link href="${base}/template/shop/css/pager.css" rel="stylesheet" type="text/css" />
							<#import "/WEB-INF/template/shop/pager.ftl" as p>
         					<@p.pager pager = pager baseUrl = "/shop/activity!list.action" />
							</td>
						</tr>
					</table>
					</form>
					<span style="FLOAT: right;MARGIN: 5px;CURSOR: pointer;"><a href="activity!add.action"><img alt="发新话题" src="${base}/template/shop/images/newtopic.gif" border="0"></a></span>
					<div class="blank"></div>
		</div>
		<#include "/WEB-INF/template/shop/friend_link.ftl">
	</div>
	<div class="blank"></div>
	<#include "/WEB-INF/template/shop/footer.ftl">
</body>
</html>