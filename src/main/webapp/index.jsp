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
    <table width="500">
      <tr>
        <td colspan="2">
          Image for search:
        </td>
        <td>
          Algorithm:
        </td>
      </tr>
      <tr>
        <td>
          <input name="searched-image" type="radio" value="/images/gucci1.jpeg" checked/>
        </td>
        <td><img src="images/gucci1.jpeg"  width="150"></td>
        <td rowspan="4" valign="2">
          <input name="algorithm" type="radio" value="fcth" checked/>FCTH<br/>
          <input name="algorithm" type="radio" value="cedd"/>CEDD<br/>
          <input name="algorithm" type="radio" value="tamura"/>Tamura<br/>
          <input name="algorithm" type="radio" value="surf"/>SURF<br/>
          <input name="algorithm" type="radio" value="sift"/>SIFT<br/>
          <input name="algorithm" type="radio" value="simple" disabled/>SIMPLE<br/>
          <input type="submit"/>
        </td>
      </tr>
      <tr>
        <td>
          <input name="searched-image" type="radio" value="/images/lv2.jpeg"/>
        </td>
        <td><img src="images/lv2.jpeg" width="150"></td>
      </tr>
      <tr>
        <td>
          <input name="searched-image" type="radio" value="/images/lv-scarf3.jpeg"/>
        </td>
        <td><img src="images/lv-scarf3.jpeg"  width="150"></td>
      </tr>
      <tr>
        <td>
          <input name="searched-image" type="radio" value="/images/b-jack5.jpeg"/>
        </td>
        <td><img src="images/b-jack5.jpeg" width="150"></td>
      </tr>
    </table>
  </form>

  </body>
</html>
