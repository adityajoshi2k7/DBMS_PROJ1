<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%  String user_id=(String)request.getAttribute("user_id");
		ArrayList<ResultSet> al = (ArrayList<ResultSet>) request.getAttribute("results");
		ResultSet standard = al.get(0);
		ResultSet param = al.get(1);
		/* while(param.next()) {
       	 System.out.println("param"+param.getString(1));
        } */
		
		String qset = new String();
		
		if(standard.next()) {
			qset = standard.getString("QSET_ID");
		}
		else if(param.next()) {
			qset = param.getString("QSET_ID");
		}

	%>
	<form name="selectQuestion" action="<%=request.getContextPath()%>/StudController?action=submitExam&user_id=<%=user_id%>&hwID=<%=request.getAttribute("hwID")%>&qsetID=<%=qset%>" method="post">
	<table>

		<%
		HashMap<String, ArrayList> outerMap = new HashMap<>(); 
		
		while (standard.next()) {
			/* ArrayList squestions = new ArrayList(), sanswers = new ArrayList();
			HashMap<String, ArrayList> stdans = new HashMap<>();
			
			
			sanswers.add(standard.getString("ANSWER_TEXT"))sanswers.add(standard.getString("IS_CORRECT"));
			 */
						 
			if(!outerMap.containsKey(standard.getString("Q_ID"))) {
				ArrayList outerList=new ArrayList();
				outerList.add(standard.getString("Q_TEXT"));
				outerList.add(standard.getString("HW_ID"));
				outerList.add(standard.getString("QSET_ID"));
				String ansid=standard.getString("ANS_ID");
				System.out.println("ansssss"+ansid);
				String iscorrect=standard.getString("IS_CORRECT");
				String text=standard.getString("ANSWER_TEXT");
				HashMap<String,ArrayList> innerMap=new HashMap();
				ArrayList innerList=new ArrayList();
				innerList.add(text);
				innerList.add(iscorrect);
				innerMap.put(ansid,innerList);
				outerList.add(innerMap);
				outerMap.put(standard.getString("Q_ID"),outerList);
								
			}
			else{
				ArrayList outer=outerMap.get(standard.getString("Q_ID"));
				HashMap inner=(HashMap)outer.get(3);
				String ansid=standard.getString("ANS_ID");
				String iscorrect=standard.getString("IS_CORRECT");
				String text=standard.getString("ANSWER_TEXT");
				ArrayList innerList=new ArrayList();
				innerList.add(text);
				innerList.add(iscorrect);
				inner.put(ansid,innerList);
			}
			System.out.println("KARTHIK Standard: " + outerMap);
			
			
		}
		
		for (Map.Entry mp : outerMap.entrySet()) {
		%>
		<tr>
			<td><p><%=((ArrayList)mp.getValue()).get(0)%></p></td>
		</tr>
		
		<%
			HashMap<String,ArrayList> answers = (HashMap) ((ArrayList) mp.getValue()).get(3);
			//System.out.println(outerMap);
	      
			for (Map.Entry mp1 : answers.entrySet()) {
		%>
		<tr>
			<td><input type="radio" name="option_<%=mp.getKey()%>" value="<%=((ArrayList)mp1.getValue()).get(0)%>@<%=(mp1.getKey())%>"><%=((ArrayList)mp1.getValue()).get(0)%>
			</td>
		</tr>
		<%
			
			}
			}
		%>
		<% 
		HashMap<String, ArrayList> outerMapParam = new HashMap<>();
		while (param.next()) {
				System.out.println("inside param");		 
			if(!outerMapParam.containsKey(param.getString("Q_ID"))) {
				ArrayList outerList=new ArrayList();
				outerList.add(param.getString("Q_TEXT"));
				outerList.add(param.getString("HW_ID"));
				outerList.add(param.getString("QSET_ID"));
				outerList.add(param.getString("P1"));
				outerList.add(param.getString("P2"));
				outerList.add(param.getString("P3"));
				outerList.add(param.getString("P4"));
				outerList.add(param.getString("P5"));
				
				String ansid=param.getString("ANS_ID");
				String iscorrect=param.getString("IS_CORRECT");
				String text=param.getString("ANSWER_TEXT");
				HashMap<String,ArrayList> innerMap=new HashMap();
				ArrayList innerList=new ArrayList();
				innerList.add(text);
				innerList.add(iscorrect);
				innerMap.put(ansid,innerList);
				outerList.add(innerMap);
				outerMapParam.put(param.getString("Q_ID"),outerList);
								
			}
			else{
				ArrayList outer=outerMapParam.get(param.getString("Q_ID"));
				HashMap inner=(HashMap)outer.get(8);
				String ansid=param.getString("ANS_ID");
				String iscorrect=param.getString("IS_CORRECT");
				String text=param.getString("ANSWER_TEXT");
				ArrayList innerList=new ArrayList();
				innerList.add(text);
				innerList.add(iscorrect);
				inner.put(ansid,innerList);
			}
			
			
			
		}
		System.out.println("KARTHIK PAram: " + outerMapParam);
		%>
		<% 
		for (Map.Entry mp : outerMapParam.entrySet()) {
		%>
		<tr>
			<td><p><%=((ArrayList)mp.getValue()).get(0)%></p></td>
		</tr>
		<tr>
		<td>Parameters</td>
		<%if (((ArrayList)mp.getValue()).get(3)!=null) {%>
		<td><%=((ArrayList)mp.getValue()).get(3)%></td>
		<%} %>
		<td></td>
		<%if (((ArrayList)mp.getValue()).get(4)!=null) {%>
		<td><%=((ArrayList)mp.getValue()).get(4)%> </td>
		<%} %>
		<td></td>
		<%if (((ArrayList)mp.getValue()).get(5)!=null) {%>
		<td><%=((ArrayList)mp.getValue()).get(5)%></td>
		<%} %>
		<td></td>
		<%if (((ArrayList)mp.getValue()).get(6)!=null) {%>
		<td><%=((ArrayList)mp.getValue()).get(6)%></td>
		<%} %>
		<td></td>
		<%if (((ArrayList)mp.getValue()).get(7)!=null) {%>
		<td><%=((ArrayList)mp.getValue()).get(7)%></td>
		<%} %>
		
		<%
			HashMap<String,ArrayList> answers = (HashMap) ((ArrayList) mp.getValue()).get(8);
			//System.out.println(outerMap);
	      
			for (Map.Entry mp1 : answers.entrySet()) {
		%>
		<tr>
			<td><input type="radio" name="option_<%=mp.getKey()%>"  value="<%=((ArrayList)mp1.getValue()).get(0)%>@<%=(mp1.getKey())%>"><%=((ArrayList)mp1.getValue()).get(0)%>
			</td>
		</tr>
		<%
			
			}
			}
		%>
		
		
		
		
		
		
		<tr>
			<td>
				<input type="submit">
			</td>
		</tr>
		
	</table>
	</form>
	

</body>
</html>