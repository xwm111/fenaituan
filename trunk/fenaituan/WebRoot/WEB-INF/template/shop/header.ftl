<script type="text/javascript" src="${base}/template/shop/js/header.js"></script>
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
		 
		var zNodes=${(regionData)!"[]"};
		

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
			areaId.val(p);
			
			$.cookie("regionId",p, {expires: 7, path:"${base}/"});
			$.cookie("regionName",v, {expires: 7, path:"${base}/"});
			hideMenu();
			var hf=window.location.href;
			if(hf.indexOf("?")!=-1 && areaId.val()!=null){
				var index=hf.indexOf("region");
				if(index==-1)
					window.location.href=window.location.href+"&region.id="+areaId.val();
				else
					window.location.href=hf.substring(0,index)+"region.id="+areaId.val();
			}
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
			
			$("#areaSel").click(showMenu);

			
			var regionId=$.cookie("regionId");
			var regionName=$.cookie("regionName");
			//var regionId="${(region.id)!""}";
			//var regionName="${(region.regionName)!""}";
			if(regionId!=""){
				$("#areaId").val(regionId);
			}else{
				$("#areaId").val("");
				$.cookie("regionId","", {expires: 7, path:"${base}/"});
			}
			if(regionName!=null&&regionName!=""){
				$("#areaSel").text(regionName);
			}else{
				$("#areaSel").text("选择学校");
				$.cookie("regionName","选择学校", {expires: 7, path:"${base}/"});
			}
			
			$("a").click(function(){
				var regionId=$("#areaId").val();
				if(regionId!=null){
					var hf=$(this).attr("href");
					if(hf.indexOf("?")!=-1 ){
						var index=hf.indexOf("region");
						if(index==-1)
							$(this).attr("href",hf+"&region.id="+regionId);
						else
							$(this).attr("href",hf.substring(0,index)+"region.id="+regionId);
					}
				}
			});
		});
		//-->
	</SCRIPT>
<link href="${base}/template/shop/css/header.css" rel="stylesheet" type="text/css" />
<div class="header png">
	<div class="headerTop png">
		<div class="headerTopContent">
			<div class="headerLoginInfo">
				您好<span id="headerLoginMemberUsername"></span>，欢迎来到${(systemConfig.shopName)!}！
				<a href="#" id="headerShowLoginWindow" class="showLoginWindow">登录</a>
				<a href="${base}/shop/member_center!index.action" id="headerMemberCenter">会员中心</a>
				<a href="#" id="headerShowRegisterWindow" class="showRegisterWindow">注册</a>
				<a href="${base}/shop/member!logout.action" id="headerLogout">[退出]</a>
			</div>
			<div class="headerTopNav">
				<#list topNavigationList as list>
					<a href="<@list.url?interpret />"<#if list.isBlankTarget == true> target="_blank"</#if>>${list.name}</a>
					<#if list_has_next>|</#if>
				</#list>
			</div>
		</div>
	</div>
	<div class="headerMiddle">
		<div class="headerInfo">
			7×24小时服务热线：<strong>${(systemConfig.phone)!}</strong>
		</div>
		<div class="headerLogo">
			<a href="${base}/"><img class="png" src="${base}${(systemConfig.shopLogo)!}" title="${(systemConfig.shopName)!}" /></a>
		</div>
		<div  style="width:200px;height:20px;float:left;position:absolute;margin-left:200px;padding-top:20px;" >
			<input id="areaId" type="hidden" value="" />
			<h3>[<a href="#" id="areaSel"   ></a>]</h3>
		</div>
		<div class="headerSearch png">
			<form id="productSearchForm" action="${base}/shop/product!search.action" method="get">
				<div class="headerSearchText">
					<input type="text" id="productSearchKeyword" name="pager.keyword" value="<#if (pager.keyword != null && rootProductCategoryList != null)!>${pager.keyword}<#else>请输入关键词...</#if>"}" />
				</div>
				<input type="submit" class="headerSearchButton" value="" />
				<div class="hotKeyword">
					热门关键词: 
					<#list systemConfig.hotSearchList as list>
						<a href="${base}/shop/product!search.action?pager.keyword=${list?url}">${list}</a>
					</#list>
				</div>
			</form>
		</div>
	</div>
	<div class="headerBottom">
		<input type="button" class="cartItemListButton showCartItemList" value="" onclick="window.open('${base}/shop/cart_item!list.action')" />
		<ul id="cartItemListDetail"></ul>
		<input type="button" class="orderButton" value="" onclick="window.open('${base}/shop/cart_item!list.action')" />
		<div class="headerMiddleNav">
			<div class="headerMiddleNavLeft png"></div>
			<ul class="headerMiddleNavContent png">
				<#list middleNavigationList as list>
					<li>
						<a href="<@list.url?interpret />"<#if list.isBlankTarget == true> target="_blank"</#if>>${list.name}</a>
					</li>
				</#list>
				<li><a href="${base}/shop/activity!list.action" >活动中心</a></li>
			</ul>
			<div class="headerMiddleNavRight png"></div>
		</div>
	</div>
	<div id="menuContent" class="menuContent" style="display:none; position: absolute;">
		<ul id="treeDemo" class="ztree" style="margin-top:0;"></ul>
	</div>
</div>