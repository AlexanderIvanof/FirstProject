<%-- 
    Document   : locale
    Created on : 23.01.2013, 17:31:02
    Author     : Alexandr Ivanov
--%>

<%@page import="java.util.Locale, java.util.ResourceBundle"%>
<%@page contentType="text/html" pageEncoding="UTF-8" errorPage="errorpage.jsp"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Выбор языка</title>
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
        <table border="0">
            <tr>
                <td></td>
                <td></td>

                <td align="right">
                    <fmt:formatDate type="time" value="${curTime}" timeStyle="short"/>
                    <fmt:formatDate value="${curTime}" dateStyle="full"/>
                </td>
            </tr>
        </table>
        <form action="./Control" method="POST">
            <table align="center">
                <tr>
                    <td><fmt:message key="locale.page.choose"/></td>
                    <td><input type="image" src="images/flag_GB.jpg" name="lang" value="GB"/></td>
                    <td><input type="image" src="images/flag_ru.gif" name="lang" value="RU"/></td>
                </tr>
            </table>
        </form>
    </body>
</html>
