<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<html>
  <head>
    <base href="<%=basePath%>">
	<link rel="stylesheet" type="text/css" href="styles/main.css" />
    
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
				<table>
					<tr>
						<td>
							<s:text name="question.no"/>
						</td>
						<td>
							<s:property value="question.questionNo" />
						</td>
					</tr>
					<tr>
						<td>
							<s:text name="question.text"/>
						</td>
						<td>
							<s:property value="question.questionText" />
						</td>
					</tr>
					<tr>
						<td>
							<s:text name="question.help"/>
						</td>
						<td>
							<s:property value="question.questionHelp" />
						</td>
					</tr>
					<tr>
						<td>
							<s:url id="urlCancel" action="SurveyQuestion">
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
