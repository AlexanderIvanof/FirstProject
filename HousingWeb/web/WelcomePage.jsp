<%-- 
    Document   : WelcomPage
    Created on : 20.01.2013, 20:20:37
    Author     : Alexandr Ivanov
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
    <head>
        <link rel="icon" href="images/favicon.ico" type="x-icon">
        <link rel="shortcut icon" href="images/favicon.ico" type="x-icon">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Начальная</title>
    </head>
    <body bgproperties="fixed" bgcolor="#F0FFFF">
        <jsp:include page="locale.jsp" flush="true"/>
       <c:choose>
            <c:when test="${not empty sessionScope.language}">
                <fmt:setLocale value="${sessionScope.language}"/>
            </c:when>
            <c:otherwise>
                <fmt:setLocale value="ru-RU"/>
            </c:otherwise>
        </c:choose>
        <fmt:setBundle basename="ua.epam.i18n.LanguageBundle"/>
        <table border="0" align="right">
            <tr>
                <td>
                    <img src="<fmt:message key="welcome.page.flag"/>"/>
                </td>
            </tr>
        </table>

        <h1><fmt:message key="welcome.page.welcome"/></h1>
        <h2>
            <jsp:useBean id="bean" scope="page" class="ua.epam.view.WelcomePageBean"/>
            <c:set target="${bean}" property="username" value="${sessionScope.Principal}"/>
            <c:set var="curuser" value="${bean.user}"/>
            <fmt:message key="welcome.page.loggin"/> <b>${curuser.lastName} ${curuser.firstName}.</b>
        </h2>
        <table border="2" width="100%">
            <tr>
                <td align="center" width="50%">
                    <b><font size="4">
                        <a href="request.jsp"><fmt:message key="welcome.page.create"/></a>
                        </font></b>
                </td>
                <td align="center" width="50%">
                    <b><font size="4">
                        <a href="listuserrequests.jsp"><fmt:message key="welcome.page.show"/></a>
                        </font></b>
                </td>
            </tr>
        </table>

        <p align="right">
            <font size="3"><fmt:message key="welcome.page.exit"/></font>
            <input type="button" value="<fmt:message key="welcome.page.button"/>" name="btLogin" onClick="showLoginHtm()">
        </p>
        <p>&nbsp;</p>
        <script language="JavaScript">
            function showLoginHtm()
            {
                open("LogOut.jsp");
            }
        </script>
    </body>
</html>
