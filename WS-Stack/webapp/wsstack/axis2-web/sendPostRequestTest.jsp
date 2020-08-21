<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.softwareag.wsstack.webapp.CSRFUtils"%>
<html>
  <head>
  <style>
    h1 {
        text-align:center;
        color: #555555;
    }
    .headingLeftHr {
        width:50%;
    }
    
    .headingRightHr {
        width:40%;
    }
    .inputDiv {
        text-align: center;
        padding:100px 0;
    }
    .inputDiv form input {
        margin: 0 auto;
        width: 400px;
    }
  </style>
    <jsp:include page="include/httpbase.jsp"/>
    <title>Test send POST request page</title>
  </head>

  <body>
    <jsp:include page="include/header.jsp"/>
    <jsp:include page="include/link-footer.jsp"/>
    
    <hr class="headingLeftHr"/>
    <h1>Send a POST request</h1>
    <hr class="headingRightHr"/>
    
    <div class="inputDiv">
        <form method="post" name="LoginForm" action="axis2-web/receivePostRequestTest.jsp">
                <%
                    String csrfToken = CSRFUtils.getCsrfToken(request);
                %>
                <input type="hidden" name="<%=CSRFUtils.CSRF_TOKEN_NAME%>" value="<%=csrfToken%>"/>
                <input type="text" name="testInput">
                <input name="testSubmit" type="submit" value=" Go ">
        </form>
    </div>
    
    <jsp:include page="include/footer.jsp"/>
  </body>
</html>


