<%@ page language="java" import="java.util.List,java.util.ArrayList,net.shopxx.entity.*,org.shopxx.dao.impl.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!-- saved from url=(0025)http://www.fenaituan.com/ -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>

<title>粉爱团电子商务网站 - Powered By 粉爱团电子商务网站</title>
<meta name="Author" content="SHOP++ Team"/>
<meta name="Copyright" content="SHOP++"/>
<meta name="keywords" content="粉爱团大学生电子商务平台"/>
<meta name="description" content="粉爱团大学生电子商务平台"/>
<link rel="icon" href="http://www.fenaituan.com/favicon.ico" type="image/x-icon"/>
<link href="css/base.css" rel="stylesheet" type="text/css"/>
<link href="css/jquery.datepicker.css" rel="stylesheet" type="text/css"/>
<link href="css/jquery.zoomimage.css" rel="stylesheet" type="text/css"/>
<script src="js/jquery-1.2.4b.js" type="text/javascript"></script>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/jquery.cookie.js"></script>
<script type="text/javascript" src="js/jquery.form.js"></script>
<script type="text/javascript" src="js/jquery.metadata.js"></script>
<script type="text/javascript" src="js/jquery.validate.js"></script>
<script type="text/javascript" src="js/jquery.validate.methods.js"></script>
<script type="text/javascript" src="js/jquery.validate.cn.js"></script>
<script type="text/javascript" src="js/jquery.dimensions.js"></script>
<script type="text/javascript" src="js/jquery.jqDnR.js"></script>
<script type="text/javascript" src="js/jquery.jqModal.js"></script>
<script type="text/javascript" src="js/jquery.tools.js"></script>
<script type="text/javascript" src="js/jquery.qtip.js"></script>
<script type="text/javascript" src="js/jquery.pager.js"></script>
<script type="text/javascript" src="js/jquery.livequery.js"></script>
<script type="text/javascript" src="js/jquery.superfish.js"></script>
<script type="text/javascript" src="js/jquery.hoverIntent.js"></script>
<script type="text/javascript" src="js/jquery.datepicker.js"></script>
<script type="text/javascript" src="js/jquery.bCheckbox.js"></script>
<script type="text/javascript" src="js/jquery.lSelect.js"></script>
<script type="text/javascript" src="js/jquery.ajaxfileupload.js"></script>
<script type="text/javascript" src="js/jquery.zoomimage.js"></script>
<script type="text/javascript" src="js/jquery.tinymce.js"></script>
<!--[if lte IE 6]>
<script type="text/javascript" src="/template/common/js/belatedPNG.js"></script>
<![endif]-->
<link rel="stylesheet" href="css/new.css" />
<link href="css/nav.css" rel="stylesheet" type="text/css" />
<script language="javascript" src="js/common.js"></script>
<script language="javascript" src="js/nav.js"></script>
<script type="text/javascript" src="js/bcastr.js"></script>
<script language="javascript" src="js/base.js"></script>
<script type="text/javascript">
    $(function() {
        $('#rotate > ul').tabs({ fx: { opacity: 'toggle' } }).tabs('rotate', 2000);
    });
</script>

<link rel="stylesheet" href="css/zTreeStyle.css" type="text/css"/>
<script type="text/javascript" src="js/jquery.ztree.all-3.4.min.js"></script>

<link href="css/login.css" rel="stylesheet" type="text/css"/>
<link href="css/register.css" rel="stylesheet" type="text/css"/>
<link href="css/index.css" rel="stylesheet" type="text/css"/>
<link href="css/product.css" rel="stylesheet" type="text/css"/>
<link href="css/article.css" rel="stylesheet" type="text/css"/>
<script type="text/javascript" src="js/login.js"></script>
<script type="text/javascript" src="js/register.js"></script>
<script type="text/javascript" src="js/index.js"></script>
<script type="text/javascript">
$(document).ready(function() {

	$(".slider .scrollable").scrollable({
		circular: true,
		speed: 500
	}).autoscroll({
		autoplay: true,
		interval: 4000
	}).navigator();
	
	$(".hotProduct .scrollable").scrollable({
		circular: true,
		speed: 500
	});
	
	$(".newProduct ul.newProductTab").tabs(".newProduct .newProductTabContent", {
		effect: "fade",// 逐渐显示动画
		fadeInSpeed: 500,// 动画显示速度
		event: "mouseover"// 触发tab切换的事件
	});

})
</script>
<script language="javascript">
//选项卡的个数
var num=4;
function getTab(now){
 
 for(var i=1;i<=num;i++){
 
  if(i==now){
    
   document.getElementById("d"+i).style.display="block";
  }else{
   document.getElementById("d"+i).style.display="none";
  }
 }
}
</script>
</head>
<body class="index"><div id="registerWindow" class="registerWindow jqmID4"><div class="windowTop"><div class="windowTitle">会员注册</div><a class="windowClose registerWindowClose" href="http://www.fenaituan.com/#" hidefocus="true"></a></div><div class="windowMiddle"><form id="registerWindowForm" action="http://www.fenaituan.com/shop/member!ajaxRegister.action" method="post"><table><tbody><tr><th>用户名: </th><td><input type="text" name="member.username" class="formText {required: true, username: true, remote: &#39;/shop/member!checkUsername.action&#39;, minlength: 2, maxlength: 20, messages: {required: &#39;请输入用户名!&#39;, username: &#39;不允许包含特殊字符!&#39;, remote: &#39;用户名已存在,请重新输入!&#39;}}" title="用户名只允许包含中文、英文、数字和下划线!"></td></tr><tr><th>密&nbsp;&nbsp;&nbsp;码: </th><td><input type="password" id="registerWindowPassword" name="member.password" class="formText {required: true, minlength: 4, maxlength: 20, messages: {required: &#39;请输入密码!&#39;, minlength: &#39;密码长度不能小于4&#39;, maxlength: &#39;密码长度不能大于20&#39;}}"></td></tr><tr><th>重复密码: </th><td><input type="password" name="rePassword" class="formText {equalTo: &#39;#registerWindowPassword&#39;, messages: {equalTo: &#39;两次密码输入不一致!&#39;}}" title="密码长度只允许在4-20之间!"></td></tr><tr><th>E-mail: </th><td><input type="text" name="member.email" class="formText {required: true, email: true, messages: {required: &#39;请输入E-mail!&#39;, email: &#39;E-mail格式错误!&#39;}}"></td></tr><tr><th>验证码: </th><td><input type="text" id="registerWindowCaptcha" name="j_captcha" class="formTextS {required: true, messages: {required: &#39;请输入验证码!&#39;}}" messageposition="#registerWindowCaptchaMessagePosition"><img id="registerWindowCaptchaImage" src="" alt="换一张"><span id="registerWindowCaptchaMessagePosition"></span></td></tr><tr><th>&nbsp;</th><td><label><input type="checkbox" id="isAgreeAgreement" name="isAgreeAgreement" class="{required: true, messages: {required: &#39;必须同意注册协议，才可进行注册操作！&#39;}}" value="true" checked="" messageposition="#isAgreeAgreementMessagePosition"><a id="showAgreementWindow" class="showAgreementWindow" href="http://www.fenaituan.com/#">已阅读并同意《注册协议》</a></label><span id="isAgreeAgreementMessagePosition"></span></td></tr><tr><th>&nbsp;</th><td><input type="submit" id="registerWindowSubmit" class="registerWindowSubmit" value="" hidefocus="true"></td></tr></tbody></table></form></div><div class="windowBottom"></div></div><div id="loginWindow" class="loginWindow jqmID3"><div class="windowTop"><div class="windowTitle">会员登录</div><a class="windowClose loginWindowClose" href="http://www.fenaituan.com/#" hidefocus="true"></a></div><div class="windowMiddle"><form id="loginWindowForm" action="http://www.fenaituan.com/shop/member!ajaxLogin.action" method="post"><table><tbody><tr><th>用户名: </th><td><input type="text" name="member.username" class="formText {required: true, messages: {required: &#39;请填写用户名!&#39;}}"></td></tr><tr><th>密&nbsp;&nbsp;&nbsp;码: </th><td><input type="password" name="member.password" class="formText {required: true, messages: {required: &#39;请填写密码!&#39;}}"></td></tr><tr><th>验证码: </th><td><input type="text" id="loginWindowCaptcha" name="j_captcha" class="formTextS {required: true, messages: {required: &#39;请填写验证码!&#39;}}"><img id="loginWindowCaptchaImage" src="" alt="换一张"></td></tr><tr><th>&nbsp;</th><td><span class="warnIcon">&nbsp;</span><a href="http://www.fenaituan.com/shop/member!passwordRecover.action">忘记了密码? 点击找回!</a></td></tr><tr><th>&nbsp;</th><td><input type="submit" id="loginWindowSubmit" class="loginSubmit" value="登 录" hidefocus="true"></td></tr></tbody></table></form></div><div class="windowBottom"></div></div><div id="tipWindow" class="tipWindow"><span class="icon">&nbsp;</span><span class="messageText"></span></div><div id="messageWindow" class="messageWindow jqmID2"><div class="windowTop"><div class="windowTitle">提示信息&nbsp;</div><a class="messageClose windowClose" href="http://www.fenaituan.com/#" hidefocus="true"></a></div><div class="windowMiddle"><div class="messageContent"><span class="icon">&nbsp;</span><span class="messageText"></span></div><input type="button" class="formButton messageButton windowClose" value="确  定" hidefocus="true"></div><div class="windowBottom"></div></div><div id="contentWindow" class="contentWindow jqmID1"><div class="windowTop"><div class="windowTitle"></div><a class="messageClose windowClose" href="http://www.fenaituan.com/#" hidefocus="true"></a></div><div class="windowMiddle"><div class="windowContent"></div></div><div class="windowBottom"></div></div>
﻿<script type="text/javascript" src="js/header.js"></script>
<script type="text/javascript">
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
		 
		var zNodes=[{"id":"402881873db6422f013db64705c00001","pId":null,"name":"武汉科技大学"},{"id":"402881873db6422f013db6473e490002","pId":null,"name":"湖北中医院大学"},{"id":"aae012163de4a7ed013de79d7cde0001","pId":null,"name":"武汉长江工商学院"}];
		

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
			
			$.cookie("regionId",p, {expires: 7, path:"/"});
			$.cookie("regionName",v, {expires: 7, path:"/"});
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
			//var regionId="";
			//var regionName="";
			if(regionId!=""){
				$("#areaId").val(regionId);
			}else{
				$("#areaId").val("");
				$.cookie("regionId","", {expires: 7, path:"/"});
			}
			if(regionName!=null && regionName!=""){
				$("#areaSel").text(regionName);
			}else{
				$("#areaSel").text("选择学校");
				$.cookie("regionName","选择学校", {expires: 7, path:"/"});
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
	</script>
<link href="css/header.css" rel="stylesheet" type="text/css"/>
<div class="header png">
	<div class="headerTop png">
		<div class="headerTopContent">
			<div class="headerLoginInfo">
				您好<span id="headerLoginMemberUsername"></span>，欢迎来到粉爱团电子商务网站！
				<a href="http://www.fenaituan.com/#" id="headerShowLoginWindow" class="showLoginWindow" style="display: inline;">登录</a>
				<a href="http://www.fenaituan.com/shop/member_center!index.action" id="headerMemberCenter" style="display: none;">会员中心</a>
				<a href="http://www.fenaituan.com/#" id="headerShowRegisterWindow" class="showRegisterWindow" style="display: inline;">注册</a>
				<a href="http://www.fenaituan.com/shop/member!logout.action" id="headerLogout" style="display: none;">[退出]</a>
			</div>
			<div class="headerTopNav">
					<a href="javascript: addFavorite('http://www.fenaituan.com','粉爱团电子商务网站')">收藏本站</a>
					|
					<a href="http://www.fenaituan.com/shop/article!list.action?id=402881882ba8455f012ba86db8560006">帮助中心</a>
					|
					<a href="http://www.fenaituan.com/html/article_content/201010/5010509a555548939840a3103d3cea71.html">联系我们</a>
					
			</div>
		</div>
	</div>
	<div class="headerMiddle">
		<div class="headerInfo">
			7×24小时服务热线：<strong>027-88991645 13697342189</strong>
		</div>
		<div class="headerLogo">
			<a href="粉爱团电子商务网站 - Powered By 粉爱团电子商务网站.htm"><img class="png" src="images/logo.gif" title="粉爱团电子商务网站"></a>
		</div>
		<div style="width:200px;height:20px;float:left;position:absolute;margin-left:200px;padding-top:20px;">
			<input id="areaId" type="hidden" value="aae012163de4a7ed013de79d7cde0001"/>
			<h3>[<a href="http://www.fenaituan.com/#" id="areaSel">武汉长江工商学院</a>]</h3>
		</div>
		<div class="headerSearch png">
			<form id="productSearchForm" action="http://www.fenaituan.com/shop/product!search.action" method="get">
				<div class="headerSearchText">
					<input type="text" id="productSearchKeyword" name="pager.keyword" value="请输入关键词..." />
				</div>
				<input type="submit" class="headerSearchButton" value=""/>
				<div class="hotKeyword">
					热门关键词: 
						<a href="http://www.fenaituan.com/shop/product!search.action?pager.keyword=%E7%AF%AE%E7%90%83%EF%BC%8C%E8%A2%9C%E5%AD%90%EF%BC%8C%E6%B4%97%E5%8F%91%E9%9C%B2%EF%BC%8C%E7%A4%BC%E5%93%81%EF%BC%8C%E5%8F%AF%E4%B9%90">篮球，袜子，洗发露，礼品，可乐</a>
				</div>
			</form>
		</div>
	</div>
	<div class="headerBottom">
		<input type="button" class="cartItemListButton showCartItemList" value="" onclick="window.open(&#39;/shop/cart_item!list.action&#39;)"/>
		<ul id="cartItemListDetail"></ul>
		<input type="button" class="orderButton" value="" onclick="window.open(&#39;/shop/cart_item!list.action&#39;)"/>
		<div class="headerMiddleNav">
			<div class="headerMiddleNavLeft png"></div>
			<ul class="headerMiddleNavContent png">
					<li>
						<a href="粉爱团电子商务网站 - Powered By 粉爱团电子商务网站.htm">首页</a>
					</li>
					<li>
						<a href="http://www.fenaituan.com/shop/product!list.action?id=19">日用百货</a>
					</li>
					<li>
						<a href="http://www.fenaituan.com/shop/product!list.action?id=27">电器</a>
					</li>
					<li>
						<a href="http://www.fenaituan.com/shop/product!list.action?id=42">服饰鞋帽</a>
					</li>
					<li>
						<a href="http://www.fenaituan.com/shop/product!list.action?id=880070">饮料</a>
					</li>
					<li>
						<a href="http://www.fenaituan.com/shop/product!list.action?id=880137">浪漫礼物</a>
					</li>
					<li>
						<a href="http://www.fenaituan.com/shop/product!list.action?id=880160">大学生旅游</a>
					</li>
				<li><a href="http://www.fenaituan.com/shop/activity!list.action">活动中心</a></li>
			</ul>
			<div class="headerMiddleNavRight png"></div>
		</div>
	</div>
	<div id="menuContent" class="menuContent" style="display:none; position: absolute;">
		<ul id="treeDemo" class="ztree" style="margin-top:0;"><li id="treeDemo_1" class="level0" tabindex="0" hidefocus="true" treenode=""><span id="treeDemo_1_switch" title="" class="button level0 switch roots_docu" treenode_switch=""></span><a id="treeDemo_1_a" class="level0" treenode_a="" onclick="" target="_blank" style="" title="武汉科技大学"><span id="treeDemo_1_ico" title="" treenode_ico="" class="button ico_docu" style=""></span><span id="treeDemo_1_span">武汉科技大学</span></a></li><li id="treeDemo_2" class="level0" tabindex="0" hidefocus="true" treenode=""><span id="treeDemo_2_switch" title="" class="button level0 switch center_docu" treenode_switch=""></span><a id="treeDemo_2_a" class="level0" treenode_a="" onclick="" target="_blank" style="" title="湖北中医院大学"><span id="treeDemo_2_ico" title="" treenode_ico="" class="button ico_docu" style=""></span><span id="treeDemo_2_span">湖北中医院大学</span></a></li><li id="treeDemo_3" class="level0" tabindex="0" hidefocus="true" treenode=""><span id="treeDemo_3_switch" title="" class="button level0 switch bottom_docu" treenode_switch=""></span><a id="treeDemo_3_a" class="level0" treenode_a="" onclick="" target="_blank" style="" title="武汉长江工商学院"><span id="treeDemo_3_ico" title="" treenode_ico="" class="button ico_docu" style=""></span><span id="treeDemo_3_span">武汉长江工商学院</span></a></li></ul>
	</div>
</div>
<div class="webTop">
	<div class="left">
	<div class="menuNav">
    <h2></h2>
    <div class="navlist" id="SNmenuNav" >
     <% List list=new CategoryDAO().getList();
        for(int i=0;i<list.size();i++)
        {
        
           ProductCategory pc=(ProductCategory)list.get(i);
         %>
        <dl>
            <dt class="icon" ><a href="#"><%=pc.getName() %></a></dt>
            <dd class="menv">
                <ul class="sideleft">
                <% List list2=new CategoryDAO().findChildById(pc.getId());
                   for(int j=0;j<list2.size();j++)
                   {
                       ProductCategory pc2=(ProductCategory)list2.get(j);
                   		%>
                   		  <li class="noline"> <b><a href="#" ><%=pc2.getName() %></a></b>
                   		  <div> 
                   		   <a href="shop/product!list.action?id=<%=pc2.getId() %>" >全部</a>
                   		  <%  List list3=new CategoryDAO().findChildById(pc2.getId());
                   		      for(int m=0;m<list3.size();m++)
                   		      {
                   		        ProductCategory pc3=(ProductCategory)list3.get(m);
                   		        %>
                   		          <a href="shop/product!list.action?id=<%=pc3.getId() %>" ><%=pc3.getName() %></a>
                   		        <% 
                   		      }
                   		  
                   		   %>
                      </div>
                        <span class="clear"></span> </li>
                   <% 	
                   }
                
                 %>
                  
                   
                </ul>
                <ul class="sideright">
                    <h3>品牌推荐</h3>
                    <li><a href="#" >索尼</a></li>
                    <li><a href="#" >三星</a></li>
                    <li><a href="#" >夏普</a></li>
                    <li><a href="#" >飞利浦</a></li>
                    <li><a href="#" >TCL</a></li>
                    <li><a href="#" >松下</a></li>
                    <li><a href="#" >LG</a></li>
                </ul>
            </dd>
        </dl>
            <%} %>
    
    </div>
    <div class="clear"></div>
</div>
</div>
<div class="right">
	<diV class="banner">
		<script>indexswf();</script>
	</diV>
<div class="bannerTwo">
	<div class="hotProduct">
	<% List<Product> pts=new CategoryDAO().findHotProdoct();
	    int half=pts.size()/2;
	 %>
					<div onmouseout="tpl_Mar=setInterval(tpl_fun,tpl_auto);" onmouseover="clearInterval(tpl_Mar);" id="products_main" class="content">
						<div id="products_wrap">
						    <ul id="list1">
						    <% for(int i=0;i<half;i++)
						    { 
						    	 Product p=pts.get(i);
						    %>
				  				<li><a href="<%=p.getHtmlFilePath() %>"><span><img src="<%=new CategoryDAO().getImage(p.getProductImageListStore(),"smallProductImagePath") %>"></span><p><%=p.getName() %></p></a></li>
				  				<%} %>
				  			</ul>
							<ul id="list2">
				  				  <% for(int i=half;i<2*half;i++)
						    { 
						    	 Product p=pts.get(i);
						    %>
				  				<li><a href="<%=p.getHtmlFilePath() %>"><span><img src="<%=new CategoryDAO().getImage(p.getProductImageListStore(),"smallProductImagePath") %>"></span><p><%=p.getName() %></p></a></li>
				  				<%} %>
				  			</ul>
						</div>
			        </div>
			        <script type="text/javascript">
			        	function Fid(id){
						return document.getElementById(id);
						}
						//²úÆ·¹ö¶¯
						var tpl_auto=2000; //ÖµÔ½´óËÙ¶ÈÔ½Âý
						var tpl_speed=120;
						var tpl_unit_auto=30; //¹ö¶¯¼ä¸ôÊ±¼ä
						var tpl_unit_speed=10; //ÔÚÒÆ¶¯Ò»ÁÐÊ±µÄ²½³¤
						var tmp_unit_speed;
						var tpl_Mar_slow;
						var tpl_Mar;
						var tpl_dd;
						var tpl_dd1;
						var tpl_dd2;
						function tpl_fun(){
						if(tpl_dd2.offsetWidth-tpl_dd.scrollLeft<=0){
						tpl_dd.scrollLeft-=tpl_dd1.offsetWidth;
						}else{
						tpl_Mar_slow=setInterval(tpl_moveslow,tpl_unit_auto);
						tmp_unit_speed=0;
						}
						}
						function tpl_moveslow(){
						if(tpl_speed-tmp_unit_speed>=tpl_unit_speed){
						tpl_dd.scrollLeft=tpl_dd.scrollLeft+tpl_unit_speed;
						tmp_unit_speed+=tpl_unit_speed;
						}else if(tpl_speed-tmp_unit_speed<tpl_unit_speed && tpl_speed-tmp_unit_speed>0){
						var tmp_zero_speed=tpl_speed-tmp_unit_speed;
						tpl_dd.scrollLeft=tpl_dd.scrollLeft+tmp_zero_speed;
						tmp_unit_speed+=tmp_zero_speed;
						}
						if(tpl_speed-tmp_unit_speed==0)
						clearInterval(tpl_Mar_slow);
						}
						function products_scroll(){
						tpl_dd=Fid("products_main");
						tpl_dd1=Fid("list1");
						tpl_dd2=Fid("list2");
						tpl_dd2.innerHTML=tpl_dd1.innerHTML;
						tpl_Mar=setInterval(tpl_fun,tpl_auto); //ÉèÖÃ¶¨Ê±Æ÷
						} 
						products_scroll();
			        </script>
		</div>
</div>
</div>
<div class="clear"></div>
<div class="bottom">
	<div class="leftProduct">
		<div id="rotate">
		  <ul class="tabTittle">
		    <li id="L1" onclick="getTab(1)" onmouseover="getTab(1)"><a href="#fragment-1"><span>精品推荐</span></a></li>
		    <li id="L2" onclick="getTab(2)" onmouseover="getTab(2)"><a href="#fragment-2"><span>热销排行</span></a></li>
		    <li id="L3" onclick="getTab(3)" onmouseover="getTab(3)"><a href="#fragment-3"><span>热点文章</span></a></li>
		  </ul>
		  <div id="d1">
		  <% List<Product>  pros=new CategoryDAO().findBestProdoct();
		  for(int i=0;i<pros.size();i++)
		  {
		    Product pt=pros.get(i);
		    if(i==0)
		    {
		    %>
		    <div class="productShow1">
			<div class="productImgs"><a href="<%=pt.getHtmlFilePath() %>"><img src="<%=new CategoryDAO().getImage(pt.getProductImageListStore(),"smallProductImagePath") %>" alt="" /></a></div>
				<div class="productText">
					<span class="productName"><a href="<%=pt.getHtmlFilePath() %>"><%=pt.getName() %></a></span>
					<span class="productOldPr"><%=pt.getMarketPrice() %></span>
					<span class="productNewPr"><%=pt.getPrice() %></span>
				</div>
			</div>
		    <% 
		    }else
		    {
		  %>
			
			<div class="productShow">
				<div class="productImgs"><a href=""><img src="<%=new CategoryDAO().getImage(pt.getProductImageListStore(),"smallProductImagePath") %>" alt="" /></a></div>
				<div class="productText">
					<span class="productName"><a href="<%=pt.getHtmlFilePath() %>"><%=pt.getName() %></a></span>
					<span class="productOldPr"><%=pt.getMarketPrice() %></span>
					<span class="productNewPr"><%=pt.getPrice() %></span>
				</div>
			</div>
			<%}} %>
		  </div>
		  <div id="d2">
		  	<ul>
		  		<li><a href="">维达花之韵无芯卷纸78g/提</a></li>
		  		<li><a href="">男士内裤K6951（两条）</a></li>
		  		<li><a href="">独风流</a></li>
		  		<li><a href="">乐扣乐扣运动茶杯（紫色）2...</a></li>
		  		<li><a href="">飘柔焗油护理洗发露200m...</a></li>
		  	</ul>
		  	<ul>
		  		<li><a href="">洁丽雅秀逸轻灵天鹅绒舒适平...</a></li>
		  		<li><a href="">洁丽雅精梳棉运动男袜G52...</a></li>
		  		<li><a href="">华纳兔八哥馋嘴隔热杯WB-...</a></li>
		  		<li><a href="">剪纸米奇随手杯DSM-13...</a></li>
		  		<li><a href="">清扬男士洗发露清爽控油型(...</a></li>
		  	</ul>
		  </div>
		  <div id="d3">
		  	<ul>
		  		<li><a href="">网站制度</a></li>
		  		<li><a href="">联系我们</a></li>
		  		<li><a href="">关于我们</a></li>
		  		<li><a href="">会员等级</a></li>
		  		<li><a href="">常见问题</a></li>
		  	</ul>
		  	<ul>
		  		<li><a href="">退货政策</a></li>
		  		<li><a href="">订单查询</a></li>
		  		<li><a href="">购物流程</a></li>
		  		<li><a href="">积分说明</a></li>
		  		<li><a href="">网上支付</a></li>
		  	</ul>
		  </div>
		</div>

	</div>
	<div class="adPic"><img src="images/adPic.jpg" alt="" /></div>
</div>
</div>
<div class="clear"></div>
<div class="productsList">
	<div class="productContent daily">
		<div class="left">
			<div class="productsTitle"></div>
			<div class="productsLine">
				<ul class="lists">
				<%   List<ProductCategory> c=new CategoryDAO().findChildById("19");
				     for(int i=0;i<c.size();i++)
				     {
				        ProductCategory pc=c.get(i);
				   
				 %>
					<li><a href="shop/product!list.action?id=<%=pc.getId() %>"><%=pc.getName() %></a></li>
					<% } %>
				</ul>
			</div>
		</div>
		<div class="center">
		<% List<ProductCategory> a=new CategoryDAO().findChildById("19");
		int count1=0;
				     for(int i=0;i<a.size();i++)
				     {
				        ProductCategory pc=a.get(i);  
				        List<Product> ps=new CategoryDAO().findByCategoryId(pc.getId());
				        for(int i1=0;i1<ps.size();i1++)
				        {
				        Product p=ps.get(i1);
				           count1++;
				           if(count1==1||count1==5)
				           {
				         %>
			<div class="productShow1">
				<div class="productImgs"><a href=""><img src="<%=new CategoryDAO().getImage(p.getProductImageListStore(),"smallProductImagePath") %>" alt="" /></a></div>
				<div class="productText">
					<span class="productName"><a href="<%=p.getHtmlFilePath() %>"><%=p.getName() %></a></span>
					<span class="productOldPr"><%=p.getPrice() %></span>
					<span class="productNewPr"><%=p.getMarketPrice() %></span>
				</div>
			</div>
			<%}
			else
			{
			%>
			<div class="productShow">
				<div class="productImgs"><a href=""><img src="<%=new CategoryDAO().getImage(p.getProductImageListStore(),"smallProductImagePath") %>" alt="" /></a></div>
				<div class="productText">
					<span class="productName"><a href="<%=p.getHtmlFilePath() %>"><%=p.getName() %></a></span>
					<span class="productOldPr"><%=p.getMarketPrice() %></span>
					<span class="productNewPr"><%=p.getPrice() %></span>
				</div>
			</div>
			<% 
			}
			if(count1==8) break;
			}
			if(count1==8) break;
			} %>
			
		</div>
		<div class="right">
			<div class="rightPic"><a href=""><img src="images/rightAd1.jpg" alt="" /></a></div>
			<div class="rightPic1"><a href=""><img src="images/rightAd2.jpg" alt="" /></a></div>
			<div class="rightPic"><a href=""><img src="images/rightAd3.jpg" alt="" /></a></div>
		</div>
	</div>
</div>
<div class="productsList">
	<div class="productContent tiyu">
		<div class="left">
			<div class="productsTitle"></div>
			<div class="productsLine">
				<ul class="lists">
					<%   List<ProductCategory> c1=new CategoryDAO().findChildById("333");
				     for(int i=0;i<c1.size();i++)
				     {
				        ProductCategory pc=c1.get(i);
				   
				 %>
					<li><a href="shop/product!list.action?id=<%=pc.getId() %>"><%=pc.getName() %></a></li>
					<% } %>
				</ul>
			</div>
		</div>
		<div class="center">
			<% List<ProductCategory> b=new CategoryDAO().findChildById("333");
		int count2=0;
				     for(int i=0;i<b.size();i++)
				     {
				        ProductCategory pc=b.get(i);  
				        List<Product> ps=new CategoryDAO().findByCategoryId(pc.getId());
				        for(int i1=0;i1<ps.size();i1++)
				        {
				        Product p=ps.get(i1);
				           count2++;
				          if(count2==1||count2==5)
				           {
				         %>
			<div class="productShow1">
				<div class="productImgs"><a href=""><img src="<%=new CategoryDAO().getImage(p.getProductImageListStore(),"smallProductImagePath") %>" alt="" /></a></div>
				<div class="productText">
					<span class="productName"><a href="<%=p.getHtmlFilePath() %>"><%=p.getName() %></a></span>
					<span class="productOldPr"><%=p.getMarketPrice() %></span>
					<span class="productNewPr"><%=p.getPrice() %></span>
				</div>
			</div>
			<%}
			else
			{
			%>
			<div class="productShow">
				<div class="productImgs"><a href=""><img src="<%=new CategoryDAO().getImage(p.getProductImageListStore(),"smallProductImagePath") %>" alt="" /></a></div>
				<div class="productText">
					<span class="productName"><a href="<%=p.getHtmlFilePath() %>"><%=p.getName() %></a></span>
					<span class="productOldPr"><%=p.getMarketPrice() %></span>
					<span class="productNewPr"><%=p.getPrice() %></span>
				</div>
			</div>
			<% 
			}
			 if(count2==8)  break;
			}
			 if(count2==8)  break;
			} %>
		</div>
		<div class="right">
			<div class="rightPic"><a href=""><img src="images/rightAd1.jpg" alt="" /></a></div>
			<div class="rightPic1"><a href=""><img src="images/rightAd2.jpg" alt="" /></a></div>
			<div class="rightPic"><a href=""><img src="images/rightAd3.jpg" alt="" /></a></div>
		</div>
	</div>
</div>
<div class="productsList">
	<div class="productContent diannao">
		<div class="left">
			<div class="productsTitle"></div>
			<div class="productsLine">
				<ul class="lists">
					<%   List<ProductCategory> c3=new CategoryDAO().findChildById("383");
				     for(int i=0;i<c3.size();i++)
				     {
				        ProductCategory pc=c3.get(i);
				   
				 %>
					<li><a href="shop/product!list.action?id=<%=pc.getId() %>"><%=pc.getName() %></a></li>
					<% } %>
				</ul>
			</div>
		</div>
		<div class="center">
			<% List<ProductCategory> d=new CategoryDAO().findChildById("383");
		int count3=0;
				     for(int i=0;i<d.size();i++)
				     {
				        ProductCategory pc=d.get(i);  
				        List<Product> ps=new CategoryDAO().findByCategoryId(pc.getId());
				        for(int i1=0;i1<ps.size();i1++)
				        {
				        Product p=ps.get(i1);
				           count3++;
				         
				       if(count3==1||count3==5)
				           {
				         %>
			<div class="productShow1">
				<div class="productImgs"><a href=""><img src="<%=new CategoryDAO().getImage(p.getProductImageListStore(),"smallProductImagePath") %>" alt="" /></a></div>
				<div class="productText">
					<span class="productName"><a href="<%=p.getHtmlFilePath() %>"><%=p.getName() %></a></span>
					<span class="productOldPr"><%=p.getMarketPrice() %></span>
					<span class="productNewPr"><%=p.getPrice() %></span>
				</div>
			</div>
			<%}
			else
			{
			%>
			<div class="productShow">
				<div class="productImgs"><a href=""><img src="<%=new CategoryDAO().getImage(p.getProductImageListStore(),"smallProductImagePath") %>" alt="" /></a></div>
				<div class="productText">
					<span class="productName"><a href="<%=p.getHtmlFilePath() %>"><%=p.getName() %></a></span>
				    <span class="productOldPr"><%=p.getMarketPrice() %></span>
					<span class="productNewPr"><%=p.getPrice() %></span>
				</div>
			</div>
			<% 
			}
			  if(count3==8)
				             break;
				         
			
			}
			if(count3==8)
				             break;
			
			} %>
</div>
		<div class="right">
			<div class="rightPic"><a href=""><img src="images/rightAd1.jpg" alt="" /></a></div>
			<div class="rightPic1"><a href=""><img src="images/rightAd2.jpg" alt="" /></a></div>
			<div class="rightPic"><a href=""><img src="images/rightAd3.jpg" alt="" /></a></div>
		</div>
	</div>
</div>
<div class="productsList">
	<div class="productContent meirong">
		<div class="left">
			<div class="productsTitle"></div>
			<div class="productsLine">
				<ul class="lists">
						<%   List<ProductCategory> c4=new CategoryDAO().findChildById("9000");
				     for(int i=0;i<c4.size();i++)
				     {
				        ProductCategory pc=c4.get(i);
				   
				 %>
					<li><a href="shop/product!list.action?id=<%=pc.getId() %>"><%=pc.getName() %></a></li>
					<% } %>
				</ul>
			</div>
		</div>
		<div class="center">
			<% List<ProductCategory> e=new CategoryDAO().findChildById("9000");
		int count4=0;
				     for(int i=0;i<e.size();i++)
				     {
				        ProductCategory pc=e.get(i);  
				        List<Product> ps=new CategoryDAO().findByCategoryId(pc.getId());
				        for(int i1=0;i1<ps.size();i1++)
				        {
				        Product p=ps.get(i1);
				           count4++;
				         if(count4==1||count4==5)
				           {
				         %>
			<div class="productShow1">
				<div class="productImgs"><a href=""><img src="<%=new CategoryDAO().getImage(p.getProductImageListStore(),"smallProductImagePath") %>" alt="" /></a></div>
				<div class="productText">
					<span class="productName"><a href="<%=p.getHtmlFilePath() %>"><%=p.getName() %></a></span>
					<span class="productOldPr"><%=p.getMarketPrice() %></span>
					<span class="productNewPr"><%=p.getPrice() %></span>
				</div>
			</div>
			<%}
			else
			{
			%>
			<div class="productShow">
				<div class="productImgs"><a href=""><img src="<%=new CategoryDAO().getImage(p.getProductImageListStore(),"smallProductImagePath") %>" alt="" /></a></div>
				<div class="productText">
					<span class="productName"><a href="<%=p.getHtmlFilePath() %>"><%=p.getName() %></a></span>
				    <span class="productOldPr"><%=p.getMarketPrice() %></span>
					<span class="productNewPr"><%=p.getPrice() %></span>
				</div>
			</div>
			<% 
			}
			    if(count4==8) break;
			}
			 if(count4==8) break;
			} %>
		</div>
		<div class="right">
			<div class="rightPic"><a href=""><img src="images/rightAd1.jpg" alt="" /></a></div>
			<div class="rightPic1"><a href=""><img src="images/rightAd2.jpg" alt="" /></a></div>
			<div class="rightPic"><a href=""><img src="images/rightAd3.jpg" alt="" /></a></div>
		</div>
	</div>
</div>
<div class="productsList">
	<div class="productContent qinshi">
		<div class="left">
			<div class="productsTitle"></div>
			<div class="productsLine">
				<ul class="lists">
						<%   List<ProductCategory> c5=new CategoryDAO().findChildById("880003");
				     for(int i=0;i<c5.size();i++)
				     {
				        ProductCategory pc=c5.get(i);
				   
				 %>
					<li><a href="shop/product!list.action?id=<%=pc.getId() %>"><%=pc.getName() %></a></li>
					<% } %>
				</ul>
			</div>
		</div>
		<div class="center">
			<% List<ProductCategory> f=new CategoryDAO().findChildById("880003");
		int count5=0;
				     for(int i=0;i<f.size();i++)
				     {
				        ProductCategory pc=f.get(i);  
				        List<Product> ps=new CategoryDAO().findByCategoryId(pc.getId());
				        for(int i1=0;i1<ps.size();i1++)
				        {
				        Product p=ps.get(i1);
				           count5++;
				           
				        if(count5==1||count5==5)
				           {
				         %>
			<div class="productShow1">
				<div class="productImgs"><a href=""><img src="<%=new CategoryDAO().getImage(p.getProductImageListStore(),"smallProductImagePath") %>" alt="" /></a></div>
				<div class="productText">
					<span class="productName"><a href="<%=p.getHtmlFilePath() %>"><%=p.getName() %></a></span>
					<span class="productOldPr"><%=p.getMarketPrice() %></span>
					<span class="productNewPr"><%=p.getPrice() %></span>
				</div>
			</div>
			<%}
			else
			{
			%>
			<div class="productShow">
				<div class="productImgs"><a href=""><img src="<%=new CategoryDAO().getImage(p.getProductImageListStore(),"smallProductImagePath") %>" alt="" /></a></div>
				<div class="productText">
					<span class="productName"><a href="<%=p.getHtmlFilePath() %>"><%=p.getName() %></a></span>
				    <span class="productOldPr"><%=p.getMarketPrice() %></span>
					<span class="productNewPr"><%=p.getPrice() %></span>
				</div>
			</div>
			<% 
			}
			if(count5==8)
				             break;
			}
			if(count5==8)
				             break;
			} %>
		</div>
		<div class="right">
			<div class="rightPic"><a href=""><img src="images/rightAd1.jpg" alt="" /></a></div>
			<div class="rightPic1"><a href=""><img src="images/rightAd2.jpg" alt="" /></a></div>
			<div class="rightPic"><a href=""><img src="images/rightAd3.jpg" alt="" /></a></div>
		</div>
	</div>
</div>
<div class="productsList">
	<div class="productContent xiuxian">
		<div class="left">
			<div class="productsTitle"></div>
			<div class="productsLine">
				<ul class="lists">
					<%   List<ProductCategory> c6=new CategoryDAO().findChildById("880062");
				     for(int i=0;i<c6.size();i++)
				     {
				        ProductCategory pc=c6.get(i);
				   
				 %>
					<li><a href="shop/product!list.action?id=<%=pc.getId() %>"><%=pc.getName() %></a></li>
					<% } %>
				</ul>
			</div>
		</div>
		<div class="center">
			<% List<ProductCategory> g=new CategoryDAO().findChildById("880062");
		int count6=0;
				     for(int i=0;i<g.size();i++)
				     {
				        ProductCategory pc=g.get(i);  
				        List<Product> ps=new CategoryDAO().findByCategoryId(pc.getId());
				        for(int i1=0;i1<ps.size();i1++)
				        {
				        Product p=ps.get(i1);
				           count6++;
				    if(count6==1||count6==5)
				           {
				         %>
			<div class="productShow1">
				<div class="productImgs"><a href=""><img src="<%=new CategoryDAO().getImage(p.getProductImageListStore(),"smallProductImagePath") %>" alt="" /></a></div>
				<div class="productText">
					<span class="productName"><a href="<%=p.getHtmlFilePath() %>"><%=p.getName() %></a></span>
				    <span class="productOldPr"><%=p.getMarketPrice() %></span>
					<span class="productNewPr"><%=p.getPrice() %></span>
				</div>
			</div>
			<%}
			else
			{
			%>
			<div class="productShow">
				<div class="productImgs"><a href=""><img src="<%=new CategoryDAO().getImage(p.getProductImageListStore(),"smallProductImagePath") %>" alt="" /></a></div>
				<div class="productText">
					<span class="productName"><a href="<%=p.getHtmlFilePath() %>"><%=p.getName() %></a></span>
				    <span class="productOldPr"><%=p.getMarketPrice() %></span>
					<span class="productNewPr"><%=p.getPrice() %></span>
				</div>
			</div>
			<% 
			}
			 if(count6==8)
				             break;
			}
			 if(count6==8)
				             break;
			} %>
		</div>
		<div class="right">
			<div class="rightPic"><a href=""><img src="images/rightAd1.jpg" alt="" /></a></div>
			<div class="rightPic1"><a href=""><img src="images/rightAd2.jpg" alt="" /></a></div>
			<div class="rightPic"><a href=""><img src="images/rightAd3.jpg" alt="" /></a></div>
		</div>
	</div>
</div>
<div class="productsList">
	<div class="productContent liwu">
		<div class="left">
			<div class="productsTitle"></div>
			<div class="productsLine">
				<ul class="lists">
							<%   List<ProductCategory> c7=new CategoryDAO().findChildById("880137");
				     for(int i=0;i<c7.size();i++)
				     {
				        ProductCategory pc=c7.get(i);
				   
				 %>
					<li><a href="shop/product!list.action?id=<%=pc.getId() %>"><%=pc.getName() %></a></li>
					<% } %>
				</ul>
			</div>
		</div>
		<div class="center">
			<% List<ProductCategory> h=new CategoryDAO().findChildById("880137");
		int count7=0;
				     for(int i=0;i<h.size();i++)
				     {
				        ProductCategory pc=h.get(i);  
				        List<Product> ps=new CategoryDAO().findByCategoryId(pc.getId());
				        for(int i1=0;i1<ps.size();i1++)
				        {
				        Product p=ps.get(i1);
				           count7++;
				           
			    if(count7==1||count7==5)
				           {
				         %>
			<div class="productShow1">
				<div class="productImgs"><a href=""><img src="<%=new CategoryDAO().getImage(p.getProductImageListStore(),"smallProductImagePath") %>" alt="" /></a></div>
				<div class="productText">
					<span class="productName"><a href="<%=p.getHtmlFilePath() %>"><%=p.getName() %></a></span>
				    <span class="productOldPr"><%=p.getMarketPrice() %></span>
					<span class="productNewPr"><%=p.getPrice() %></span>
				</div>
			</div>
			<%}
			else
			{
			%>
			<div class="productShow">
				<div class="productImgs"><a href=""><img src="<%=new CategoryDAO().getImage(p.getProductImageListStore(),"smallProductImagePath") %>" alt="" /></a></div>
				<div class="productText">
					<span class="productName"><a href="<%=p.getHtmlFilePath() %>"><%=p.getName() %></a></span>
					<span class="productOldPr"><%=p.getMarketPrice() %></span>
					<span class="productNewPr"><%=p.getPrice() %></span>
				</div>
			</div>
			<% 
			}
			if(count7==8)
				             break;}
				             if(count7==8)
				             break;} %>
		</div>
		<div class="right">
			<div class="rightPic"><a href=""><img src="images/rightAd1.jpg" alt="" /></a></div>
			<div class="rightPic1"><a href=""><img src="images/rightAd2.jpg" alt="" /></a></div>
			<div class="rightPic"><a href=""><img src="images/rightAd3.jpg" alt="" /></a></div>
		</div>
	</div>
</div>
<div class="productsList">
	<div class="productContent dianqi">
		<div class="left">
			<div class="productsTitle"></div>
			<div class="productsLine">
				<ul class="lists">
						<%   List<ProductCategory> c8=new CategoryDAO().findChildById("27");
				     for(int i=0;i<c8.size();i++)
				     {
				        ProductCategory pc=c8.get(i);
				   
				 %>
					<li><a href="shop/product!list.action?id=<%=pc.getId() %>"><%=pc.getName() %></a></li>
					<% } %>
				</ul>
			</div>
		</div>
		<div class="center">
				<% List<ProductCategory> j=new CategoryDAO().findChildById("27");
		int count8=0;
				     for(int i=0;i<j.size();i++)
				     {
				        ProductCategory pc=j.get(i);  
				        List<Product> ps=new CategoryDAO().findByCategoryId(pc.getId());
				        for(int i1=0;i1<ps.size();i1++)
				        {
				        Product p=ps.get(i1);
				           count8++;
				          
				    if(count8==1||count8==5)
				           {
				         %>
			<div class="productShow1">
				<div class="productImgs"><a href=""><img src="<%=new CategoryDAO().getImage(p.getProductImageListStore(),"smallProductImagePath") %>" alt="" /></a></div>
				<div class="productText">
					<span class="productName"><a href="<%=p.getHtmlFilePath() %>"><%=p.getName() %></a></span>
					<span class="productOldPr"><%=p.getMarketPrice() %></span>
					<span class="productNewPr"><%=p.getPrice() %></span>
				</div>
			</div>
			<%}
			else
			{
			%>
			<div class="productShow">
				<div class="productImgs"><a href=""><img src="<%=new CategoryDAO().getImage(p.getProductImageListStore(),"smallProductImagePath") %>" alt="" /></a></div>
				<div class="productText">
					<span class="productName"><a href="<%=p.getHtmlFilePath() %>"><%=p.getName() %></a></span>
					<span class="productOldPr"><%=p.getMarketPrice() %></span>
					<span class="productNewPr"><%=p.getPrice() %></span>
				</div>
			</div>
			<% 
			}
			 if(count8==8)
			             break;}
				              if(count8==8)
				             break;
				             } %>
		</div>
		<div class="right">
			<div class="rightPic"><a href=""><img src="images/rightAd1.jpg" alt="" /></a></div>
			<div class="rightPic1"><a href=""><img src="images/rightAd2.jpg" alt="" /></a></div>
			<div class="rightPic"><a href=""><img src="images/rightAd3.jpg" alt="" /></a></div>
		</div>
	</div>
</div>


<div class="webFooter">
	<div class="blank"></div>
<link href="css/friend_link.css" type="text/css" rel="stylesheet"/>
<script type="text/javascript" src="js/friend_link.js"></script>
<div class="friendLink">
	<div class="pictureFriendLink">
		<div class="left prev disabled"></div>
		<div class="middle scrollable">
			<ul class="items">
					<li>
						<a href="http://www.boc.cn/" target="_blank" title="中国银行" style="opacity: 0.5;">
							<img src="images/d7f330b36cc1468e978a83b5edeb010e.gif"/>
						</a>
					</li>
					<li>
						<a href="http://cmpay.10086.cn/" target="_blank" title="手机支付" style="opacity: 0.5;">
							<img src="images/b798c45e177e4486b3d91df376ffa605.gif"/>
						</a>
					</li>
					<li>
						<a href="https://www.alipay.com/" target="_blank" title="支付宝" style="opacity: 0.5;">
							<img src="images/351cf1e552314fa187c8cd2d4b1b28cb.png"/>
						</a>
					</li>
					<li>
						<a href="https://www.tenpay.com/" target="_blank" title="财付通" style="opacity: 0.5;">
							<img src="images/fc36b46c50a6485ca2b8e535d63c6a21.png"/>
						</a>
					</li>
					<li>
						<a href="https://www.99bill.com/" target="_blank" title="快钱" style="opacity: 0.5;">
							<img src="images/3f9825f3d5d84676865c4d5d6f67abaa.png"/>
						</a>
					</li>
					<li>
						<a href="http://www.shopxx.net/" target="_blank" title="网上商城" style="opacity: 0.5;">
							<img src="images/095643f4ff4449ba9dfc78b12bdc4b3a.png"/>
						</a>
					</li>
					<li>
						<a href="http://www.icbc.com.cn/" target="_blank" title="工商银行" style="opacity: 0.5;">
							<img src="images/d8c231353b594de89ab0e9954ced0335.png"/>
						</a>
					</li>
					<li>
						<a href="http://www.ccb.com/cn/home/index.html" target="_blank" title="建设银行" style="opacity: 0.5;">
							<img src="images/e7b2b595a2724b87aa4fdecd34c75c79.png"/>
						</a>
					</li>
					<li>
						<a href="http://www.abchina.com/cn/default.htm" target="_blank" title="农业银行" style="opacity: 0.5;">
							<img src="images/e11494cddc0a4d66ad4a90588168fa75.png"/>
						</a>
					</li>
			</ul>
		</div>
		<div class="right next"></div>
	</div>
	<div class="textFriendLink">
		<div class="left"></div>
		<div class="middle">
			<ul>
					<li>
						<a href="https://www.alipay.com/" target="_blank" title="支付宝">支付宝</a>
					</li>
					<li>
						<a href="https://www.tenpay.com/" target="_blank" title="财付通">财付通</a>
					</li>
					<li>
						<a href="https://www.99bill.com/" target="_blank" title="快钱">快钱</a>
					</li>
					<li>
						<a href="http://www.baidu.com/" target="_blank" title="百度">百度</a>
					</li>
					<li>
						<a href="http://www.google.com.hk/" target="_blank" title="Google">Google</a>
					</li>
			</ul>
		</div>
		<div class="right"></div>
	</div>
</div>	</div>
	<div class="blank"></div>
<link href="css/footer.css" type="text/css" rel="stylesheet"/>
<div class="footer">
	<div class="bottomNavigation">
				<dl>
				<dd>
					<a href="http://www.fenaituan.com/html/article_content/201010/9102600e47b7401b843ad3722e1e9b70.html">购物流程</a>
				</dd>
				<dd>
					<a href="http://www.fenaituan.com/html/article_content/201010/90eb7634990341909027a5e20245b3e1.html">网站制度</a>
				</dd>
				<dd>
					<a href="http://www.fenaituan.com/html/article_content/201010/50588403d9dd494c9035fa763e49e112.html">订单查询</a>
				</dd>
				</dl>
				<dl>
				<dd>
					<a href="http://www.fenaituan.com/html/article_content/201010/390aed8de096473aa3fd928c25bf9fb9.html">积分说明</a>
				</dd>
				<dd>
					<a href="http://www.fenaituan.com/html/article_content/201010/c55109104bb241c7a51605602b1531df.html">会员注册协议</a>
				</dd>
				<dd>
					<a href="http://www.fenaituan.com/html/article_content/201010/0340b92488ca464aa8d545fb899dcd25.html">会员等级</a>
				</dd>
				</dl>
				<dl>
				<dd>
					<a href="http://www.fenaituan.com/html/article_content/201010/fd97e448663c4f5a8f033743328a8038.html">网上支付</a>
				</dd>
				<dd>
					<a href="http://www.fenaituan.com/shopxx/html/article_content/201010/fd97e448663c4f5a8f033743328a8038.html">邮局汇款</a>
				</dd>
				<dd>
					<a href="http://www.fenaituan.com/html/article_content/201010/ac6f0b7c351c41058dc800ea0091e26c.html">退货政策</a>
				</dd>
				</dl>
				<dl>
				<dd>
					<a href="http://www.fenaituan.com/html/article_content/201010/070088f2df794b26b03bdf022565f1f2.html">关于我们</a>
				</dd>
				<dd>
					<a href="http://www.fenaituan.com/html/article_content/201010/82c2ffe3f0234a6ba2aed4727a75a19a.html">发票制度说明</a>
				</dd>
				<dd>
					<a href="http://www.fenaituan.com/html/article_content/201010/cb4b35cc2fd14ddbb20b49d7637fab2f.html">常见问题</a>
				</dd>
				</dl>
	</div>
	<div class="footerInfo">
<ul>
<li><a>关于商城</a>|</li>
<li><a>帮助中心</a>|</li>
<li><a>网站地图</a>|</li>
<li><a>诚聘英才</a>|</li>
<li><a>联系我们</a>|</li>
<li><a>版权说明</a></li>
</ul>
<ul>
<p>Copyright © 2013 粉爱团 All rights reserved. 武汉粉爱团电子商务有限公司</p>
<p>Powered by 粉爱团2013</p>
</ul>	</div>
</div>

		
<div id="agreementWindow" class="agreementWindow jqmID5"><div class="windowTop"><div class="windowTitle">注册协议</div><a class="windowClose agreementWindowClose" href="http://www.fenaituan.com/#" hidefocus="true"></a></div><div class="windowMiddle"><div id="agreementContent"></div><input type="button" id="agreementButton" class="agreementButton agreementWindowClose" value="" hidefocus="true"></div><div class="windowBottom"></div></div></body></html>