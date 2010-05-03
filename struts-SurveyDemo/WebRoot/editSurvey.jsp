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
    
    <title><s:text name="survey.title"/></title>
  </head>
  
  <body>
   	<table>
  		<tr>
  			<td>
			  	<h1> <s:text name="survey.title"/> </h1>
			</td>
		</tr>
		<tr>
			<td>
			  	<div class="error"><s:fielderror theme="datacom"/></div>
			  	
			  	<s:form action="Survey" theme="simple">
			  		<s:hidden name="survey.id"/>
			  	
					<table>
				  		<s:iterator var="answer" value="survey.answers" status="rowstatus" >
				  			<s:hidden name="survey.answers[%{#rowstatus.index}].question.id"/>
							<tr>
								<td>
									<s:property value="#answer.question.questionNo" />.
								</td>
								<td
									title="<s:property value="#answer.question.questionHelp"/>"
								>
									<s:property value="#answer.question.questionText" />
								</td>
								<td>
									<s:textfield name="survey.answers[%{#rowstatus.index}].answer"/>
								</td>
							</tr>
						</s:iterator>
						<tr>
							<td colspan="2">
								<table>
									<tr>
										<td>
											<s:url id="urlCancel" action="Survey">
											</s:url>
											<a href="${urlCancel}">
												<img src="images/Cancel.gif" border="0" onmouseover="this.src='images/Cancel-over.gif';" onmouseout="this.src='images/Cancel.gif';"/>
											</a>
										</td>
										<td>
						   					<s:submit 
						   						type="image" 
						   						src="images/Save.gif" onmouseover="this.src='images/Save-over.gif';" onmouseout="this.src='images/Save.gif';"
						   						action="Survey_update" 
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
