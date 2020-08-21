<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.Map" %>
<html>
  <head>
    <jsp:include page="include/httpbase.jsp"/>
	<style>
	 	h1 {
	 		color: #555555;
	 		margin-top:50px;
	 	}
	 </style>
     <title>Test receive POST request page</title>
  </head>

  <body>
  <jsp:include page="include/header.jsp"/>
  <jsp:include page="include/link-footer.jsp"/>

  <h1>Parameters received from request:</h1>
  
    <%
    Map<String, String[]> paramsMap = request.getParameterMap();
    if(paramsMap.isEmpty()) {
    	%>
    	<strong><em>None</em></strong>
    	<%
    }
    %>
    <ul>
    <%
    for(String paramsMapKey:paramsMap.keySet()) {
    	%>
    	<li><%=paramsMapKey%>
    		<ul>
    		<%
   			for(String param:paramsMap.get(paramsMapKey)) {
   				%>
   				<li><%=param%></li>
   				<%
   			}
    		%>
    		</ul>
    	</li>
    	<%
    }
    %>
    </ul>
    <jsp:include page="include/footer.jsp"/>
  </body>
</html>


