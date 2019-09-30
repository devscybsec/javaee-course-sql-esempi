<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<sql:query var="rs" dataSource="jdbc/azienda">
select * from impiegati
</sql:query>

<html>
<head>
<title>Datasource Insert/Delete</title>
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
</head>
<body>
	<h2>Inserimento</h2>
	<form class="incol" action="./insert" method="post">
		<div class="inline">
			<label for="nome">Nome: </label><input type="text" name="nome" />
		</div>
		<div class="inline">
			<label for="cognome">Cognome: </label><input type="text" name="cognome" />
		</div>
		<div class="inline">
		<label for="settore">Settore: </label><input type="text" name="settore" />
		</div>
		<div class="inline">
			<input type="submit" value="Inserisci"/>
		</div>
	</form>

	<h2>Risultati</h2>

	<table>
		<tbody>
		<tr><th>ID</th><th>Nome</th><th>Cognome</th><th>Settore</th><th>Comandi</th></tr>
		<c:forEach var="row" items="${rs.rows}">
			<tr><td>${row.id}</td>
		    <td>${row.nome}</td>
		    <td>${row.cognome}</td>
		    <td>${row.settore}</td>
			<td>
			<div class="inline">
				<form action="./update">
					<input type="hidden" value="${row.id}" name="id" /> <input
						type="submit" value="Update" />
				</form>
				<form action="./delete" method="post">
					<input type="hidden" value="${row.id}" name="id" /> <input
						type="submit" value="Delete" />
				</form>
			</div>
			</td>
			</tr>
		</c:forEach>
	</table>

</body>
</html>