<%--
  ~ Licensed to the Apache Software Foundation (ASF) under one
  ~ or more contributor license agreements. See the NOTICE file
  ~ distributed with this work for additional information
  ~ regarding copyright ownership. The ASF licenses this file
  ~ to you under the Apache License, Version 2.0 (the
  ~ "License"); you may not use this file except in compliance
  ~ with the License. You may obtain a copy of the License at
  ~
  ~ http://www.apache.org/licenses/LICENSE-2.0
  ~
  ~ Unless required by applicable law or agreed to in writing,
  ~ software distributed under the License is distributed on an
  ~ "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
  ~ KIND, either express or implied. See the License for the
  ~ specific language governing permissions and limitations
  ~ under the License.
  --%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="org.apache.commons.lang.StringEscapeUtils" %>
<%@page import="com.softwareag.wsstack.webapp.CSRFUtils"%>
<jsp:include page="include/adminheader.jsp"></jsp:include>

<h1>Upload additional jars: <h1>

<h4>
	<p>You can add additional jars to WS-Stack lib folder in the following steps: </p>
(Experimental functionality)
</h4>
<ul>
	<li>Browse to the location of the jar for uploading </li>
	<li>Click the "Submit" button </li>
</ul>
<br/>

<% if ("success".equals(request.getAttribute("status"))) { %>
<font color="green"><%= StringEscapeUtils.escapeHtml((String)request.getAttribute("cause")) %></font><br/><br/>
<%
} else if (request.getAttribute("cause") != null && "failure".equals(request.getAttribute("status"))) {
%>
<font color="red"> <%= StringEscapeUtils.escapeHtml((String)request.getAttribute("cause")) %></font><br/><br/>
<% } %>

<form method="post" ACTION="axis2-admin/uploadJar" name="upform" ENCTYPE='multipart/form-data'>
&nbsp;&nbsp;&nbsp;&nbsp;
<input type="file" name="uploadfile" size="40">
<p>&nbsp;&nbsp;&nbsp;&nbsp;
<input type="submit" name="Submit" value="Submit">
<input type="reset" name="Reset" value="Reset">
<%
  String csrfToken = CSRFUtils.getCsrfToken(request);
%>
<input type="hidden" name="<%=CSRFUtils.CSRF_TOKEN_NAME%>" value="<%=csrfToken%>"/>
</form> 

<jsp:include page="include/adminfooter.jsp"></jsp:include>
