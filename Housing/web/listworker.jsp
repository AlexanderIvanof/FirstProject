<%-- 
    Document   : listworker
    Created on : 24.01.2013, 11:16:10
    Author     : Alexandr Ivanov
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
    <head>
        <link rel="icon" href="images/dispatch.ico" type="x-icon">
        <link rel="shortcut icon" href="images/dispatch.ico" type="x-icon">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Список работников</title>
    </head>
    <jsp:useBean id="had" scope="page" class="ua.epam.entitydao.MySQLWorkerDAO"/>
    <c:set var="workers" value="${had.allWorkers}"/>

    <body bgcolor="#F0FFFF">
        <c:choose>
            <c:when test="${not empty sessionScope.language}">
                <fmt:setLocale value="${sessionScope.language}"/>
            </c:when>
            <c:otherwise>
                <fmt:setLocale value="ru-RU"/>
            </c:otherwise>
        </c:choose>
        <fmt:setBundle basename="ua.epam.i18n.LanguageBundle"/>

    <center><h2><fmt:message key="listworker.page.list"/></h2></center>
    <table align="center" border="4" width="60%"
           <tr>
            <td align="center" width="5%"><font>ID</font></td>
            <td align="center" width="20%"><font><fmt:message key="listworker.page.table.name"/></font></td>
            <td align="center" width="20%"><font><fmt:message key="listworker.page.table.lastname"/></font></td>
            <td align="center" width="20%"><font><fmt:message key="listworker.page.table.prof"/></font></td>
            <td align="center" width="15%"><font><fmt:message key="listworker.page.table.busy"/></font></td>
        </tr>
        <c:choose>
            <c:when test="${not empty workers}">
                <c:forEach items="${workers}" var="wrkr">
                    <tr>
                        <td align="center">${wrkr.idworker}</td>
                        <td>${wrkr.firstName}</td>
                        <td>${wrkr.lastName}</td>
                        <td>${wrkr.prof}</td>
                        <c:choose>
                            <c:when test="${wrkr.busy}">
                                <td><fmt:message key="listworker.page.busy"/></td>
                            </c:when> 
                            <c:otherwise>
                                <td><fmt:message key="listworker.page.free"/></td>
                            </c:otherwise>
                        </c:choose>
                    </tr>                    
                </c:forEach>
            </c:when>
            <c:otherwise>
                <tr>
                    <td><fmt:message key="listworker.page.table.empty"/></td>
                </tr>
            </c:otherwise>
        </c:choose>

        <table/>
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
