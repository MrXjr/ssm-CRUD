<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Mrxjr
  Date: 2021/10/5
  Time: 11:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>员工列表</title>
    <%--引入jQuery--%>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-1.12.4.min.js"></script>
    <%--引入bootstrap样式--%>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css">
    <script type="text/javascript"
            src="${pageContext.request.contextPath}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
</head>
<body>

<div class="container">
    <%--标题行--%>
    <div class="row">
        <%--占满12列--%>
        <div class="col-md-12">
            <h1>SSM-CRUD</h1>
        </div>
    </div>
    <%--按钮行--%>
    <div class="row">
        <%--占4列，往右偏移8列，即在最右边--%>
        <div class="col-md-4 col-md-offset-8">
            <button class="btn btn-primary">新增</button>
            <button class="btn btn-danger">删除</button>
        </div>
    </div>
    <%--表格行--%>
    <div class="row">
        <table class="table table-hover">
            <tr>
                <th>#</th>
                <th>empName</th>
                <th>gender</th>
                <th>email</th>
                <th>deptName</th>
                <th>操作</th>
            </tr>
            <%--遍历员工信息--%>
            <c:forEach items="${pageInfo.list}" var="emp">
            <tr>
                <th>${emp.empId}</th>
                <th>${emp.empName}</th>
                <th>${emp.email}</th>
                <th>${emp.gender=="M"?"男":"女"}</th>
                <th>${emp.dept.deptName}</th>
                <th>
                    <button class="btn btn-primary btn-xs">
                        <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
                        编辑
                    </button>
                    <button class="btn btn-danger btn-xs">
                        <span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
                        删除
                    </button>
                </th>
            </tr>
            </c:forEach>
        </table>
    </div>

    <%--分页行--%>
    <div class="row">
        <%--分页信息--%>
        <div class="col-md-6">
            当前 ${pageInfo.pageNum} 页,总 ${pageInfo.pages} 页,总 ${pageInfo.total} 条记录
        </div>
            <%--分页条--%>
        <div class="col-md-6">
            <nav aria-label="Page navigation">
                <ul class="pagination">
                    <c:if test="${!pageInfo.isFirstPage}">
                    <li>
                        <a href="${pageContext.request.contextPath}/emps?pn=1">首页</a>
                    </li>
                    </c:if>
                    <c:if test="${pageInfo.hasPreviousPage}">
                        <%--前一页--%>
                    <li>
                        <a href="${pageContext.request.contextPath}/emps?pn=${pageInfo.prePage}" aria-label="Previous">
                            <span aria-hidden="true">&laquo;</span>
                        </a>
                    </li>
                    </c:if>
                    <%--遍历分页导航--%>
                    <c:forEach items="${pageInfo.navigatepageNums}" var="pageNum">
                        <c:if test="${pageInfo.pageNum==pageNum}">
                        <li class="active"><a href="#">${pageNum}</a></li>
                        </c:if>
                        <c:if test="${pageInfo.pageNum!=pageNum}">
                            <li><a href="${pageContext.request.contextPath}/emps?pn=${pageNum}">${pageNum}</a></li>
                        </c:if>
                    </c:forEach>
                    <%--下一页--%>
                    <c:if test="${pageInfo.hasNextPage}">
                    <li>
                        <a href="${pageContext.request.contextPath}/emps?pn=${pageInfo.nextPage}" aria-label="Next">
                            <span aria-hidden="true">&raquo;</span>
                        </a>
                    </li>
                    </c:if>
                    <c:if test="${!pageInfo.isLastPage}">
                    <li>
                        <a href="${pageContext.request.contextPath}/emps?pn=${pageInfo.pages}">末页</a>
                    </li>
                    </c:if>
                </ul>
            </nav>
        </div>
    </div>
</div>

</body>
</html>
