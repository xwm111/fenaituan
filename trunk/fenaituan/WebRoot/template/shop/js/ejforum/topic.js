/*
	[EasyJForum] (C)2007 Hongshee Soft.
	$file: topic.js $
	$Date: 2008/1/31 $
*/

function replyTopic() 
{
	if (isClosed)
	{
		alert('�������Ѿ��رգ����ܼ�������  ');
		return;
	}	
	$('frmpost').action = replyUrl + "&act=reply";
	$('frmpost').subject.value = "";
	$('frmpost').content.value = "";
	$('frmpost').submit();
}

function doReply(seqno, nickname) 
{
	if (isClosed)
	{
		alert('�������Ѿ��رգ����ܼ�������  ');
		return;
	}	
	$('frmpost').action = replyUrl + "&act=reply";
	$('frmpost').subject.value = "Re: �ظ� " + seqno + "# " + nickname + " ������";
	$('frmpost').content.value = "";
	$('frmpost').submit();
}
function doQuote(seqno, nickname, createtime) 
{
	if (isClosed)
	{
		alert('�������Ѿ��رգ����ܼ�������  ');
		return;
	}	
	var content = $('content_' + seqno).innerHTML;
	if (content.length > 5000)
		content = '<I>��������̫����ʡ��...</I>';
	$('frmpost').action = replyUrl + "&act=reply";
	$('frmpost').subject.value = "";
	$('frmpost').content.value = "<BR/><div class='quote'><h5>����:</h5><blockquote>" + content 
						  	   + "<P class='quotefooter'>--- ԭ�����: " + seqno + "#,&nbsp; �� <I>" + nickname 
							   + "</I> �� " + createtime + " &nbsp;����</P></blockquote></div><BR/>";
	$('frmpost').submit();
}

function doReport(replyId)
{
	$('frmpost').action = reportUrl + "&rid=" + replyId;
	$('frmpost').subject.value = "";
	$('frmpost').content.value = "";
	$('frmpost').submit();
}