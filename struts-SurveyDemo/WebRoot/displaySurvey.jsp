<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<html>
  <head>
    <base href="<%=basePath%>">
	<link rel="stylesheet" type="text/css" href="styles/main.css" />
    
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
  				<s:text name="survey.name"/><s:property value="id"/>
  			</td>
  		</tr>
  		<tr>
  			<td>
				<table>
			  		<s:iterator var="answer" value="survey.answers" status="rowstatus">
						<tr>
							<td>
								<s:property value="#answer.question.questionNo" />.
							</td>
							<td
								title="<s:property value="#answer.question.questionHelp"/>"
							>
								<s:property value="#answer.question.questionText"/>
							</td>
							<td>
								<s:property value="#answer.answer"/>
							</td>
						</tr>
					</s:iterator>
					<tr>
						<td>
							<s:url id="urlCancel" action="Survey">
							</s:url>
							<a href="${urlCancel}">
								<img src="images/Cancel.gif" border="0" onmouseover="this.src='images/Cancel-over.gif';" onmouseout="this.src='images/Cancel.gif';"/>
							</a>
						</td>
						<td>
						</td>
					</tr>
				</table>    
			 </td>
		</tr>
	</table>
  </body>
</html>
