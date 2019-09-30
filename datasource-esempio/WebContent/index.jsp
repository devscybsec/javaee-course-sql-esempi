<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<sql:query var="rs" dataSource="jdbc/azienda">
select * from impiegati
</sql:query>

<html>
  <head>
    <title>DataSource Test</title>
  </head>
  <body>
  	<h2>Inserimento</h2>
  	<form action="./insert" method="post"> 
        <p>Nome: <input type="text" name="nome"/> </p>
        <p>Cognome: <input type="text" name="cognome"/> </p>
        <p>Settore: <input type="text" name="settore"/></p>
        <br/>
        <input type="submit"/> 
    </form>
    
  <h2>Results</h2>

<c:forEach var="row" items="${rs.rows}">
	Id: ${row.id} <br/>
    Nome: ${row.nome} <br/>
    Cognome: ${row.cognome}<br/>
    Settore: ${row.settore}<br/>
    <form action="./update">
    	<input type="hidden" value="${row.id}" name="id"/>
    	<input type="button" value="Update"/>
    </form>
    <form action="./delete" method="post">
    	<input type="hidden" value="${row.id}" name="id"/>
    	<input type="submit" value="Delete"/>
    </form>
    <br/>
    <br/>
</c:forEach>

  </body>
</html>