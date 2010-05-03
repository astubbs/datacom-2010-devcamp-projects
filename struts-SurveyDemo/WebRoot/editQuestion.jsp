<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<html>
  <head>
    <base href="<%=basePath%>">
	<link rel="stylesheet" type="text/css" href="styles/main.css" />
	<script type="text/javascript" language="JavaScript" src="javaScript/popcalendar2.js"></script>
    
    <title><s:text name="question.title"/></title>
  </head>
  
  <body>
   	<table>
  		<tr>
  			<td>
			  	<h1> <s:text name="question.title"/> </h1>
			</td>
		</tr>
		<tr>
			<td>
			  	<div class="error"><s:fielderror theme="datacom"/></div>
			  	
			  	<s:form action="SurveyQuestion" theme="simple">
			  		<s:hidden name="question.id"/>
			  	
					<table>
						<tr>
							<td>
								<s:text name="question.no"/>
							</td>
							<td>
								<s:textfield name="question.questionNo"/>
							</td>
						</tr>
						<tr>
							<td>
								<s:text name="question.text"/>
							</td>
							<td>
								<s:textfield name="question.questionText"/>
							</td>
						</tr>
						<tr>
							<td>
								<s:text name="question.help"/>
							</td>
							<td>
								<s:textfield name="question.questionHelp"/>
							</td>
						</tr>
						<tr>
							<td colspan="2">
								<table>
									<tr>
										<td>
											<s:url id="urlCancel" action="SurveyQuestion">
											</s:url>
											<a href="${urlCancel}">
												<img src="images/Cancel.gif" border="0" onmouseover="this.src='images/Cancel-over.gif';" onmouseout="this.src='images/Cancel.gif';"/>
											</a>
										</td>
										<td>
						   					<s:submit 
						   						type="image" 
						   						src="images/Save.gif" onmouseover="this.src='images/Save-over.gif';" onmouseout="this.src='images/Save.gif';"
						   						action="SurveyQuestion_update" 
						   					/>
										</td>
									</tr>
								</table>
							</td>
						</tr>
					</table> 
				</s:form>
			</td>
		</tr>
	</table>   
  </body>
</html>
