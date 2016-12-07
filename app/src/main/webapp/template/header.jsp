<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://displaytag.sf.net" prefix="display" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>

<nav class="navbar navbar-inverse navbar-fixed-top">
    <div class="container-fluid">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar"
                    aria-expanded="false" aria-controls="navbar">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#">Dialog Biznews Service</a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
            <ul class="nav navbar-nav navbar-right">
                <c:choose>
                    <c:when test="${pageContext.request.userPrincipal.name == 'madhusha'}">
                        <li>
                            <a href="welcomeAdmin">
                                <img border="0" alt="Home" src="resources/images/home.png" width="40" height="40"
                                     style="margin-top: -15px; margin-bottom: -10px">
                            </a>
                        </li>
                    </c:when>
                    <c:when test="${pageContext.request.userPrincipal.name == 'dayan'}">
                        <li>
                            <a href="cpAdmin">
                                <img border="0" alt="Home" src="resources/images/home.png" width="40" height="40"
                                     style="margin-top: -15px; margin-bottom: -10px">
                            </a>
                        </li>
                    </c:when>
                </c:choose>
                <li>
                    <c:url value="/j_spring_security_logout" var="logoutUrl"/>

                    <form action="${logoutUrl}" method="post" id="logoutForm">
                        <input type="hidden" name="${_csrf.parameterName}"
                               value="${_csrf.token}"/>
                    </form>
                    <script>
                        function formSubmit() {
                            document.getElementById("logoutForm").submit();
                        }
                    </script>

                    <c:if test="${pageContext.request.userPrincipal.name != null}">
                        <h4 style="color: #FFFFFF">
                            Welcome : ${pageContext.request.userPrincipal.name} | <a
                                href="javascript:formSubmit()"> Logout</a>
                        </h4>
                    </c:if>
                </li>
            </ul>
        </div>
    </div>
</nav>