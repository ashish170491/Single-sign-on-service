<!-- header part start -->
<jsp:include page="includes/top.jsp" />
<!-- header part end -->
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!-- content part start -->
<div class="main-content dashboard_page">
	<div class="container">
		<div class="row">
			<div class="col-md-12 no-padding">
				<div class="sensor-maps-main">
					<h2>&nbsp;</h2>
					<div class="text-center">
						 <h4 class="error_text_new">${message}</h4> 
						 </br>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- content part end -->

<jsp:directive.include file="includes/bottom.jsp" />