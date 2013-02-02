<%-- 
    Document   : workplan
    Created on : 24.01.2013, 11:17:15
    Author     : Alexandr Ivanov
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="table" uri="tlds/table.tld" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
    <head>
        <link rel="icon" href="images/dispatch.ico" type="x-icon">
        <link rel="shortcut icon" href="images/dispatch.ico" type="x-icon">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>План работ</title>
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
        <jsp:useBean id="had" scope="page" class="ua.epam.entitydao.MySQLWorkPlanDAO"/>
        <jsp:useBean id="mydate" scope="page" class="ua.epam.entity.RequestEntity"/>
        <c:set var="wPlans" value="${had.workPlans}"/>

    <center><h2><fmt:message key="workplan.page.plan"/></h2></center>
    <table width="50%" border="3" align="center">
        <%--
            This is sample of custom tag
        --%>
        <tr>
            <td align="center">№</td>
            <td align="center"><fmt:message key="workplan.page.table.response"/></td>
            <td align="center"><fmt:message key="workplan.page.table.perform"/></td>
            <td align="center"><fmt:message key="workplan.page.table.date"/></td>
            <td align="center"><fmt:message key="workplan.page.table.address"/></td>
        </tr>

        <c:choose>
            <c:when test="${not empty wPlans}">
                <c:set var="i" value="0" scope="page"/>
                <c:forEach items="${wPlans}" var="row">
                    <table:row onumber="${i + 1}" 
                               foreman="${row.foreman}"
                               worker="${row.worker}"
                               address="${row.address}"
                               date="${mydate.showDate(row.planDate)}"/>
                </c:forEach>       
            </c:when>
            <c:otherwise>
                <tr>
                    <td><fmt:message key="workplan.page.table.empty"/></td>
                </tr>
            </c:otherwise>
        </c:choose>

    </table>

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
