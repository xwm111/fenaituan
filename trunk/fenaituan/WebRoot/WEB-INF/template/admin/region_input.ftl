<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>添加/编辑地区 - Powered By ${systemConfig.systemName}</title>
<meta name="Author" content="SHOP++ Team" />
<meta name="Copyright" content="SHOP++" />
<link rel="icon" href="favicon.ico" type="image/x-icon" />
<link href="${base}/template/admin/css/input.css" rel="stylesheet" type="text/css" />
<#include "/WEB-INF/template/common/include.ftl">

<SCRIPT type="text/javascript" >
		<!--
		var setting = {
			view: {
				dblClickExpand: false
			},
			data: {
				simpleData: {
					enable: true
				}
			},
			callback: {
				beforeClick: beforeClick,
				onClick: onClick
			}
		};

		 
		 var zNodes=${regionData};

		function beforeClick(treeId, treeNode) {
			//var check = (treeNode && !treeNode.isParent);
			//if (!check) alert("只能选择城市...");
			var check = treeNode;
			return check;
		}
		
		function onClick(e, treeId, treeNode) {
			var zTree = $.fn.zTree.getZTreeObj("treeDemo"),
			nodes = zTree.getSelectedNodes(),
			v = "";
			p = "";
			nodes.sort(function compare(a,b){return a.id-b.id;});
			for (var i=0, l=nodes.length; i<l; i++) {
				v += nodes[i].name + ",";
				p += nodes[i].id + ",";
			}
			if (v.length > 0 ) v = v.substring(0, v.length-1);
			if (p.length > 0 ) p = p.substring(0, p.length-1);
			var cityObj = $("#citySel");
			var parentObj = $("#parentId");
			cityObj.attr("value", v);
			parentObj.attr("value", p);
		}
		
		function clearParent(){
			var cityObj = $("#citySel");
			var parentObj = $("#parentId");
			cityObj.attr("value", "");
			parentObj.attr("value", "");
		}

		function showMenu() {
			var cityObj = $("#citySel");
			var cityOffset = $("#citySel").offset();
			$("#menuContent").css({left:cityOffset.left + "px", top:cityOffset.top + cityObj.outerHeight() + "px"}).slideDown("fast");

			$("body").bind("mousedown", onBodyDown);
		}
		function hideMenu() {
			$("#menuContent").fadeOut("fast");
			$("body").unbind("mousedown", onBodyDown);
		}
		function onBodyDown(event) {
			if (!(event.target.id == "menuBtn" || event.target.id == "menuContent" || $(event.target).parents("#menuContent").length>0)) {
				hideMenu();
			}
		}

		$(document).ready(function(){
			$.fn.zTree.init($("#treeDemo"), setting, zNodes);
		});
		//-->
	</SCRIPT>
<#if !id >
	<#assign isAdd = true />
<#else>
	<#assign isEdit = true />
</#if>
</head>
<body class="input">
	<div class="body">
		<div class="inputBar">
			<h1><span class="icon">&nbsp;</span><#if isAdd >添加区域<#else>编辑区域</#if></h1>
		</div>
		<div class="blank"></div>
		<form id="inputForm" class="validate" action="<#if isAdd>region!save.action<#else>region!update.action</#if>" method="post" enctype="multipart/form-data" >
			<input type="hidden" name="id" value="${id}" />
			<input type="hidden" id="parentId" name="parentId" <#if region.parentRegion != null> value="${region.parentRegion.id}" </#if> />
			<ul class="tab">
				<li>
					<input type="button" value="基本信息" hidefocus="true" />
				</li>
			</ul>
			<table class="inputTable tabContent">
				<tr>
					<th>
						地区名称:
					</th>
					<td>
						<input type="text" name="region.regionName" class="formText {required: true}" value="${region.regionName}" />
						<label class="requireField">*</label>
					</td>
				</tr>
				<tr>
					<th>
						父节点:
					</th>
					<td>
						<input id="citySel" type="text" <#if region.parentRegion != null> value="${region.parentRegion.regionName}" </#if> class="formText" value="" onclick="showMenu(); return false;" title="为空表示根节点" />
						<a id="clear" href="#" onclick="clearParent(); return false;" >清空</a>
					</td>
				</tr>
				<!--
				<tr>
					<th>
						地区类型:
					</th>
					<td>
						<input type="text" disabled="true"  class="formText" name="region.regionType" value="${region.regionType}" title="系统自动生成" />
					</td>
				</tr>
				-->
			</table>
			<div class="buttonArea">
				<input type="submit" class="formButton" value="确  定" hidefocus="true" />&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="button" class="formButton" onclick="window.history.back(); return false;" value="返  回" hidefocus="true" />
			</div>
		</form>
	</div>
	

	<div id="menuContent" class="menuContent" style="display:none; position: absolute;">
		<ul id="treeDemo" class="ztree" style="margin-top:0;"></ul>
	</div>
</body>
</html>