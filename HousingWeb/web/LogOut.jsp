<%@ page language="java" contentType="text/html" pageEncoding="UTF-8" errorPage="errorpage.jsp"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html >
<html>
    <head>
        <link rel="icon" href="images/favicon.ico" type="x-icon">
        <link rel="shortcut icon" href="images/favicon.ico" type="x-icon">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Подтверждение выхода</title>
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
        <h1><fmt:message key="logout.page.leave"/></h1>
        <form method="POST" action="./Control">

            <hr>
            <td>
                <input type="submit" value="<fmt:message key="welcome.page.button"/>" name="exit"> 
                <input type="submit" value="<fmt:message key="page.button.back"/>" name="noexit">
            </td>
        </form>

    </body>
</html>
