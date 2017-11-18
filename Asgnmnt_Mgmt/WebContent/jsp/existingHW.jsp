<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%HashMap<ArrayList,ArrayList> questions=(HashMap<ArrayList,ArrayList>)request.getAttribute("questions") ;

    for(ArrayList key:questions.keySet())
    { %>
    
		<form name="existingwHW" action="<%=request.getContextPath()%>/ProfController?action=existingHW" method="post">
			<input type="radio" name="qset" value='<%=key.get(0)%>@<%=key.get(1)%>' onclick="$('#div_<%=key%>').show();"> <%=key.get(0)%>
			<div id="div_<%=key%>" style="display:hidden;">
				<% ArrayList<String> ques =  questions.get(key);
				   for(String s : ques) {
				%>
					<p name="ques"><%=s%> </p>
				 <%} %>
			</div> 
	<%}%>
	<input type="submit" value="CREATE"/>
</form>
</body>
</html>