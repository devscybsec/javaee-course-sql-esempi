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
  	<form action="./insert" method="post"> 
        <p>Nome:</p>  
        <!-- Create an element with mandatory name attribute, 
        so that data can be transfer to the servlet using getParameter() -->
        <input type="text" name="nome"/> 
        <br/> 
        <p>Cognome:</p>  
        <input type="text" name="cognome"/> 
        <p>Settore:</p>  
        
        <input type="text" name="settore"/> 
        <br/><br/><br/> 
        <input type="submit"/> 
    </form>
    
  <h2>Results</h2>

<c:forEach var="row" items="${rs.rows}">
    Nome: ${row.nome} <br/>
    Cognome: ${row.cognome}<br/>
    Settore: ${row.settore}<br/>
    <br/>
</c:forEach>

  </body>
</html>