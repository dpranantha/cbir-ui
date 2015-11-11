<%--
  Created by IntelliJ IDEA.
  User: dpranantha
  Date: 11/8/15
  Time: 9:00 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>Content based product retrieval</title>
  </head>
  <body>
  <form method="post" action="lookup.jsp">
    <table>
      <tr>
        <td colspan="2">
          Image for search:
        </td>
      </tr>
      <tr>
        <td>
          <input name="searched-image" type="radio" value="/images/gucci1.jpeg" checked/>
        </td>
        <td><img src="images/gucci1.jpeg"></td>
      </tr>
      <tr>
        <td>
          <input name="searched-image" type="radio" value="/images/search/lv1.jpeg"/>
        </td>
        <td><img src="images/search/lv1.jpeg"></td>
      </tr>
      <tr>
        <td valign="top">
          Algorithm:
        </td>
        <td>
          <input name="algorithm" type="radio" value="fcth" checked/>FCTH<br/>
          <input name="algorithm" type="radio" value="cedd"/>CEDD<br/>
          <input name="algorithm" type="radio" value="tamura"/>Tamura<br/>
          <input name="algorithm" type="radio" value="surf"/>SURF<br/>
          <input name="algorithm" type="radio" value="sift"/>SIFT<br/>
          <input name="algorithm" type="radio" value="simple" disabled/>SIMPLE
        </td>
      </tr>
    </table>
    <input type="submit"/>
  </form>

  </body>
</html>
