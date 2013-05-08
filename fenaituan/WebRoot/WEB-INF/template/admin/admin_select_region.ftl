<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>选择地区 - Powered By ${systemConfig.systemName}</title>
<meta name="Author" content="SHOP++ Team" />
<meta name="Copyright" content="SHOP++" />
<link rel="icon" href="favicon.ico" type="image/x-icon" />
<#include "/WEB-INF/template/common/include.ftl">
<link href="${base}/template/admin/css/login.css" rel="stylesheet" type="text/css" />
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

		var zNodes=${(adminRegionData)!"[]"};
		

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
			if(nodes.length>0){
				v = nodes[0].name + ",";
				p = nodes[0].id + ",";
			}
			if (v.length > 0 ) v = v.substring(0, v.length-1);
			if (p.length > 0 ) p = p.substring(0, p.length-1);
			var areaName = $("#areaSel");
			var areaId = $("#areaId");
			areaName.text(v);
			areaId.attr("value", p);
		}
		
		function showMenu() {
			var cityObj = $("#areaSel");
			var cityOffset = $("#areaSel").offset();
			$("#menuContent").css({left:cityOffset.left + "px", top:cityOffset.top + cityObj.outerHeight() + "px"}).slideDown("fast");

			$("body").bind("mousedown", onBodyDown);
			return false;
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
			
			$(".submitButton").click(function(){
				window.returnValue = $("#areaId").val()+"|"+$("#areaSel").text();
    			window.close();
    			return false;
			});

			
			var regionId=$.cookie("adminRegionId");
			var regionName=$.cookie("adminRegionName");
			
			if(regionId!=null){
				$("#areaId").val(regionId);
			}
			if(regionName!=null){
				$("#areaSel").text(regionName);
			}
			
		});
		//-->
	</SCRIPT>
</head>
<body class="login">
	<div class="body" style="padding-top:10px;margin-left:50px;">
		<input id="areaId" type="hidden" value="" />
		<div class="loginBox">
			<div id="menuContent" class="menuContent" style="">
				<p>选择地区：<span id="areaSel"></span></p>
				<ul id="treeDemo" class="ztree" style="margin-top:5px;"></ul>
			</div>
			<input type="submit" class="submitButton ignoreForm" value="提  交" hidefocus="true" />
		</div>
		<div class="blank"></div>
	</div>
</body>
</html>