<%-- 
    Document   : listrequest
    Created on : 24.01.2013, 16:19:33
    Author     : Alexandr Ivanov
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" errorPage="errorpage.jsp"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="icon" href="images/dispatch.ico" type="x-icon">
        <link rel="shortcut icon" href="images/dispatch.ico" type="x-icon">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Необработанные заявки</title>
    </head>
    <body bgcolor="#F0FFFF">
        <c:choose>
            <c:when test="${not empty sessionScope.language}">
                <fmt:setLocale value="${sessionScope.language}"/>
            </c:when>
            <c:otherwise>
                <fmt:setLocale value="ru_RU"/>
            </c:otherwise>
        </c:choose>
        <fmt:setBundle basename="ua.epam.i18n.LanguageBundle"/>
    <center><h2><fmt:message key="listrequest.page.name"/></h2></center>
    <jsp:useBean id="list" scope="page" class="ua.epam.entitydao.MySQLRequestEntityDAO"/>
    <jsp:useBean id="date" scope="page" class="ua.epam.entity.RequestEntity"/>
    <c:set var="requests" value="${list.allRequests}"/>

    <table align="center" border="2" width="60%"
           <tr>
            <td align="center" width="15%"><font><fmt:message key="listrequest.page.table.number"/></font></td>
            <td align="center" width="25%"><font><fmt:message key="listrequest.page.table.address"/></font></td>
            <td align="center" width="15%"><font><fmt:message key="listrequest.page.table.requdate"/></font></td>
            <td align="center" width="20%"><font><fmt:message key="listrequest.page.table.name"/></font></td>
            <td align="center" width="15%"><font><fmt:message key="listrequest.page.table.workdate"/></font></td>
            <td align="center" width="10%"><font><fmt:message key="listrequest.page.table.edit"/></font></td>
        </tr>
        <c:choose>
            <c:when test="${not empty requests}">
                <c:set var="num" value="WAIT_APPROVE" scope="page"/>
                <c:forEach items="${requests}" var="requ">
                    <c:if test="${requ.approve eq num}">
                        <tr>
                            <td align="center">${requ.idRequest}</td>
                            <td>${requ.user.address}</td>
                            <td>${date.showDate(requ.requestDate)}</td>
                            <td>${requ.typeWork.name}</td>
                            <td>${date.showDate(requ.orderFullfillment)}</td>
                            <td><a href="EditRequest.jsp?idRequest=${requ.idRequest}"><fmt:message key="listrequest.page.table.edit"/></a></td>
                        </tr>
                    </c:if>
                </c:forEach>
            </c:when>
            <c:otherwise>
                <tr>
                    <td><fmt:message key="listrequest.page.table.empty"/></td>
                </tr>
            </c:otherwise>
        </c:choose>
        <table width="100%" border="0">
            <tr align="right">
                <td>
                    <input type="button" value="<fmt:message key="page.button.back"/>" onclick="goBack()"/>
                </td>
            </tr>
        </table>        
        <script language="JavaScript">
            function goBack()
            {
                window.history.back();
            }
        </script>
    </body>
</html>
