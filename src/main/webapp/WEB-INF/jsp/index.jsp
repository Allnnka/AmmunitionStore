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
        <span>Ammunition Store</span>
    </nav>
    <div class="container">
        <div class="ammunition-table">
            <table>
                <c:forEach  var="amm" items="${ammunitionList}">
                    <tr>
                        <td><c:out value="${amm.type}"/></td>
                        <td><c:out value="${amm.amount}"/></td>
                    </tr>
                </c:forEach>
            </table>

        </div>
        <div class="ammunition-form-div">
            <div class="ammunition-form-title">
                Dodaj/Usuń pociski z magazynu
            </div>
            <%--@elvariable id="ammunitionform" type="com.allnnka.model.Ammunition"--%>
            <form:form class="ammunition-form" action="/" modelAttribute="ammunitionform" method="POST" acceptCharset="UTF-8">
                <div>
                    <form:label path="type" class="control-label required">Typ pocisku <span class="text-danger"> *</span></form:label>
                    <form:input type="text" class="form-control" name="type" path="type"/>
                    <form:errors path="type"  cssClass="text-danger"/><br><br>
                </div>
                <div>
                    <form:label path="amount" class="control-label required">Ilość<span class="text-danger"> *</span></form:label>
                    <form:input type="number" class="form-control"  path="amount"/>
                    <form:errors path="amount" cssClass="text-danger"/><br><br>
                </div>

                <form:button type="submit" name="add" class="add-btn">Dodaj</form:button>
                <form:button type="submit" name="delete" class="delete-btn">Usuń</form:button>
            </form:form>
        </div>
    </div>
</body>

</html>
