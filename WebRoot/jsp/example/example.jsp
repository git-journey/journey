<%@include file="/common/Header.inc"%>
<%@ page contentType="text/html;charset=UTF-8" %>
  <head>
     <title>样例</title>
  </head>
  <body>
    <div>
    	<ul style="marign:10px auto;">
    		<li style="float:left;border:1px solid #d0d0d0;margin-right:10px;cursor:pointer;"><a href="${request.contextPath }/example/query">查询</a></li>
    	</ul>
    	<div style="clear:both;"></div>
    	<div style="margin:auto;border-left:1px solid #d0d0d0;border-top:1px solid #d0d0d0;border-right:2px solid #d0d0d0;border-bottom:2px solid #d0d0d0;width:226px;margin-bottom:20px;padding:10px 20px;">journey application 演示例子--之保存功能演示</div>
    	<div style="margin:auto;width:320px;border:1px solid #d0d0d0;text-align:center;">
    		<form id="exampleFrm" action="${request.contextPath}/example/save" method="post">
    			样例char类型值：<div><input type="text" id="exampleName1" name="example.exampleName1" style="border:1px solid #d0d0d0;width:254px;padding:4px 2px;"/></div>
    			样例varchar类型值：<div><input id="exampleName2" type="text" name="example.exampleName2" style="border:1px solid #d0d0d0;width:254px;padding:4px 2px;"/></div>
    			样例longtext类型值：<div><input id="exampleName3" type="text" name="example.exampleName3" style="border:1px solid #d0d0d0;width:254px;padding:4px 2px;"/></div>
    			<div>
    				<input id="saveBtn" type="button" style="border:none;padding:2px 8px;cursor:pointer;" value="保存" />
    			</div>
    		</form>
    	</div>
    </div>
  </body>
  <script type="text/javascript">
  	$(function(){
  		$("#saveBtn").click(function(){
  		var exampleName1 = $("#exampleName1").val();
  		var exampleName2 = $("#exampleName2").val();
  		var exampleName3 = $("#exampleName3").val();
  		if(exampleName1 == "" || exampleName1 == null)
  		{
  			alert("请输入样例char类型值");
  			$("#exampleName1").focus();
  			return;
  		}
  		if(exampleName2 == "" || exampleName2 == null)
  		{
  			alert("请输入样例varchar类型值");
  			$("#exampleName2").focus();
  			return;
  		}
  		if(exampleName3 == "" || exampleName3 == null)
  		{
  			alert("请输入样例longtext类型值");
  			$("#exampleName3").focus();
  			return;
  		}
  		$("#exampleFrm").submit();
  		})
  	});
  </script>
<%@include file="/common/Footer.inc"%>
