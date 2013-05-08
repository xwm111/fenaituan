<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>添加/编辑活动 - Powered By ${systemConfig.systemName}</title>
<meta name="Author" content="SHOP++ Team" />
<meta name="Copyright" content="SHOP++" />
<link rel="icon" href="favicon.ico" type="image/x-icon" />
<#include "/WEB-INF/template/common/include.ftl">
<link href="${base}/template/admin/css/input.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${base}/ckeditor/ckeditor.js"></script> <!--载入fckeditor类--> 
<#if !id??>
	<#assign isAdd = true />
<#else>
	<#assign isEdit = true />
</#if>
</head>
<body class="input">
	<div class="body">
		<div class="inputBar">
			<h1><span class="icon">&nbsp;</span><#if isAdd??>添加活动<#else>编辑活动</#if></h1>
		</div>
		<form id="inputForm" class="validate" action="<#if isAdd??>activity!save.action<#else>activity!update.action</#if>" method="post">
			<input type="hidden" name="activity.id" value="${activity.id}" />
			<table class="inputTable">
			<tr>
					<th>
						创建者:
					</th>
					<td>
						<#if activity.creatorMem!=null>
						${activity.creatorMem.username}
						</#if>
					</td>
				</tr>
				<tr>
					<th>
						标题:
					</th>
					<td>
						<input type="text" class="formText" name="activity.name" value="${activity.name}" title="标题不允许为空" /><label class="requireField">*</label>
					</td>
				</tr>
				<tr>
					<th>
						是否置顶:
					</th>
					<td>
						<label><input type="radio" name="activity.isTop" value="true"<#if (activity.isTop == true)!> checked</#if> />是</label>
						<label><input type="radio" name="activity.isTop" value="false"<#if (isAdd || activity.isTop == false)!> checked</#if> />否</label>
					</td>
				</tr>
				<tr>
					<th>
						内容:
					</th>
					<td>
						<textarea class="ckeditor" cols="80" id="editor1" name="activity.content" rows="10">
							${activity.content}
							</textarea>
					</td>
				</tr>
			</table>
			<div class="buttonArea">
				<input type="submit" class="formButton" value="确  定" hidefocus="true" />&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="button" class="formButton" onclick="window.history.back(); return false;" value="返  回" hidefocus="true" />
			</div>
		</form>
	</div>
</body>
</html>