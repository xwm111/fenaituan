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
<link href="${base}/template/shop/css/ejf_editor.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${base}/template/shop/js/login.js"></script>
<script type="text/javascript" src="${base}/template/shop/js/register.js"></script>
<script type="text/javascript" src="${base}/ckeditor/ckeditor.js"></script> <!--载入fckeditor类--> 
<script type="text/javascript">
$(function(){
	$("#_submit").click(function(){
		var name=$("input[name='activity.name']").val();
		if(name.length==0||name.trim()==""){
			alert("活动名不能为空!");
			return false;
		}
	});

})
</script>
<style>
.listTable th{
	width:190px;
}
</style>
</head>
<body class="memberCenter">
	<#include "/WEB-INF/template/shop/header.ftl">
	<div class="body memberCenterIndex">
			<div class="memberCenterDetail">
				<div >
					<div class="blank"></div>
					<table class="listTable">
						<tr>
							<td colspan="4">
								<a href="activity!list.action" > ‹‹ 返回活动列表</a>
							</td>
						</tr>
					</table>
					<div class="blank"></div>
					<form id="inputForm" class="validate" action="activity!save.action" method="post" enctype="multipart/form-data" >
					<table class="listTable">
				<tr>
					<th>
						用户名:
					</th>
					<td>
						${loginMember.username}
					</td>
				</tr>
				<tr>
					<th>
						标题:
					</th>
					<td>
						<input type="text" class="formText" name="activity.name" value="" title="标题不允许为空" />
					</td>
				</tr>
				<tr>
					<th>
						内容:
					</th>
					<td>
						<textarea class="ckeditor" cols="80" id="editor1" name="activity.content" rows="10">
							</textarea>
					</td>
				</tr>
				<tr>
					<th>
					</th>
					<td>
						<div class="buttonArea">
				<input type="submit" id="_submit" class="formButton" value="确  定" hidefocus="true" />&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="button" class="formButton" onclick="window.history.back(); return false;" value="返  回" hidefocus="true" />
			</div>
					</td>
				</tr>
			</table>
			</form>
				</div>
				<div ></div>
		<div class="blank"></div>
	</div>
	<div class="blank"></div>
	<#include "/WEB-INF/template/shop/footer.ftl">
</body>
</html>