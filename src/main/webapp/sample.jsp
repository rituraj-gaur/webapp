<?page language="java"?>
<%@ page import = "java.io.*,java.util.*" %>
<html>
	<head>
		<title>Results</title>
	</head>
	<body bgcolor="yellow">
		<h1><strong> hello : </h1><strong> <%= request.getParameter("name")%>

				<h2><b><input type="text" value="<%=request.getParameter("value")%>"></input></h2></b>
	</body>
</html>
