<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
	request.setAttribute("contextPath", basePath);
 %>
<!DOCTYPE>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta http-equiv="PRAGMA" content="NO-CACHE"/>
    <script type="text/javascript" src="${request.contextPath}/js/jquery-1.8.0.min.js"></script>
    <link type="text/css" rel="stylesheet" href="${request.contextPath}/css/main.css" />
    <script type="text/javascript">
  		function paginate(page)
  		{
  			$("#currentPage").attr("value", page);
  			$("#pageFrm").submit();
  		}
    </script>
  </head>