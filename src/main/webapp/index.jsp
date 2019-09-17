<%
    String userId = (String)session.getAttribute("USER_ID");
    String userName = (String)session.getAttribute("USER_NAME");
    if (request.getParameter("uid")!=null) {
        userId = request.getParameter("uid");
        session.setAttribute("USER_ID",userId);
    }
    if (request.getParameter("uname")!=null) {
        userName = request.getParameter("uname");
        session.setAttribute("USER_NAME",userName);
    }
%>
<html>
<head>
    <script src="auth.js"></script>
</head>
<body>
    <h2>Cuestionario verificado</h2>
    <%
    if (userId==null || userName==null) {
    %>
    <form action="." method="POST">
        <input name="uid" value="<%=userId%>"/>
        <input name="uname" value="<%=userName%>"/>
        <input type="submit"/>
    </form>
    <%
    } else {
    %>
    <div>[<%=userId%>] <%=userName%></div>
    <br/>
    <div>
        <button id="startButton" disabled="true">Empezar el test</button>
    </div>
    <%
    }
    %>
</body>
</html>
