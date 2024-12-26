<jsp:directive.include file="includes/top.jsp" />
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<div id="msg" class="success">
			<h2><spring:message code="logout.success.msg.title" /></h2>

			<p><spring:message code="logout.success.msg.text" /></p>
			<p><spring:message code="logout.success.securityMsg.text" /></p>
		</div>
		
<jsp:directive.include file="includes/bottom.jsp" />