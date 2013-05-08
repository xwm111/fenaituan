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
<style type="text/css" >
TABLE {
	BORDER-COLLAPSE: collapse; empty-cells: show
}
.mainbox {
	BORDER: #ddd 1px solid; PADDING: 1px; BACKGROUND: #fff; MARGIN-BOTTOM: 10px
}
.mainbox H1 {
	PADDING-LEFT: 1em; BACKGROUND: url(${base}/template/shop/images/ejforum/header_bg.gif) repeat-x 0px 0px; COLOR: #fff; LINE-HEIGHT: 30px
}
.mainbox H3 {
	PADDING-LEFT: 1em; BACKGROUND: url(${base}/template/shop/images/ejforum/header_bg.gif) repeat-x 0px 0px; COLOR: #fff; LINE-HEIGHT: 29px; padding-bottom:1px
}
.mainbox H1 A {
	COLOR: #fff
}
.mainbox H3 A {
	COLOR: #fff; height:27px; margin-top: 1px; margin-bottom:1px
}
.mainbox TABLE {
	WIDTH: 100%
}
.mainbox THEAD TH {
	PADDING-RIGHT: 5px; PADDING-LEFT: 5px; BACKGROUND: #f5f5f5; PADDING-BOTTOM: 2px; COLOR: #666; LINE-HEIGHT: 22px; PADDING-TOP: 2px
}
.mainbox THEAD TD {
	PADDING-RIGHT: 5px; PADDING-LEFT: 5px; BACKGROUND: #f5f5f5; PADDING-BOTTOM: 2px; COLOR: #666; LINE-HEIGHT: 22px; PADDING-TOP: 2px
}
.mainbox THEAD.category TH {
	BACKGROUND: url(${base}/template/shop/images/ejforum/cat_bg.gif) #f5f5f5; padding-bottom:0px
}
.mainbox THEAD.category TD {
	BACKGROUND: url(${base}/template/shop/images/ejforum/cat_bg.gif) #f5f5f5; padding-bottom:0px
}
.mainbox THEAD.separation TD {
	BORDER-TOP: #ddd 1px solid; padding-bottom:1px
}
.mainbox TBODY TH {
	PADDING: 5px; BORDER-TOP: #ddd 1px solid
}
.mainbox TBODY TD {
	PADDING: 5px; BORDER-TOP: #ddd 1px solid
}
.mainbox TBODY CITE {
	LINE-HEIGHT: 1.3em
}
.mainbox TBODY EM {
	LINE-HEIGHT: 1.3em
}
.mainbox TBODY.info TD {
	color:#000; border: none; padding-left:36px; padding-bottom:6px
}
.mainbox TBODY.info TD.subject {
	BACKGROUND: url(${base}/template/shop/images/ejforum/box_bg.gif) #f5f5f5; color:#090; padding-left:10px; padding-top:6px; padding-bottom:0px
}
.headactions {
	PADDING-RIGHT: 10px; PADDING-LEFT: 0px; FLOAT: right; PADDING-BOTTOM: 0px; LINE-HEIGHT: 1em; PADDING-TOP: 10px
}
.popmenu_popup {
BORDER: #ddd 1px solid;
PADDING: 10px;
BACKGROUND: url(${base}/template/shop/images/ejforum/box_bg.gif) #fff repeat-x 0px 0px;
OVERFLOW: hidden;
LINE-HEIGHT: 1.4em;
TEXT-ALIGN: left;
}
</style>
</head>
<body class="memberCenter">
	<#include "/WEB-INF/template/shop/header.ftl">
	<SCRIPT src="${base}/template/shop/js/ejforum/common.js" type=text/javascript></SCRIPT>
<SCRIPT src="${base}/template/shop/js/ejforum/member.js" type=text/javascript></SCRIPT>
	<div class="body memberCenterIndex">
		<div  >
			<div class="memberCenterDetail">
				<div >
					<div class="blank"></div>
<DIV class="mainbox formbox"><SPAN class=headactions>
<A class=notabs href="./help/credits_rule.jsp" target=_blank>查看积分策略说明</A></SPAN> 
<H1 style="BACKGROUND: url(${base}/template/shop/images/header_bg.gif) repeat-x 0px 0px;">标题</H1>
<TABLE id=post_tb cellSpacing=0 cellPadding=0>
  <TBODY>
  <TR>
    <TH style="width:168px">用户名</TH>
    <TD>用户名
	</TD></TR></TBODY>
  <TBODY>
  <TR>
    <TH style="BORDER-BOTTOM-WIDTH: 0px"><LABEL for=subject>标题</LABEL></TH>
    <TD style="BORDER-BOTTOM-WIDTH: 0px"> 
		<INPUT id=subject tabIndex=2 size=50 name=subject value="">
		<em class="tips">&nbsp;(可选)</em>
	</TD></TR>
  <TBODY>
  <TR>
    <TH valign=top><LABEL for=htmleditor_content>内容</LABEL>
      <DIV id=smilieslist>
	  <h4><span>表情符号</span></h4>
	  <#include "/WEB-INF/template/shop/include/smiles.html" > 
	  </DIV>
	</TH>
    <TD valign=top style="padding-top:5px;padding-right:4px;padding-bottom:2px">
      <DIV id="htmleditor">
      <TABLE class="listTable" id=editor_tb cellSpacing=0 cellPadding=0 style="table-layout:fixed">
        <TBODY>
        <TR>
          <TD class=editortoolbar id=htmleditor_controls>
            <TABLE cellSpacing=0 cellPadding=0>
              <TBODY>
              <TR>
                <TD><A id=htmleditor_cmd_bold><IMG title=粗体 alt=B src="${base}/template/shop/images/editor/bb_bold.gif"></A></TD>
                <TD><A id=htmleditor_cmd_italic><IMG title=斜体 alt=I src="${base}/template/shop/images/editor/bb_italic.gif"></A></TD>
                <TD><A id=htmleditor_cmd_underline><IMG title=下划线 alt=U src="${base}/template/shop/images/editor/bb_underline.gif"></A></TD>
                <TD><IMG alt=| src="${base}/template/shop/images/editor/bb_separator.gif"></TD>
                <TD><A id=htmleditor_popup_fontname title=字体><SPAN 
                  class="dropmenu dropbutton" id=htmleditor_font_out style="DISPLAY: block; WIDTH: 110px">字体</SPAN> 
                  </A></TD>
                <TD><A id=htmleditor_popup_fontsize title=大小><SPAN 
                  class="dropmenu dropbutton" id=htmleditor_size_out style="DISPLAY: block; WIDTH: 30px">大小</SPAN> </A></TD>
                <TD><A id=htmleditor_popup_forecolor title=颜色><SPAN 
                  class=dropmenu style="DISPLAY: block; WIDTH: 30px"><IMG 
                  height=16 src="${base}/template/shop/images/editor/bb_color.gif" width=21><BR><IMG id=htmleditor_color_bar 
                  style="BACKGROUND-COLOR: black" height=4 src="${base}/template/shop/images/editor/bb_clear.gif" width=21></SPAN> </A></TD>
                <TD><IMG alt=| src="${base}/template/shop/images/editor/bb_separator.gif"></TD>
                <TD><A id=htmleditor_cmd_justifyleft><IMG title=居左 alt="Align Left" src="${base}/template/shop/images/editor/bb_left.gif"></A></TD>
                <TD><A id=htmleditor_cmd_justifycenter><IMG title=居中 alt="Align Center" 
						src="${base}/template/shop/images/editor/bb_center.gif"></A></TD>
                <TD><A id=htmleditor_cmd_justifyright><IMG title=居右 alt="Align Right" src="${base}/template/shop/images/editor/bb_right.gif"></A></TD>
                <TD><IMG alt=| src="${base}/template/shop/images/editor/bb_separator.gif"></TD>
                <TD><A id=htmleditor_cmd_url><IMG title=插入链接 alt=Url src="${base}/template/shop/images/editor/bb_url.gif"></A></TD>
                <TD><A id=htmleditor_cmd_img><IMG title=插入图片 alt=Image src="${base}/template/shop/images/editor/bb_image.gif"></A></TD>
                <TD><A id=htmleditor_cmd_media><IMG title=插入媒体 alt=Media src="${base}/template/shop/images/editor/bb_media.gif"></A></TD>
                <TD><IMG alt=| src="${base}/template/shop/images/editor/bb_separator.gif"></TD>
                <TD><A id=htmleditor_cmd_quote><IMG title=插入引用 alt=Quote src="${base}/template/shop/images/editor/bb_quote.gif"></A></TD>
                <TD><A id=htmleditor_cmd_code><IMG title=插入代码 alt=Quote src="${base}/template/shop/images/editor/bb_code.gif"></A></TD>
                </TR></TBODY></TABLE>
            <DIV class=editor_switcher_bar id=htmleditor_switcher>
			<BUTTON id=htmlmode type="button" class="editor_switcher">HTML 代码模式</BUTTON>
			<BUTTON id=wysiwygmode type="button">可视化编辑模式</BUTTON></DIV></TD></TR>
        <TR>
          <TD class=editortoolbar>
          	<#include "/WEB-INF/template/shop/include/fonts.html" >
          	<#include "/WEB-INF/template/shop/include/colors.html" >
		 </TD></TR></TBODY></TABLE>
      <TABLE class=editor_text_tb id=editor_panel cellSpacing=0 cellPadding=0 style="table-layout:fixed">
        <TBODY>
        <TR>
          <TD style="padding-right:5px"><TEXTAREA class=forumeditor id=htmleditor_content tabIndex=5 
		  				style="WIDTH: 100%; HEIGHT: 250px;" name="content" rows=10 cols=60>
			  内容
			 </TEXTAREA> 
          </TD></TR></TBODY></TABLE>
      <TABLE class=editor_button_tb cellSpacing=0 cellPadding=0 style="table-layout:fixed">
        <TBODY>
        <TR>
          <TD style="BORDER-TOP-STYLE: none">
            <DIV>
			<IMG id=htmleditor_contract title=收缩编辑框 alt=收缩编辑框 
				src="${base}/template/shop/images/editor/bb_contract.gif"><IMG id=htmleditor_expand title=扩展编辑框 alt=扩展编辑框 
				src="${base}/template/shop/images/editor/bb_expand.gif"> 
			</DIV></TD>
          <TD style="BORDER-TOP-STYLE: none" align=right> <BUTTON id=clearctx type="button">清空内容</BUTTON> </TD>
		  </TR></TBODY></TABLE>
      </DIV></TD></TR>
  <TBODY>
  <TR>
    <TH><LABEL for=verifycode>验证码</LABEL></TH>
    <TD>
      <DIV id=verifycodeimage style="margin-bottom:3px"></DIV>
	  <INPUT id=verifycode tabIndex=8 maxLength=4 size=15>
	  <SPAN id=checkverifycode></SPAN></TD>
  </TR>
  <TR class=btns>
    <TH>&nbsp;</TH>
    <TD height="50">
	<table cellSpacing=0 cellPadding=0 border=0><tr>
	<td style="padding-left:0px;">
		<BUTTON id="postbtn" tabIndex=9 name="huifu" type=submit>回复</BUTTON>
		<SPAN id=postmsg style="color:#009900;vertical-align:bottom"></SPAN></td>
	<td align="right"><em>当您离开本页面时，表格的数据会被自动保存在缓存中</em>&nbsp;&nbsp;
	 	<a href="###" 
		   onclick="if (confirm('此操作将覆盖当前帖子内容，确定要恢复数据吗？')) loadData();">恢复上次自动保存的数据</a> </td>
	</tr></table>
    </TD></TR></TBODY></TABLE></DIV>
					<div class="blank"></div>
				</div>
				<div ></div>
			</div>
		</div>
		<div class="blank"></div>
		<#include "/WEB-INF/template/shop/friend_link.ftl">
	</div>
	<div class="blank"></div>
	<#include "/WEB-INF/template/shop/footer.ftl">
	<SCRIPT type=text/javascript>

var wysiwyg = 1;
var allowimg = 1;
var allowmedia = 1;
var allowhtml = 0;
var maxAttachNum = 2;
var encoding = 'GBK';
var forumcss = '${base}/template/shop/css/ejforum.css';
var editorcss = '${base}/template/shop/css/ejf_editor.css';
var textobj = $('htmleditor_content');

msgs['attach_ext_invalid']	= '对不起，不支持上传此类扩展名的附件。';
msgs['attach_deletelink']	= '删除';
msgs['attach_insert']	= '插入帖内';
msgs['too_many_attach']	= '您最多只能上传 <%= maxAttachNum %> 个附件。';
msgs['enter_quote_title'] 	= '请输入要插入的引用文字:';
msgs['enter_code_title'] 	= '请输入要插入的代码:';
msgs['enter_url_link']		= "请输入链接的地址:";
msgs['enter_url_title']		= "请输入链接的文字(可选):";
msgs['enter_img_link']		= "请输入图片链接地址:";
msgs['enter_img_title']		= "请输入图片描述文字(可选):";
msgs['enter_media_link']	= "请输入多媒体源文件地址(swf,mp3,wma,wmv 等):";
msgs['enter_media_title']	= "请输入多媒体显示尺寸(可选,宽,高, 比如: 80,40):";
msgs['quote']				= "引用";
msgs['submit']				= "提交";
msgs['cancel']				= "取消";
msgs['posting']				= "正在提交数据，请稍候...";
</SCRIPT>
<SCRIPT src="${base}/template/shop/js/ejforum/editor.js" type=text/javascript></SCRIPT>
<SCRIPT src="${base}/template/shop/js/ejforum/post.js" type=text/javascript></SCRIPT>

<SCRIPT type=text/javascript>
createEditor(wysiwyg);
$('htmleditor_contract').onclick = function() {resizeEditor(-100)};
$('htmleditor_expand').onclick = function() {resizeEditor(100)};
$('clearctx').onclick = function() {clearContent()};
$('postform').onsubmit = function() {checkPost(this); return false;};
window.onbeforeunload = function () { try{saveData();}catch(e){} };
refreshVerifyCode(112,42);
$('subject').focus();
</SCRIPT>
</body>
</html>