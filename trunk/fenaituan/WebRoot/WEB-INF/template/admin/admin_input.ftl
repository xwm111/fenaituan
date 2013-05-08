<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>添加/编辑管理员 - Powered By ${systemConfig.systemName}</title>
<meta name="Author" content="SHOP++ Team" />
<meta name="Copyright" content="SHOP++" />
<link rel="icon" href="favicon.ico" type="image/x-icon" />
<#include "/WEB-INF/template/common/include.ftl">
<link href="${base}/template/admin/css/input.css" rel="stylesheet" type="text/css" />
<SCRIPT type="text/javascript" >
		var setting = {
			edit: {
				drag: {
					autoExpandTrigger: false
				},
				enable: true,
				showRemoveBtn: false,
				showRenameBtn: false
			},
			data: {
				simpleData: {
					enable: true
				}
			} ,
			callback: {
				beforeDrag: beforeDrag,
				beforeDrop: beforeDrop,
				onDrop:onDrop
			},
			view: {
				fontCss: getFontCss
			}
		};
		var setting2 = {
				edit: {
					drag: {
						autoExpandTrigger: true,
						isMove:false
					},
					enable: true,
					showRemoveBtn: true,
					showRenameBtn: false
				},
				data: {
					simpleData: {
						enable: true
					}
				}  ,
				callback: {
					beforeDrag: function(){return false;}
				}
			};
		var zNodes=${regionAll}
		var zNodes1=${regionCur}
		//var zNodes2=<%=request.getAttribute("recipientJsonList") %>
		
		function beforeDrag(treeId, treeNodes) {
			for (var i=0,l=treeNodes.length; i<l; i++) {
				if (treeNodes[i].drag === false) {
					return false;
				}
			}
			return true;
		}
		function beforeDrop(treeId, treeNodes, targetNode, moveType) {
			var treeObj = $.fn.zTree.getZTreeObj("treeDemo2");
			//treeNodes = treeObj.addNodes(null, treeNodes);
			var tree2Nodes=treeObj.getNodes();
			for (var i=0,l=treeNodes.length; i<l; i++) {
				var flag=true;
				for(var j=0;j<tree2Nodes.length;j++){
					if(treeNodes[i].id==tree2Nodes[j].id){
						flag=false;
						break;
					}
				}
				if(flag)
					treeObj.copyNode(null, treeNodes[i],"inner",true);
			}
			//treeObj.copyNode(null, treeNodes,"inner",true);
			//console.log(targetNode);
			return false;
			//return targetNode ? targetNode.drop !== false : true;
		}
		function getFontCss(treeId, treeNode) {
			return (!!treeNode.highlight) ? {color:"#A60000", "font-weight":"bold"} : {color:"#333", "font-weight":"normal"};
		}
		
		function onDrop(event, treeId, treeNodes, targetNode, moveType) {
		}
		
		var lastValue = "", nodeList = [];
		
		function searchNode(e) {
			var zTree = getDisplayedTreeObj();
			var value = $.trim(key.get(0).value);
			var keyType = "name";
			if (lastValue === value) return;
			lastValue = value;
			if (value === "") return;
			updateNodes(false);
			nodeList = zTree.getNodesByParamFuzzy(keyType, value);
			updateNodes(true);

		}
		function updateNodes(highlight) {
			var zTree = getDisplayedTreeObj();
			for( var i=0, l=nodeList.length; i<l; i++) {
				nodeList[i].highlight = highlight;
				openAndSortParentNode(nodeList[i]);
				zTree.updateNode(nodeList[i]);
			}
		}
		function openAndSortParentNode(node){
			if(node==null)
				return;
			var pNode=node.getParentNode();
			var treeObj = getDisplayedTreeObj();
			if(pNode==null){
				var nodes = treeObj.getNodes();
				treeObj.moveNode(nodes[0], node, "prev");
			}else{
				treeObj.expandNode(pNode, true, false, false);
				openAndSortParentNode(pNode);
			}
		}
		
		function getDisplayedTreeObj(){
			return $.fn.zTree.getZTreeObj("treeDemo");
		}
		
		$(document).ready(function(){
			$.fn.zTree.init($("#treeDemo"), setting, zNodes);
			$.fn.zTree.init($("#treeDemo2"), setting2, zNodes1);
			
			key = $("#key");
			key.bind("propertychange", searchNode)
			.bind("input", searchNode);
			
        	var idString="";
        	var nameString="";
        	var expandFlag=false;

    		$("#inputForm input[type='submit']").click(function(){
	        	idString="";
	        	nameString="";
    			var treeObj = $.fn.zTree.getZTreeObj("treeDemo2");
    			var treeNodes=treeObj.getNodes();
    			for (var i=0; i<treeNodes.length; i++) {
    				getIdAndName(treeNodes[i]);
    			}
    			
    			$("#regionIds").val(idString);
    		});

			$("#_submit").click(function(){
	        	idString="";
	        	nameString="";
    			var treeObj = $.fn.zTree.getZTreeObj("treeDemo2");
    			//treeNodes = treeObj.addNodes(null, treeNodes);
    			var treeNodes=treeObj.getNodes();
    			//console.log(treeNodes);
    			for (var i=0; i<treeNodes.length; i++) {
    				getIdAndName(treeNodes[i]);
    			}
    			window.returnValue = idString+"|"+nameString;
    			//console.log(idString);
    			//alert("11");
    			window.close();
    			return false;
			});
			
			$("#collapse").click(function(){
				var treeObj = getDisplayedTreeObj();
				treeObj.expandAll(!expandFlag);
				expandFlag=!expandFlag;
			});
			
			$("#region").change(function(){
				//$.fn.zTree.init($("#treeDemo"), setting, zNodes);
				//$.fn.zTree.init($("#treeDemo"), setting, zNodes1);
				var value=$(this).val();
				if(value=="dept"){
					$.fn.zTree.init($("#treeDemo"), setting, zNodes);
				}else{
					$.fn.zTree.init($("#treeDemo"), setting, zNodes1);
				}
			});
			
			function getIdAndName(treeNode){
				if(treeNode==null)
					return;
 				var node=treeNode;
				//console.log(node.type);
				//console.log(node.name);
				//console.log(node.id);
					nameString += node.name + ",";
					idString += node.id + ",";
					
				if(node.children!=null&&node.children.length>0)
					for(var i=0;i<node.children.length;i++){
						getIdAndName(node.children[i]);
					}
				
			}
		});
		</SCRIPT>
<#if !id??>
	<#assign isAdd = true />
<#else>
	<#assign isEdit = true />
</#if>
</head>
<body class="input">
	<div class="body">
		<div class="inputBar">
			<h1><span class="icon">&nbsp;</span><#if isAdd??>添加管理员<#else>编辑管理员</#if></h1>
		</div>
		<form id="inputForm" class="validate" action="<#if isAdd??>admin!save.action<#else>admin!update.action</#if>" method="post">
			<input type="hidden" name="id" value="${id}" />
			<div class="blank"></div>
			<ul class="tab">
				<li>
					<input type="button" value="基本信息" hidefocus="true" />
				</li>
				<li>
					<input type="button" value="个人资料" hidefocus="true" />
				</li>
				<li>
					<input type="button" value="区域设置" hidefocus="true" />
				</li>
			</ul>
			<table class="inputTable tabContent">
				<tr>
					<th>
						用户名:
					</th>
					<td>
						<#if isAdd??>
							<input type="text" name="admin.username" class="formText {required: true, username: true, remote: 'admin!checkUsername.action', minlength: 2, maxlength: 20, messages: {remote: '用户名已存在,请重新输入!'}}" title="用户名只允许包含中文、英文、数字和下划线" />
							<label class="requireField">*</label>
						<#else>
							${(admin.username)!}
							<input type="hidden" name="admin.username" value="${(admin.username)!}" />
						</#if>
					</td>
				</tr>
				<tr>
					<th>
						密 码:
					</th>
					<td>
						<input type="password" name="admin.password" id="password" <#if isAdd??>class="formText {required: true, minlength: 4, maxlength: 20}"<#else>class="formText {minlength: 4, maxlength: 20}"</#if> title="密码长度只允许在4-20之间" />
						<label class="requireField">*</label>
					</td>
				</tr>
				<tr>
					<th>
						重复密码:
					</th>
					<td>
						<input type="password" name="rePassword" class="formText {equalTo: '#password', messages: {equalTo: '两次密码输入不一致!'}}" />
						<#if isAdd??><label class="requireField">*</label></#if>
					</td>
				</tr>
				<tr>
					<th>
						E-mail:
					</th>
					<td>
						<input type="text" name="admin.email" class="formText {required: true, email: true}" value="${(admin.email)!}" />
						<label class="requireField">*</label>
					</td>
				</tr>
				<tr>
					<th>
						管理角色:
					</th>
					<td>
						<#list allRole as list>
							<label>
								<input type="checkbox" name="roleList.id" class="{required: true, messages: {required: '请至少选择一个角色!'}, messagePosition: '#roleMessagePosition'}" value="${list.id}" <#if (admin.roleSet.contains(list) == true)!> checked="checked"</#if> />
								${(list.name)!}
							</label>
						</#list>
						<span id="roleMessagePosition"></span>
						<label class="requireField">*</label>
					</td>
				</tr>
				<tr>
					<th>
						是否启用:
					</th>
					<td>
						<label><input type="radio" name="admin.isAccountEnabled" value="true"<#if (isAdd || admin.isAccountEnabled == true)!> checked</#if> />是</label>
						<label><input type="radio" name="admin.isAccountEnabled" value="false"<#if (admin.isAccountEnabled == false)!> checked</#if> />否</label>
					</td>
				</tr>
				<#if isEdit??>
					<tr>
						<th>&nbsp;</th>
						<td>
							<span class="warnInfo"><span class="icon">&nbsp;</span>如果要修改密码,请填写密码,若留空,密码将保持不变!</span>
						</td>
					</tr>
				</#if>
			</table>
			<table class="inputTable tabContent">
				<tr>
					<th>
						部门:
					</th>
					<td>
						<input type="text" name="admin.department" class="formText" value="${(admin.department)!}" />
					</td>
				</tr>
				<tr>
					<th>
						姓名:
					</th>
					<td>
						<input type="text" name="admin.name" class="formText" value="${(admin.name)!}" />
					</td>
				</tr>
			</table>
			<table class="inputTable tabContent">
			<input type="hidden" id="regionIds" name="regionIds" value="${regionIds}" />
				<tr>
					<td height="28" background="img/tbg.gif" colspan="3">
						<div style="float: left" id="menuname"">
							&nbsp;·
							<b><font color="red">请将所属区域拖入右方栏目中</font></b>
							
						</div>
					</td>
				</tr>
				<tr>
					<td height="28"  colspan="3">
						<div style="float: left" >
							<b>查询：</b>
							<input type="text" id='key' size="40" />
							<input type="button" id="collapse" value="展开/折叠" />
						</div>
					</td>
				</tr>
				<tr>
					<td>
						<div id="deptArea" style="border:1px solid gray;float:left;" >
							<ul id="treeDemo" class="ztree" style="height:300px;overflow: scroll;"></ul>
						</div>
						<div  style="border:1px solid gray;margin-left:50px;float:left">
							<ul id="treeDemo2" class="ztree" style="height:300px;overflow: scroll;"></ul>
						</div>
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