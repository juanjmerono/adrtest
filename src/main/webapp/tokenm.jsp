<%@ page language="java" contentType="application/json; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.Date" %>
<%@ page import="java.util.Calendar" %>
<%@ page import="com.auth0.jwt.JWT" %>
<%@ page import="com.auth0.jwt.JWTVerifier" %>
<%@ page import="com.auth0.jwt.interfaces.DecodedJWT" %>
<%@ page import="com.auth0.jwt.algorithms.Algorithm" %>
<%
String token = "-";
try {
    Algorithm algorithm = Algorithm.HMAC256(System.getProperty("JWT_SECRET"));
    token = JWT.create()
        .withClaim("clientId",System.getProperty("JWT_CLIENT"))
        .withClaim("userId",(String)session.getAttribute("USER_ID"))
        .withClaim("idExterno1","id1")
        .withClaim("idExterno1","id2")
        .withClaim("idExterno1","id3")
        .withClaim("url","http://localhost:8080")
        .sign(algorithm);
} catch (Exception exception){
    //Invalid Signing configuration / Couldn't convert Claims.
}
%>
{ 
    "jwttoken": "<%=token%>"
}
