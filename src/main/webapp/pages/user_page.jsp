<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page isELIgnored="false" %>

<fmt:setLocale value="${param.lang}"/>
<fmt:setBundle basename="labels"/>

<html lang="${param.lang}">
<head>
    <title>Dolphin Hotel</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/common.css"/>
    <script>
        function goBill(id) {
            location.href = '${pageContext.request.contextPath}/bill?billId='+id;
        }
    </script>
</head>

<body link="#000000" vlink="#006600" class="h-page-bg">
<table width="100%">
    <tr>
        <td width="100%">
            <div align="center">
                <table width="1000" height="176" bgcolor="#8feda0">
                    <tr>
                        <td width="100%" valign="top">
                            <a href="${pageContext.request.contextPath}">
                                <img
                                        src="resources/logo.png"
                                        width="300" height="176">
                            </a>
                        </td>

                        <td width="100%" valign="top">
                            <a href="${pageContext.request.contextPath}">
                                <img
                                        src="resources/pets.png"
                                        width="559" height="176">
                            </a>
                        </td>
                    </tr>
                    <tr>
                        <td height="50">
                            <a href="${pageContext.request.contextPath}?lang=en_US"><fmt:message key="language_eng"/></a></li>
                            <a href="${pageContext.request.contextPath}?lang=ru_RU"><fmt:message key="language_rus"/></a></li>
                            <a href="${pageContext.request.contextPath}?lang=cat_CAT"><fmt:message key="language_cat"/></a></li>
                            <a href="${pageContext.request.contextPath}?lang=dog_DOG"><fmt:message key="language_dog"/></a></li>
                        </td>
                    </tr>
                    <tr>
                        <td width="100%" valign="middle">
                            <ul>
                                <li>
                                    <p align="left" class="h-links"><a
                                            href="${pageContext.request.contextPath}/login"
                                            target="_self"><fmt:message key="login"/></a>
                                </li>
                                <li>
                                    <p align="left" class="h-links"><a
                                            href="${pageContext.request.contextPath}/registration"
                                            target="_self"><fmt:message key="registration"/></a>
                                </li>
                                <li>
                                    <p align="left" class="h-links"><a
                                            href="${pageContext.request.contextPath}/hotel"
                                            target="_self"><fmt:message key="hotel"/></a>
                                </li>
                                <p align="center">Pet Hotel, New York, 8-800-555-35-35</p>
                            </ul>
                        </td>
                        <td>
                            <dev class="centralCard">
                                <ul class="descriptionList">
                                    <li> <fmt:message key="user"/> ${user.getId()} </li>
                                    <li> <span><fmt:message key="role"/>:</span> <em>${user.getRole()}</em> </li>
                                    <li> <span><fmt:message key="accountName"/>:</span> <em>${user.getLogin()}</em> </li>
                                    <li> <span><fmt:message key="password"/>:</span> <em>${user.getPassword()}</em> </li>
                                </ul>
                                <button type="submit">+</button>
                                <table class="table_grizzly">
                                    <tr>
                                        <th>ID</th>
                                        <th><fmt:message key="bookingId"/></th>
                                        <th><fmt:message key="userId"/></th>
                                        <th><fmt:message key="roomId"/></th>
                                        <th><fmt:message key="status"/></th>
                                        <th>/th>
                                        <th>/th>
                                    </tr>
                                    <c:forEach items="${user.getBills()}" var ="user">
                                        <tr>
                                            <td onclick="goBill(${user.getId()});">${user.getId()}</td>
                                            <td onclick="goBill(${user.getId()});">${user.getBookingId()}</td>
                                            <td onclick="goBill(${user.getId()});">${user.getUserId()}</td>
                                            <td onclick="goBill(${user.getId()});">${user.getRoomId()}</td>
                                            <td onclick="goBill(${user.getId()});">${user.getStatus()}</td>
                                            <td>
                                                <form>
                                                    <button>
                                                        <fmt:message key="delete"/>
                                                    </button>
                                                </form>
                                            </td>
                                            <td>
                                                <form>
                                                    <button>
                                                        <fmt:message key="update"/>
                                                    </button>
                                                </form>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </table>

                            </dev>
                        </td>
                    </tr>
                </table>
            </div>
        </td>
    </tr>
</table>
</body>
</html>

