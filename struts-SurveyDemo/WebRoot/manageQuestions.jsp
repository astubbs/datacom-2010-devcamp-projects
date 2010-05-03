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
    
    <title><s:text name="question.title"/></title>
	    
  </head>
  
  <body>
    <a href="surveyQuestion/SurveyQuestion">Manage Questions</a>
    <a href="survey/Survey">Manage Surveys</a>
	<br/>  
  
   	<table>
  		<tr>
  			<td>
			  	<h1>
			  		<s:text name="question.title"/> 
			  	</h1>
			</td>
			  
		</tr>
		<tr>
			<td>
				<s:url id="urlCreate" action="SurveyQuestion_create">
				</s:url>
			  	<a href="${urlCreate}">
			  		<img src="images/Create.gif" border="0" onmouseover="this.src='images/Create-over.gif';" onmouseout="this.src='images/Create.gif';"/>
			  	</a>
			</td>
		</tr>
		<tr>
			<td>
			  	<form>
			  		<table>
			  			<tr>
						  	<td class="filter">
						  		<s:text name="filter.question.text"/> <input class="filterField" name="filter" onkeyup='filterTable(this, "filterTable", 1);' type="text">
						  	</td>
						  	<td class="filter">
								<s:text name="filter.question.helpText"/> <input class="filterField" name="filter" onkeyup='filterTable(this, "filterTable", 2);' type="text">
						  	</td>
						</tr>
					</table>
				</form>
			</td>
		</tr>
		<tr>
			<td>
				<table id="filterTable" class="sortable">
					<tr>
						<th class="tableHeader">
							<s:text name="question.no"/>
						</th>
						<th class="tableHeader">
							<s:text name="question.text"/>
						</th>
						<th class="tableHeader">
							<s:text name="question.help"/>
						</th>
						<th class="tableHeader">
							<s:text name="generic.edit"/>
						</th>
						<th class="tableHeader">
							<s:text name="generic.delete"/>
						</th>
					</tr>
					<s:iterator value="questions" status="rowstatus">
						<tr <s:if test="#rowstatus.odd">class="odd"</s:if><s:else>class="even"</s:else>>
							<td>
								<s:url id="urlView" action="SurveyQuestion_read">
									<s:param name="id">
										<s:property value="id"/>
									</s:param>
								</s:url>
								<a href="${urlView}">
									<s:property value="questionNo" />
								</a>
							</td>			
							<td>
								<s:property value="questionText" />
							</td>			
							<td>
								<s:property value="questionHelp" />
							</td>			
							<td>
								<s:url id="urlView" action="SurveyQuestion_edit">
									<s:param name="id">
										<s:property value="id"/>
									</s:param>
								</s:url>
								<a href="${urlView}">
									<s:text name="generic.edit"/>
								</a>
							</td>			
							<td>
								<s:url id="urlView" action="SurveyQuestion_delete">
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
