<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<sql:query var="rs" dataSource="jdbc/corporate">
	select d.id, d.nome, d.cognome, 
		   concat(r.nome,'') ruolo, 
		   concat(u.nome,'') ufficio
	from dipendenti d 
	join ruoli r on d.ruolo = r.id
	join uffici u on d.ufficio = u.id
	where d.id IN (select responsabile 
				   from dipendenti
				   where responsabile is not null)
</sql:query>

<html>
<head>
<title>Responsabili</title>
<style>
	table {
		border-spacing: 0;
	}
	td, th {
		padding: 4px;
		border: 1px solid black;
	}
	.inline {
		display: flex;
		padding: 4px;
	}
	.inline > label {
		width: 120px;
	}
	.incol {
		display: flex;
		flex-direction: column;
	}
	.btn-classic {
		width: 200px;	
	}
	button {
		cursor: pointer;
	}
</style>
</head>
<body>
	<h2>Responsabili</h2>
	<table>
		<tbody>
		<tr>
			<th>ID</th>
			<th>Nome</th>
			<th>Cognome</th>
			<th>Ruolo</th>
			<th>Ufficio</th>
		</tr>
		<c:forEach var="row" items="${rs.rows}">
			<tr><td>${row.id}</td>
		    <td>${row.nome}</td>
		    <td>${row.cognome}</td>
		    <td>${row.ruolo}</td>
		    <td>${row.ufficio}</td>
			</tr>
		</c:forEach>
	</table>
	<button onclick="window.history.back()">Indietro</button>
</body>
</html>