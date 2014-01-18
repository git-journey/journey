<%@include file="/common/Header.inc"%>
<%@ page language="java" pageEncoding="UTF-8"%>
  <head>
    <title>查询实例</title>
  </head>
  <body>
  	<div style="margin:auto;border-left:1px solid #d0d0d0;border-top:1px solid #d0d0d0;border-right:2px solid #d0d0d0;border-bottom:2px solid #d0d0d0;width:226px;margin-bottom:20px;padding:10px 20px;">journey application 演示例子--之查询功能演示</div>
	<table style="margin:auto;border:1px solid #d0d0d0;width:760px;padding:5px 8px;">
    	<colgroup>
			<col width="10%" />
			<col width="16%" />
			<col width="16%" />
			<col width="16%" />
			<col width="16%" />
			<col width="16%" />
		</colgroup>
    	<thead>
    		<tr>
    			<th><strong>序号</strong></th>
    			<th><strong>样例int类型值</strong></th>
    			<th><strong>样例char类型值</strong></th>
    			<th><strong>样例varchar类型值</strong></th>
    			<th><strong>样例longtext类型值</strong></th>
    			<th><strong>样例datetime类型值</strong></th>
    		</tr>
    	</thead>
    	<tbody>
    		<c:if test="${fn:length(request.exampleList) == 0 || request.exampleList == null}">
				<tr>
					<td style="text-align:center;" colspan="6">
						对不起，没有查询到符合条件的记录！
					</td>
				</tr>
			</c:if>
			<c:if test="${fn:length(request.exampleList) > 0}">
			<c:forEach var="example" items="${request.exampleList}" varStatus="status">
					<c:if test="${status.index%2 == 0 }">
						<tr>
					</c:if>
					<c:if test="${status.index%2 != 0 }">
						<tr class="ofEven">
					</c:if>
    				<td>${status.index + 1}</td>
    				<td>${example.exampleId}</td>
    				<td>${example.exampleName1}</td>
    				<td>${example.exampleName2}</td>
    				<td>${example.exampleName3}</td>
    				<td><fmt:formatDate value="${example.exampleName4 }" pattern="yyyy-MM-dd HH:mm" /></td>
    			</tr>
			</c:forEach>
    		</c:if>
    	</tbody>
    </table>
    <div style="margin:10px auto 40px;text-align:right;width:760px;border:1px solid #d0d0d0;">
    	<form id="pageFrm" action="${request.contextPath }/example/query" method="post">
    		<input type="hidden" id="pageSize" name="paginationBean.pageSize" value="${request.paginationBean.pageSize}" />
			<input type="hidden" id="currentPage" name="paginationBean.currentPage" value="${request.paginationBean.currentPage}" />
			<input type="hidden" id="totalPages" name="paginationBean.totalPages" value="${request.paginationBean.totalPages}" />
			<input type="hidden" id="totalRows" name="paginationBean.totalRows" value="${request.paginationBean.totalRows}" />
    	</form>
    	<jsp:include page="/common/pagination.jsp"></jsp:include>
    </div>
  </body>
<%@include file="/common/Footer.inc"%>
