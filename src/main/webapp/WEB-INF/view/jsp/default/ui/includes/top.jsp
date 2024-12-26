<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ page session="true" %>
<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<%-- <%@ taglib uri="/WEB-INF/service-url-validator" prefix="serviceURLValidator" %> --%>
<%-- <spring:theme code="mobile.custom.css.file" var="mobileCss" text="" /> --%>
<c:set var="req" value="${pageContext.request}" />
<c:set var="loginHeaderMessage">
	<spring:eval expression="@applicationProperties.getProperty('login.header.message')" />
</c:set>
<c:set var="portalUrl">
	<spring:eval expression="@applicationProperties.getProperty('portal.url')" />
</c:set>
	
<c:set var="resourceVersion"><%= "" %></c:set>
<html xmlns="http://www.w3.org/1999/xhtml" lang="en">
	<head>
	    <title>${pageTitle}</title>	
	    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" />
        <meta name="apple-mobile-web-app-capable" content="yes" />
        <meta name="apple-mobile-web-app-status-bar-style" content="black" />
        <link type="text/css" rel="stylesheet" href="resources/css/cas.css${resourceVersion}" />
        <meta http-equiv="Content-Type" content="text/html, charset=UTF-8" />
        <meta name="google" content="notranslate">
	    <link rel="icon" href="<c:url value="${imgFavicon}" />" type="image/x-icon" />
		<!-- CSS
		================================================== -->
		<link rel="stylesheet" href="resources/css/fonts.css${resourceVersion}"/>
		<!-- Fontawesome Icon font -->
        <link rel="stylesheet" href="resources/css/font-awesome.min.css${resourceVersion}"/>
		<!-- Twitter Bootstrap css -->
        <link rel="stylesheet" href="resources/css/bootstrap.min.css${resourceVersion}"/>
		<!-- jquery.fancybox  -->
        <link rel="stylesheet" href="resources/css/jquery.fancybox.css${resourceVersion}"/>
		<!-- animate -->
        <link rel="stylesheet" href="resources/css/animate.css${resourceVersion}"/>
		<!-- Main Stylesheet -->
        <link rel="stylesheet" href="resources/css/main.css${resourceVersion}"/>
		<!-- media-queries -->
        <link rel="stylesheet" href="resources/css/media-queries.css${resourceVersion}"/>

		<style type="text/css">
		body > section, .footer
		{
			padding:30px 0;
		}
		
		.contact-form .form-control {
			border-color: -moz-use-text-color -moz-use-text-color #cccccc;
			border-radius: 0;
			border-style: solid;
			border-width: 1px;
			box-shadow: none;
			margin-bottom: 10px;
			height:45px;
		}
		.top-navigation-menu{
			float:right;
			width:27%;
		}
		@media only screen and (max-width: 1024px) {
			.top-navigation-menu{
				width:34%;
			}
		
		}
		</style>
		
		<!-- javascript -->
		<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
		<script type="text/javascript" src="js/cas.js${resourceVersion}"></script>
		
<script>
	var customReferrer='${customReferrer}';
	var tempLangName = null;
	var isFromResetPassword = false;
	document.addEventListener('DOMContentLoaded', function() {
		//when page is loaded then it chackes wheather url contains locale or not and if url have locale than it sets locale based on url
		if(customReferrer && customReferrer.split('locale=').length > 1){
			tempLangName= customReferrer.split('locale=')[1];
			customReferrer =customReferrer.split('locale=')[0];
			isFromResetPassword=true
			languageChange();
		}
	}, false);
	
	function languageChange() {
		langName = tempLangName && tempLangName!= null ? tempLangName : document.getElementById("langId").value;	
		var url = '${pageContext.request.contextPath}' + '/change-language/'+langName;
		postData(url, '', null, '', changeLanguageDataSuccessCallback);
	}

		function changeLanguageDataSuccessCallback(data) {
			if(isFromResetPassword){
				window.location.replace(customReferrer);	
			}else{
				location.reload()
			}
			
		}
	
	function postData(serverUrl, postJsonDataObject, additionalData, errorDivId,
			successCallbackFunction) {
		$.ajax({
			type: 'POST',
			contentType: 'application/json',
			url: serverUrl,
			dataType: 'json',
			data: JSON.stringify(postJsonDataObject),
			success: function(data) {
					successCallbackFunction(data, additionalData);
			}
		});
	}
	
	function getData(serverUrl, postJsonDataObject, additionalData, errorDivId,
			successCallbackFunction) {
		$.ajax({
			type: 'GET',
			contentType: 'application/json',
			url: serverUrl,
			dataType: 'json',
			success: function(data) {
					successCallbackFunction(data, additionalData);
			}
		});
	}
	
	function keepSeesionAlive() {
		var url = '${pageContext.request.contextPath}' + '/healthcheck';
		getData(url, '', null, '', '');
	}
	
	setInterval("keepSeesionAlive()", 300000);
	
	
	
	
	
</script>

	</head>
	
			      
	<body id="cas" class="fl-theme-iphone">
    <div class="flc-screenNavigator-view-container">
        <div class="fl-screenNavigator-view">
            
        <!-- 
        Fixed Navigation
        ==================================== -->
        <header id="navigation" class="navbar-fixed-top navbar exludeAnimation">
            <div class="container">
             <c:set var="portalUrl"><spring:eval expression="@applicationProperties.getProperty('portal.url')" /></c:set>
            	<!-- main nav -->
            	<div class="top-navigation-menu">
                    <ul id="nav" class="nav navbar-nav">
						<li id="loginLinkId" style="float:left;"><a href="${customReferrer}" class="external" id="topMenuLoginLink"><spring:message code="login.header.login.link" /></a></li>
						<li style="float:left;"><a href="https://www.processminer.com" class="external" id="topMenuHomeLink"><spring:message code="login.header.home.link" /></a></li>

						<li style="float: left; margin-top: 16px; margin-left: 10px;">
						<select id="langId" 
							onchange="languageChange()">
								<c:forEach var="entry" items="${languages}">
									<c:set var="selected" value="false" />
									<c:if test="${fn:contains(entry.key, languageLocale)}"
										var="res">
										<c:set var="selected" value="true" />
									</c:if>
									<option value="${entry.key}"
										${selected ? 'selected="selected"' : ''}>
										${entry.value}</option>
								</c:forEach>
						</select></li>
					</ul>
            	</div>
            	<!-- /main nav -->
            	
                <div class="navbar-header">                  
					<!-- logo -->
                    <a class="navbar-brand" href="http://www.processminer.com/" style="margin-top:10px">
						<img src="${imgCompanyLogo}" alt="Company Logo" style="width:220px;"/>
					</a>
					
					<!-- /logo -->
                </div>
            </div>
        </header>
        <!--
        End Fixed Navigation
        ==================================== -->
				
            <div id="content" class="fl-screenNavigator-scroll-container" style="margin-top: 90px;">
