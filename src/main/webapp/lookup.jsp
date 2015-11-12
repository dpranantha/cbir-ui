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
%>
<%
    Ranker ranker = new Ranker();
    final String requestedImage = request.getParameter("searched-image");
    final String algorithm = request.getParameter("algorithm");
    final boolean person = requestedImage.contains("jl1.jpeg");
    final String dbFolder = person ? "/images/search/person/" : "/images/search/";
%>

You're requesting for: <br/>
<%
    if (person) { %>
        <img src="images/who.jpeg" width="200">
<%  } else { %>
        <img src="<%=requestedImage%>" width="200">
<%  } %>
<br/>

results are: <br/>
<%
    Map<String, Double> ranks = ranker.getRanking(requestedImage, dbFolder, algorithm);
    for (Map.Entry rank : ranks.entrySet()) { %>
<%      String path = dbFolder+rank.getKey();%>
        <img src="<%=path%>" width="200"/>&nbsp;
<%  } %>

</body>
</html>
