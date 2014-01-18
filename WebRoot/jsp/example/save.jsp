<%@include file="/common/Header.inc"%>
<%@ page language="java" pageEncoding="UTF-8"%>
  <head>
    <base href="<%=basePath%>">
    <title>保存成功页面</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
  </head>
  
  <body>
  	<div style="margin:auto;border-left:1px solid #d0d0d0;border-top:1px solid #d0d0d0;border-right:2px solid #d0d0d0;border-bottom:2px solid #d0d0d0;width:226px;margin-bottom:20px;padding:10px 20px;">journey application 演示例子--之保存成功功能演示</div>
    <div style="margin:auto;width:320px;border:1px solid #d0d0d0;text-align:center;">
    	样例int类型值：<div><input type="text" id="exampleName1" name="example.exampleName1" style="border:1px solid #d0d0d0;width:254px;padding:4px 2px;" value="${example.exampleId }"/></div>
    	样例char类型值：<div><input type="text" id="exampleName1" name="example.exampleName1" style="border:1px solid #d0d0d0;width:254px;padding:4px 2px;" value="${example.exampleName1 }"/></div>
    	样例varchar类型值：<div><input id="exampleName2" type="text" name="example.exampleName2" style="border:1px solid #d0d0d0;width:254px;padding:4px 2px;" value="${example.exampleName2 }"/></div>
    	样例longtext类型值：<div><input id="exampleName3" type="text" name="example.exampleName3" style="border:1px solid #d0d0d0;width:254px;padding:4px 2px;" value="${example.exampleName3 }"/></div>
    	样例date类型值：<div><input id="exampleName3" type="text" name="example.exampleName3" style="border:1px solid #d0d0d0;width:254px;padding:4px 2px;" value='<fmt:formatDate value="${example.exampleName4 }" pattern="yyyy-MM-dd HH:mm" />'/></div>
    	<div><a style="margin-right:10px;" href="${request.contextPath }/example/main">返回</a><a style="margin-right:10px;" href="${request.contextPath }/example/query">查询</a></div>
    </div>
  </body>
<%@include file="/common/Footer.inc"%>
