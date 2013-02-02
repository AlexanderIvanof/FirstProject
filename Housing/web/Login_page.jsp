<%-- 
    Document   : Login_page
    Created on : 24.01.2013, 11:30:00
    Author     : Alexandr Ivanov
--%>

<%@ page language="java" contentType="text/html" pageEncoding="UTF-8" errorPage="errorpage.jsp"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
    <head>
        <link rel="icon" href="images/favicon.ico" type="x-icon">
        <link rel="shortcut icon" href="images/favicon.ico" type="x-icon">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ЖЕК №81</title>
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
        <form name="auth" action="WauthUser.do" method="POST">
            <p align="center"></p>

            <table>
                <tr>

                <hr>
                <table border="0" width="100%" height="42">
                    <tr>
                        <td width="60%" height="36"><b><font face="monospace" size="5"><i><fmt:message key="login.page.welcome"/></i> </font> </b>
                        </td>
                        <td width="40%" height="36"></td>
                    </tr>
                    <tr>
                        <td width="60%" height="36"><b><font face="monospace" size="5"><i><fmt:message key="login.page.continue"/></i> </font> </b>
                        </td>
                        <td width="40%" height="36"></td>
                    </tr>
                </table>
                <p align="left">
                    <c:set var="massage" value="${requestScope.ErrorMessage}"/>
                    <b><font size="4" color="red">${massage}</b></font><br></br>

                </p>
                <jsp:include page="WhatsNew.jsp" flush="true"/>
                <p></p>
                <table border="0">
                    <tr>
                        <td align="right">
                            <font face="monospace"><b><fmt:message key="login.page.username"/></b></font>
                        </td>
                        <td>
                            <input type="text" name="txtUserName" size="20">
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            <font face="monospace"><b><fmt:message key="login.page.password"/></b></font>
                        </td>
                        <td>
                            <input type="password" name="txtUsrPwd" size="20">
                        </td>
                    </tr>
                    <tr align="left">
                        <td></td>
                        <td align="right">
                            <input type="submit" value="<fmt:message key="login.page.button.ok"/>" name="login">&nbsp;
                            <input type="reset" value="<fmt:message key="login.page.button.cancel"/>"/>
                        </td>
                    </tr>
                </table>
        </form>
    </body>
</html>
