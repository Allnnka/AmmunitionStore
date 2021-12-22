<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Ammunition Store</title>
    <meta charset="UTF-8">
    <link href="css/index.css" rel="stylesheet">
</head>

<body>
    <nav>
        <h2>Ammunition Store</h2>
    </nav>
    <div class="container">
        <div class="ammunition-table">
            <ul class="responsive-table">
                <li class="table-header">
                    <div class="col col-1">Typ</div>
                    <div class="col col-2">Ilość</div>
                    <div class="col col-3"></div>
                </li>
                <c:forEach  var="amm" items="${ammunitionList}">
                    <li class="table-row">
                        <div class="col col-1"><c:out value="${amm.type}"/></div>
                        <div class="col col-2"><c:out value="${amm.amount}"/></div>
                        <div class="col col-3">
                            <c:set var="pbWidth" value="${amm.amount/maxAmount*100}"/>
                            <c:set var="pgColor" value="white"/>
                            <c:choose>
                                <c:when test="${amm.amount<100}">
                                    <c:set var="pgColor" value="red"/>
                                </c:when>
                                <c:when test="${amm.amount>100 && amm.amount<1000}">
                                    <c:set var="pgColor" value="yellow"/>
                                </c:when>
                                <c:otherwise>
                                    <c:set var="pgColor" value="green"/>
                                </c:otherwise>
                            </c:choose>

                            <div class="progress" style="width:${pbWidth}%;background-color: ${pgColor}; height: 30px">

                            </div>
                        </div>
                    </li>
                </c:forEach>
            </ul>
        </div>
        <div class="ammunition-form-div">
            <div class="ammunition-form-title">
                Dodaj/Usuń pociski z magazynu
            </div>
            <%--@elvariable id="ammunitionform" type="com.allnnka.model.Ammunition"--%>
            <form:form class="ammunition-form" action="/" modelAttribute="ammunitionform" method="POST" acceptCharset="UTF-8">
                <div>
                    <form:label path="type" class="control-label required">Typ pocisku <span class="text-danger"> *</span></form:label>
                    <form:input list="typeList" type="text" class="form-control" name="type" path="type"/>
                    <datalist id="typeList">
                        <c:forEach var="ammType" items="${ammunitionType}">
                            <option value="${ammType}"></option>
                        </c:forEach>
                    </datalist>
                    <form:errors path="type"  cssClass="text-danger"/><br><br>
                </div>
                <div>
                    <form:label path="amount" class="control-label required">Ilość<span class="text-danger"> *</span></form:label>
                    <form:input type="number" class="form-control"  path="amount"/>
                    <form:errors path="amount" cssClass="text-danger"/><br><br>
                    <span class="text-danger">${exceptionMsg}</span>
                </div>

                <form:button type="submit" name="add" class="add-btn">Dodaj</form:button>
                <form:button type="submit" name="delete" class="delete-btn">Usuń</form:button>
            </form:form>
        </div>
    </div>
</body>

</html>
