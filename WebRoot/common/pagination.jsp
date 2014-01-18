<%@include file="/common/Header.inc"%>
<%@ page contentType="text/html;charset=UTF-8" %>
  <head>
    <title>分页页面</title>
  </head>
  <body>
    <p>
		<c:if test="${fn:length(request.pageList) > 0}">
			<c:if test="${request.paginationBean.currentPage == 1}">
				<a class="ofGray">上一页</a>
			</c:if>
			<c:if test="${request.paginationBean.currentPage > 1}">
				<a href="javascript:paginate(parseInt('${request.paginationBean.currentPage}') - 1);">上一页</a>
			</c:if>
					${request.paginationBean.currentPage }/${request.paginationBean.totalPages }
				<c:if test="${request.paginationBean.currentPage == request.paginationBean.totalPages}">
					<a class="ofGray">下一页</a>
				</c:if>
				<c:if test="${request.paginationBean.currentPage < request.paginationBean.totalPages}">
					<a href="javascript:paginate(parseInt('${request.paginationBean.currentPage}') + 1);">下一页</a>
				</c:if>
					共${request.paginationBean.totalRows }条记录
    		</c:if>
    	</p>
  </body>
<%@include file="/common/Footer.inc"%>
