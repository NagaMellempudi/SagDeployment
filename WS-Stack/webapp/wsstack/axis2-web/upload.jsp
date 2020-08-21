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
<%@ page import="com.softwareag.wsstack.webapp.CSRFUtils"%>

<jsp:include page="include/adminheader.jsp"/>
<h1>Upload a Web Services Stack Service Archive File</h1>

<p>You can upload a packaged Web Services Stack service from this page in two small steps.</p>
<ul>
  <li>Browse to the location and select the Web Services Stack service archive file you wish to upload</li>
  <li>Click "Upload" button</li>
</ul>
<p>Simple as that!</p>

<% if ("success".equals(request.getAttribute("status"))) { %>
<font color="green"><%= StringEscapeUtils.escapeHtml((String)request.getAttribute("cause")) %></font><br/><br/>
<%
} else if (request.getAttribute("cause") != null && "failure".equals(request.getAttribute("status"))) {
%>
<font color="red"> <%= StringEscapeUtils.escapeHtml((String)request.getAttribute("cause")) %></font><br/><br/>
<% } %>

<form method="post" name="Axis2upload" id="Axis2upload" action="axis2-admin/upload"
      enctype="multipart/form-data">
  <%
    String csrfToken = CSRFUtils.getCsrfToken(request);
  %>
  <input type="hidden" name="<%=CSRFUtils.CSRF_TOKEN_NAME%>" value="<%=csrfToken%>"/>
  <table>
    <tr>
      <td>Service archive : </td>
      <td><input id="serviceUpload" type="file" name="filename" size="50"/></td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td><input name="upload" type="submit" value=" Upload "/></td>
    </tr>
  </table>
</form>
<blockquote>
<p>Hot deployment of new service archives is <%=request.getAttribute("hotDeployment") %></p>
<p>Hot update of existing service archives is <%=request.getAttribute("hotUpdate") %></p>
</blockquote>
<jsp:include page="include/adminfooter.jsp"/>
