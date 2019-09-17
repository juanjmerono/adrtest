<%@ page language="java" contentType="application/json; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.Date" %>
<%@ page import="java.util.Calendar" %>
<%@ page import="com.auth0.jwt.JWT" %>
<%@ page import="com.auth0.jwt.JWTVerifier" %>
<%@ page import="com.auth0.jwt.interfaces.DecodedJWT" %>
<%@ page import="com.auth0.jwt.algorithms.Algorithm" %>
<%
if (request.getParameter("jwt")!=null) {
    try {
        Algorithm algorithm = Algorithm.HMAC256(System.getProperty("JWT_SECRET"));
        JWTVerifier verifier = JWT.require(algorithm)
            .build(); //Reusable verifier instance
        DecodedJWT jwt = verifier.verify(request.getParameter("jwt"));
        %>
        {
            "ts": "<%=jwt.getClaim("ts").asDate()%>",
            "userId": "<%=jwt.getClaim("userId").asString()%>",
            "result": "<%=jwt.getClaim("result").asString()%>",
            "percent": "<%=jwt.getClaim("porcentaje").asString()%>",
            "id": "<%=jwt.getClaim("id").asString()%>"
        }
        <%
    } catch (Exception exception){
        //Invalid signature/claims
        %>
        { "error": "<%=exception.getMessage()%>" }
        <%
    }
} else {
    String token = "-";
    try {
        Calendar calendar = Calendar.getInstance();
        calendar.setTimeInMillis((new Date()).getTime());
        calendar.add(Calendar.MINUTE, 15);	
        Algorithm algorithm = Algorithm.HMAC256(System.getProperty("JWT_SECRET"));
        token = JWT.create()
            .withClaim("clientId",System.getProperty("JWT_CLIENT"))
            .withClaim("userId",(String)session.getAttribute("USER_ID"))
            .withClaim("ts",calendar.getTime())
            .withClaim("returnTo","http://localhost:8080/adrtest/back.jsp")
            .withClaim("userName",(String)session.getAttribute("USER_NAME"))
            .withClaim("mandatory",1)
            .withClaim("idExterno1","id1")
            .withClaim("idExterno1","id2")
            .withClaim("idExterno1","id3")
            .withClaim("disableProfileCreation",0)
            .withClaim("skipInfoPage",0)
            .sign(algorithm);
    } catch (Exception exception){
        //Invalid Signing configuration / Couldn't convert Claims.
    }
    %>
    { 
        "jwttoken": "<%=token%>"
    }
<%
}
%>