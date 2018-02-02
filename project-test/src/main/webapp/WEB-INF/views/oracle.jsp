<%@ page import="java.sql.*" contentType="text/html;charset=euc-kr"%>
<%
String DB_URL = "jdbc:oracle:thin:@127.0.0.1:1521:xe";
String DB_USER = "lotte";
String DB_PASSWORD= "team";

Connection conn;
Statement stmt;

try {
Class.forName("oracle.jdbc.driver.OracleDriver");

conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);

stmt = conn.createStatement();

conn.close();

out.println("oracle jdbc test: connect ok!!");
} catch(Exception e)
{out.println(e.getMessage());}
%>