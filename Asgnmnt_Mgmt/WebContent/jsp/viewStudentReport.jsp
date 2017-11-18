<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="java.sql.*"%>
<%@ page import="java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

	<table>
		<tr>
			<th>Homework id</th>
			<th>Homework Name</th>
			<th>Scoring Policy</th>
		    <th>Marks obtained</th>
		</tr>
		<%
			
			ArrayList <ResultSet>al = (ArrayList) request.getAttribute("rs");
		
			for(ResultSet rs : al) {
				if (rs != null) {
					while (rs.next()) {
		%>
		<tr>
			<td><%=rs.getString("hw_id")%></td>
			<td><%=rs.getString("hw_name")%></td>
			<td><%=rs.getString("scoring_policy")%></td>
			<td><%=rs.getString("MARKS_OBTAINED")%></td>

		</tr>
		<%
					}
				}
			}
		%>

	</table>



</body>
</html>