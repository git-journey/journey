<%@include file="/common/jsp/Header.inc"%>
<html>
  <head>
    <title>i'm a test main page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<script type="text/javascript">
		alert("${param.a}");
	</script>
  </head>
  <body>
    This is my JSP page. <br>
  </body>
</html>
