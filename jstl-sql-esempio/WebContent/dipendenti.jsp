<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<sql:query var="rs" dataSource="jdbc/corporate">
	select d.id, d.nome, d.cognome, 
		   concat(r.nome,'') ruolo, 
		   concat(u.nome,'') ufficio, 
		   concat(resp.nome,'') nome_resp, concat(resp.cognome,'') cognome_resp, 
		   concat(uffresp.nome,'') uff_resp
	from dipendenti d 
	join ruoli r on d.ruolo = r.id
	join uffici u on d.ufficio = u.id
	left join dipendenti resp on d.responsabile = resp.id
	left join uffici uffresp on resp.ufficio = uffresp.id 
</sql:query>

<html>
<head>
<title>Dipendenti</title>
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
	<h2>Dipendenti</h2>
	<table>
		<tbody>
		<tr>
			<th>ID</th>
			<th>Nome</th>
			<th>Cognome</th>
			<th>Ruolo</th>
			<th>Ufficio</th>
			<th>Nome responsabile</th>
			<th>Cognome responsabile</th>
			<th>Ufficio responsabile</th>
		</tr>
		<c:forEach var="row" items="${rs.rows}">
			<tr>
				<td>${row.id}</td>
			    <td>${row.nome}</td>
			    <td>${row.cognome}</td>
			    <td>${row.ruolo}</td>
			    <td>${row.ufficio}</td>
			    <td>${row.nome_resp}</td>
			    <td>${row.cognome_resp}</td>
			    <td>${row.uff_resp}</td>
			</tr>
		</c:forEach>
	</table>
	<button onclick="window.history.back()">Indietro</button>
</body>
</html>