<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<sql:query var="rs" dataSource="jdbc/azienda">
	select * from impiegati where id = ?
	<sql:param value = "${param.id}" />
</sql:query>

<html>
  <head>
    <title>Datasource Update</title>
  </head>
  <style>
	table {
		border-spacing: 0;
	}
	td, th {
		padding: 2px;
		border: 1px solid black;
	}
	.inline {
		display: flex;
	}
	.incol {
		display: flex;
		flex-direction: column;
	}
</style>
  <body>
  	<h2>Aggiornamento</h2>
	<c:forEach var="row" items="${rs.rows}">
	  	<form action="./update" method="post"> 
	        <input type="hidden" name="id" value="${row.id}"/>
	        <div class="inline">
				<label for="nome">Nome: </label><input type="text" name="nome" value="${row.nome}" />
			</div>
			<div class="inline">
				<label for="cognome">Cognome: </label><input type="text" name="cognome" value="${row.cognome}" />
			</div>
			<div class="inline">
			<label for="settore">Settore: </label><input type="text" name="settore" value="${row.settore}" />
			</div>
			<div class="inline">
				<input type="submit" value="Aggiorna"/>
			</div>
	    </form> 
	</c:forEach>
  </body>
</html>