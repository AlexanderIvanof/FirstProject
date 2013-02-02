<%-- 
    Document   : EditRequest
    Created on : 24.01.2013, 11:18:53
    Author     : Alexandr Ivanov
--%>

<%@page import="java.util.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8" errorPage="errorpage.jsp"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="icon" href="images/dispatch.ico" type="x-icon">
        <link rel="shortcut icon" href="images/dispatch.ico" type="x-icon">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Редактор</title>
    </head>
    <jsp:useBean id="edit" scope="page" class="ua.epam.view.EditPageBean"/>
    
    <c:set target="${edit}" property="idRequest" value="${param.idRequest}"/>
    <c:set var="idRequest" scope="session" value="${param.idRequest}"/>
    
    <c:set var="workers" value="${edit.workers}"/>
    <c:set var="foremans" value="${edit.foreman}"/>
    
    
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
        <center><h2><fmt:message key="edit.page.head"/></h2></center>
        <center><h3><fmt:message key="edit.page.type"/>: <c:out value="${edit.requestWorkType}"/></h3></center>

        <form action="./Control" method="POST">
            <table align="center" border="2" width="50%"
                   <tr>
                    <td align="right"><fmt:message key="edit.page.table.whodo"/></td>
                    <td><select name="worker"><option selected value=0></option>
                            <c:forEach items="${workers}" var="wrk">
                                <option value="${wrk.idworker}">${wrk.firstName} ${wrk.lastName}</option>
                            </c:forEach>
                        </select></td>
                </tr>
                <tr>
                    <td align="right"><fmt:message key="edit.page.table.resp"/></td>
                    <td>
                        <select name="foreman"><option selected value=0></option>
                            <c:forEach items="${foremans}" var="frm">
                                <option value="${frm.idworker}">${frm.firstName} ${frm.lastName}</option>
                            </c:forEach>
                        </select>
                    </td>
                </tr>
                <tr  border="0">
                    <td></td>
                    <td>
                        <input type="submit" value="<fmt:message key="edit.page.button.denied"/>" name="denied"/>
                        <input type="submit" value="<fmt:message key="edit.page.button.handle"/>" name="process"/>
                    </td>
                </tr>
            </table>
        </form>
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
