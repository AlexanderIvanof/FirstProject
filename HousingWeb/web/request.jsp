<%-- 
    Document   : request
    Created on : 24.01.2013, 11:18:53
    Author     : Alexandr Ivanov
--%>

<%@page language="java" contentType="text/html" pageEncoding="UTF-8" errorPage="errorpage.jsp"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html >
<html>
    <head>
        <link rel="icon" href="images/favicon.ico" type="x-icon">
        <link rel="shortcut icon" href="images/favicon.ico" type="x-icon">
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Заказ работ</title>
    </head>
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

        <h1><fmt:message key="request.page.order"/></h1>

        <form method="POST" action="./Control">
            <table border="1">

                <tr>
                    
                </tr>
                <tr>
                    <td><fmt:message key="request.page.date"/></td>
                    <td>
                        <input type="date" name="orderDate"></input>
                    </td>
                </tr>
                <tr>
                    <td><fmt:message key="request.page.type"/></td>
                    <td>
                        <select name="workType"><option selected value=0></option>
                        <jsp:useBean id="wtypes" scope="page" class="ua.epam.view.WelcomePageBean"/>
                        <c:set var="works" scope="page" value="${wtypes.allWorkType}"/>
                            <c:forEach items="${works}" var="type">
                                <option value="${type.idWorkType}">${type.name}</option>  
                            </c:forEach>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td><input type="submit" value="<fmt:message key="request.page.button.create"/>" name="create">
                        <input type="reset" value="<fmt:message key="request.page.button.cancel"/>">
                        <input type="submit" value="<fmt:message key="page.button.back"/>" name="back"/></td>
                </tr>
            </table>

        </form>

    </body>
</html>
