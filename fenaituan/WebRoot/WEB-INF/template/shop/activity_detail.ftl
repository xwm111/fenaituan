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
<script type="text/javascript" src="${base}/ckeditor/ckeditor.js"></script> <!--载入fckeditor类--> 
<script type="text/javascript">
$(function(){
	var $loginMemberUsername = $("#loginMemberUsername");
	if($.cookie("loginMemberUsername") != null) {
		$loginMemberUsername.text($.cookie("loginMemberUsername"));
	}else {
		$loginMemberUsername.text("");
	}
	
	$(".replybutton").click(function(){
		$("#replyContent").focus();
		return false;
	})
})
function doReply(username){
	$("#replyContent").focus();
	$("#replyContent").text("Reply:"+username);
	return false;
}

</script>
</head>
<body class="memberCenter">
	<#include "/WEB-INF/template/shop/header.ftl">
	<div class="body memberCenterIndex">
	<div class="pages_btns">
	<div class="pages"><a href="activity!list.action" class="next"> ‹‹ 返回活动列表</a></div>
	<span class="postbtn" id="newtopic" >
<a href="activity!add.action"><img src="${base}/template/shop/images/ejforum/newtopic.gif" border="0"></a></span>
	</div>
	
<div class="mainbox viewtopic">
<span class="headactions">
<a class="notabs" href="./member/my_addfavor.jsp?tid=21&amp;fid=1">收藏</a> </span>
<h1>${activity.name}&nbsp;</h1>
<table id="rid0" cellspacing="0" cellpadding="0">
  <tbody>
  <tr>
    <td class="postauthor" rowspan="3">
  	  <cite><a href="#" target="_blank">${activity.creatorMem.username}</a></cite> 
      <div class="avatar">
	  	<img src="${base}/template/shop/images/ejforum/unknown.gif" border="0" ></div>
	  
      <p><em>${activity.creatorMem.memberRank.name}</em>&nbsp;
	  </p>
	  <dl class="profile">
	  	<dt>积分&nbsp;</dt><dd>${activity.creatorMem.point}&nbsp;</dd>
	  </dl>				      
	  <ul>
	  </ul></td>
    <td class="postdetail">
      <div class="postinfo"><strong title="ID:0">楼主<sup>#</sup></strong> 
	  发表于${activity.createDate?string("yyyy-MM-dd HH:mm:ss")}&nbsp;
	  </div>
      <div class="postcontent">
      <div id="content_0" class="contentmsg">${activity.content}</div>

  </div></td></tr>
  <tr>
    <td class="postfooter">
      <div class="postactions"><p>
		<!--
	     <a href="javascript:doReply('csheaven03');">回复</a>&nbsp;&nbsp;

	  	 <a href="javascript:doQuote('0','csheaven03','2013-02-20 11:13');">引用</a>&nbsp;&nbsp;
		 <a href="javascript:doReport('0');">举报</a>&nbsp;&nbsp;
		 -->
	     <span title="顶部" class="scrolltop" onclick="scroll(0,0)">TOP</span> </p></div></td></tr></tbody></table></div>
	     
	     <#list pager.list as list>
<div class="mainbox viewtopic">
<table id="rid2" cellspacing="0" cellpadding="0">
  <tbody>
  <tr>
    <td class="postauthor" rowspan="3">
  	  <cite><a href="#" target="_blank">${list.creatorMem.username}</a></cite> 

      <div class="avatar">
	  	<img src="${base}/template/shop/images/ejforum/unknown.gif" border="0" ></div>
	  
      <p><em>${list.creatorMem.memberRank.name}</em>&nbsp;
	  </p>
	  <dl class="profile">
	  	<dt>积分&nbsp;</dt><dd>${list.creatorMem.point}&nbsp;</dd>
	  </dl>				      
	  <ul>
	  </ul></td>
    <td class="postdetail">
      <div class="postinfo"><strong title="ID:2">${(pager.pageNumber-1)*pager.pageSize+list_index + 1}<sup>#</sup></strong> 
	  发表于 ${list.createDate?string("yyyy-MM-dd HH:mm:ss")}&nbsp;
		
	  </div>
      <div class="postcontent">
	  
      <div id="content_${list_index + 1}" class="contentmsg">${list.content}</div>

  </div></td></tr>
  <tr>
    <td class="postfooter">
      <div class="postactions"><p>
		<!-- 
	     <a href="#">回复</a>&nbsp;&nbsp;

	  	 <a href="javascript:doQuote('1','Fingerstyle','2013-02-22 01:06');">引用</a>&nbsp;&nbsp;
		 <a href="javascript:doReport('2');">举报</a>&nbsp;&nbsp;
		 -->
	     <span title="顶部" class="scrolltop" onclick="scroll(0,0)">TOP</span> </p></div></td></tr></tbody></table></div>
	     </#list>
	     <div class="pages_btns">
	     	     			<link href="${base}/template/shop/css/pager.css" rel="stylesheet" type="text/css" />
							<#import "/WEB-INF/template/shop/pager.ftl" as p>
         					<@p.pager pager = pager baseUrl = "/shop/activity!detail.action?id=${activity.id}" />
	     </div>
	     <div class="blank"></div>
	     	<div class="pages_btns">
	     	<div class="pages">
	     		<a href="activity!list.action" class="next"> ‹‹ 返回活动列表</a>
	     	</div>

	<span class="postbtn" id="newtopic" >
<a href="activity!add.action"><img src="${base}/template/shop/images/ejforum/newtopic.gif" border="0"></a></span>
	</div>
		<div class="blank"></div>
		<form id="inputForm" class="validate" action="activity!saveReply.action" method="post" enctype="multipart/form-data" >
			<input type="hidden" name="activity.id" value="${activity.id}" />
					<table class="listTable">
				<tr>
					<th>
						用户名:
					</th>
					<td>
						<span id="loginMemberUsername"></span>
					</td>
				</tr>
				<tr>
					<th>
						回复内容:
					</th>
					<td>
						<textarea class="ckeditor" cols="80" id="replyContent" name="activityReply.content" rows="10"  >
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
		<#include "/WEB-INF/template/shop/friend_link.ftl">
	</div>
	<div class="blank"></div>
	<#include "/WEB-INF/template/shop/footer.ftl">
</body>
</html>