<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<html>
  <head>
    <base href="<%=basePath%>">
	<link rel="stylesheet" type="text/css" href="styles/main.css" />
    <script src="javaScript/sorttable.js"></script>
    <script src="javaScript/filter.js"></script>
    
    <title><s:text name="survey.title"/></title>
	    
  </head>
  
  <body>
    <a href="surveyQuestion/SurveyQuestion">Manage Questions</a>
    <a href="survey/Survey">Manage Surveys</a>
  	<br/>
  	
   	<table>
  		<tr>
  			<td>
			  	<h1>
			  		<s:text name="survey.title"/> 
			  	</h1>
			</td>
			  
		</tr>
		<tr>
			<td>
				<s:url id="urlCreate" action="Survey_create">
				</s:url>
			  	<a href="${urlCreate}">
			  		<img src="images/Create.gif" border="0" onmouseover="this.src='images/Create-over.gif';" onmouseout="this.src='images/Create.gif';"/>
			  	</a>
			</td>
		</tr>
		<tr>
			<td>
				<table class="sortable">
					<tr>
						<th class="tableHeader">
							<s:text name="survey.no"/>
						</th>
						<th class="tableHeader">
							<s:text name="survey.date"/>
						</th>
						<th class="tableHeader">
							<s:text name="survey.score"/>
						</th>
						<th class="tableHeader">
							<s:text name="generic.edit"/>
						</th>
						<th class="tableHeader">
							<s:text name="generic.delete"/>
						</th>
					</tr>
					<s:iterator value="surveys" status="rowstatus">
						<tr <s:if test="#rowstatus.odd">class="odd"</s:if><s:else>class="even"</s:else>>
							<td>
								<s:url id="urlView" action="Survey_read">
									<s:param name="id">
										<s:property value="id"/>
									</s:param>
								</s:url>
								<a href="${urlView}">
									<s:property value="id" />
								</a>
							</td>			
							<td>
								<s:date name="startDate" format="dd/MM/yyyy"/>
							</td>			
							<td>
								<s:property value="score"/>
							</td>
							<td>
								<s:url id="urlView" action="Survey_edit">
									<s:param name="id">
										<s:property value="id"/>
									</s:param>
								</s:url>
								<a href="${urlView}">
									<s:text name="generic.edit"/>
								</a>
							</td>			
							<td>
								<s:url id="urlView" action="Survey_delete">
									<s:param name="id">
										<s:property value="id"/>
									</s:param>
								</s:url>
								<a href="${urlView}">
									<s:text name="generic.delete"/>
								</a>
							</td>			
						</tr>
					</s:iterator>
				</table>
			</td>
		</tr>
	</table>    
  </body>
</html>
