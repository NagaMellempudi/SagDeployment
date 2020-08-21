<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="org.apache.commons.lang.StringEscapeUtils" %>
<%@ page import="com.softwareag.wsstack.webapp.CSRFUtils"%>
<jsp:include page="include/adminheader.jsp"></jsp:include>
<h1>Change Admin Password</h1>

<form method="post" name="changePassword" action="axis2-admin/changePassword">
    
    <%
        String csrfToken = CSRFUtils.getCsrfToken(request);
        String status = (String) request.getAttribute("status");
        if (status != null) {
            String message = StringEscapeUtils.escapeHtml((String) request.getAttribute("message"));
    %>
            <p><%=(status.equals("success") 
                             ? "<font color=\"green\">" + message + "</font>"
                             : "<font color=\"red\">" + message + "</font>")%></p>   
    <%  
        } 
    %>
            <input type="hidden" name="<%=CSRFUtils.CSRF_TOKEN_NAME%>" value="<%=csrfToken%>"/>
            <table width="100%">
                <tr>
                    <td width="10%" nowrap="true">Current password:</td>
                    <td><input type="password" name="current_password"></td>
                </tr>
                <tr>
                    <td width="10%" nowrap="true">New password:</td>
                    <td><input type="password" name="new_password"></td>
                </tr>
                <tr>
                    <td width="10%" nowrap="true">Confirm New password:</td>
                    <td align="left"><input type="password" name="new_password_confirmation"></td>
                </tr>
                <tr><td colspan="2">&nbsp;</td></tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>
                        <input name="changePass" type="submit" value=" Change " >
                    </td>
                </tr>
            </table>
</form>

<jsp:include page="include/adminfooter.jsp"></jsp:include>
