<%@ page import="cbpr.logic.Ranker" %>
<%@ page import="java.util.Map" %>
<%--
  Created by IntelliJ IDEA.
  User: dpranantha
  Date: 11/10/15
  Time: 10:47 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Result</title>
</head>
<body>
<%!
    private javax.servlet.http.HttpServletRequest request;
%><%
    Ranker ranker = new Ranker();
    final String requestedImage = request.getParameter("searched-image");
    final String algorithm = request.getParameter("algorithm");

    System.out.println(requestedImage + " " + algorithm);
    Map<String, Double> ranks = ranker.getRanking(requestedImage,"/images/search/", algorithm);

    for (Map.Entry rank : ranks.entrySet()) { %>
<% String path = "images/search/"+rank.getKey();%>
<img src="<%=path%>"/>
<%}%>
</body>
</html>
