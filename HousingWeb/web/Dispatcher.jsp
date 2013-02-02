<%-- 
    Document   : Dispatcher
    Created on : 23.01.2013, 12:15:20
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
        <title>Диспетчер</title>
    </head>
    <body bgcolor="#F0FFFF">
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
    <center><h1><fmt:message key="dispatcher.welcome"/></h1></center>
    <table border="2" align="center">
        <tr>
            <td align="center"><a href="listworker.jsp"><fmt:message key="dispatcher.list.worker"/></a></td>
            <td align="center"><a href="workplan.jsp"><fmt:message key="dispatcher.list.workplan"/></a></td>
            <td align="center"><a href="listrequest.jsp"><fmt:message key="dispatcher.list.request"/></a></td>
        </tr>
    </table>
    <p align="right">
        <font size="3"><fmt:message key="dispatcher.exit"/></font>
        <input type="button" value="<fmt:message key="dispatcher.button"/>" name="btLogin" onClick="showLoginHtm()">
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
