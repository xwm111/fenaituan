<#assign sec=JspTaglibs["/WEB-INF/security.tld"] />
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>管理中心 - Powered By ${systemConfig.systemName}</title>
<meta name="Author" content="SHOP++ Team" />
<meta name="Copyright" content="SHOP++" />
<link rel="icon" href="favicon.ico" type="image/x-icon" />
<#include "/WEB-INF/template/common/include.ftl">
<link href="${base}/template/admin/css/header.css" rel="stylesheet" type="text/css" />
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

		var zNodes=${(Session.adminRegionData)!"[]"};
		

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
			
			$.cookie("adminRegionId",p, {expires: 7, path: '/'});
			$.cookie("adminRegionName",v, {expires: 7, path: '/'});
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
			
			
			var regionId=$.cookie("adminRegionId");
			var regionName=$.cookie("adminRegionName");
			
			if(regionId!=null){
				$("#areaId").val(regionId);
			}
			if(regionName!=null){
				$("#areaSel").text(regionName);
			}else{
				$("#areaSel").text("选择地区");
			}
			
			$("#areaSel").click(function showSelectRecipientDialog(event) {
             	var xURL="admin!selectRegion.action";
             	var name="selectRegion";
             	var showx = event.screenX - event.offsetX - 4 - 610 ;
             	var showy = event.screenY - event.offsetY -400;
             	var windowProps="dialogWidth:400px; dialogHeight:500px; dialogLeft:"+showx+"px; dialogTop:"+showy+"px; status:yes; directories:yes;scrollbars:no;Resizable=no;help:no";
             	var retval = window.showModalDialog(xURL,name,windowProps);
             	if(retval==null) return null;
             	var retvalArray=retval.split("|");
                 try {
    				var p = retvalArray[0];
					var v = retvalArray[1];
					var areaName = $("#areaSel");
					var areaId = $("#areaId");
					areaId.attr("value", p);
					areaName.text(v);
			
					$.cookie("adminRegionId",p, {expires: 7, path: '/'});
					$.cookie("adminRegionName",v, {expires: 7, path: '/'});
                }//end try
                catch(exception){
                  alert("异常信息:"+exception);
                }
             });
			
		});
		//-->
	</SCRIPT>
<!--[if lte IE 6]>
<script type="text/javascript">
	DD_belatedPNG.fix(".headerLogo");
</script>
<![endif]-->
</head>
<body class="header">
	<div class="body">
		<div class="headerLogo"></div>
		<div  style="width:200px;height:20px;float:left;position:absolute;padding-top:10px;" >
			<input id="areaId" type="hidden" value="" />
			[<a href="#" id="areaSel" ></a>]
		</div>
		<div class="headerTop">
			<div class="headerLink">
				<span class="welcome">
					<strong><@sec.authentication property="name" /></strong>&nbsp;您好!&nbsp;
				</span>
				<a href="admin!index.action" target="mainFrame">后台首页</a>|
            	<a href="http://bbs.shopxx.net" target="_blank">技术支持</a>|
                <a href="http://www.shopxx.net" target="_blank">购买咨询</a>|
                <a href="http://about.shopxx.net" target="_blank">关于我们</a>|
                <a href="http://contact.shopxx.net" target="_blank">联系我们</a>
			</div>
		</div>
		<div class="headerBottom">
			<div class="headerMenu">
				<div class="menuLeft"></div>
				<ul>
	            	<li><a href="menu!product.action" target="menuFrame" hidefocus="true">商品管理</a></li>
	                <li><a href="menu!order.action" target="menuFrame" hidefocus="true">订单处理</a></li>
	                <li><a href="menu!member.action" target="menuFrame" hidefocus="true">会员管理</a></li>
	                <li><a href="menu!content.action" target="menuFrame" hidefocus="true">页面内容</a></li>
	                <li><a href="menu!admin.action" target="menuFrame" hidefocus="true">管理员</a></li>
	                <li><a href="menu!setting.action" target="menuFrame" hidefocus="true">网站设置</a></li>
	                <li><a href="menu!region.action" target="menuFrame" hidefocus="true">区域管理</a></li>
	                <li><a href="menu!activity.action" target="menuFrame" hidefocus="true">活动管理</a></li>
	                <li class="home"><a href="${base}/" target="_blank" hidefocus="true"></a></li>
	            </ul>
	            <div class="menuRight"></div>
			</div>
			<div class="userInfo">
				<a href="admin_profile!edit.action" target="mainFrame">
					<span class="profileIcon">&nbsp;</span>个人资料
				</a>
				<a href="${base}/admin/logout" target="_top">
					<span class="logoutIcon">&nbsp;</span>退出&nbsp
				</a>
			</div>
		</div>
	</div>
</body>
</html>