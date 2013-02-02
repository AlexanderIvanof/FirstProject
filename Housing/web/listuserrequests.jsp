<%-- 
    Document   : listuserrequests
    Created on : 20.01.2013, 20:49:58
    Author     : Alexandr Ivanov
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" errorPage="errorpage.jsp"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="icon" href="images/favicon.ico" type="x-icon">
        <link rel="shortcut icon" href="images/favicon.ico" type="x-icon">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Мои заявки</title>
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
    <center> <h1><fmt:message key="listuser.page.list"/></h1></center>

    <jsp:useBean id="bean" scope="page" class="ua.epam.view.WelcomePageBean"/>
    <jsp:useBean id="form" scope="page" class="ua.epam.entity.RequestEntity"/>
    <c:set target="${bean}" property="username" value="${sessionScope.Principal}"/>
    
    <c:set var="requests" value="${bean.allRequestEntitys}"/>

    <table align="center" border="2" width="60%"
           <tr>
            <td align="center" width="20%"><font><fmt:message key="listuser.page.table.number"/></font></td>
            <td align="center" width="20%"><font><fmt:message key="listuser.page.table.date"/></font></td>
            <td align="center" width="20%"><font><fmt:message key="listuser.page.table.workname"/></font></td>
            <td align="center" width="20%"><font><fmt:message key="listuser.page.table.workdate"/></font></td>
            <td align="center" width="20%"><font><fmt:message key="listuser.page.table.state"/></font></td>
        </tr>
        <c:choose>
            <c:when test="${not empty requests}">
                <c:forEach items="${requests}" var="requ">
                    <tr>
                        <td align="center">${requ.idRequest}</td>
                        <td>${form.showDate(requ.requestDate)}</td>
                        <td>${requ.typeWork.name}</td>
                        <td>${form.showDate(requ.orderFullfillment)}</td>
                        <td>${requ.approve.name}</td>
                    </tr>
                </c:forEach>
            </c:when>
            <c:otherwise>
                <tr>
                    <td><fmt:message key="listuser.page.table.empty"/></td>
                </tr>
            </c:otherwise>
        </c:choose>

        <table/>
        <table width="100%" border="0"><tr align="right"><td><input type="button" value="<fmt:message key="page.button.back"/>" onclick="goBack()"/></td></tr></table>        
        <script language="JavaScript">
            function goBack()
            {
                window.history.back();
            }
        </script>
    </body>
</html>
