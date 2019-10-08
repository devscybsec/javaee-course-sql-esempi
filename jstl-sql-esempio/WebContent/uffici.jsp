<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<sql:query var="rs" dataSource="jdbc/corporate">
	select id, nome, concat(dimensioni,' mq') dimensioni from uffici
</sql:query>

<html>
<head>
<title>Uffici</title>
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
	<h2>Uffici</h2>
	<table>
		<tbody>
		<tr>
			<th>ID</th>
			<th>Nome</th>
			<th>Dimensioni</th>
		</tr>
		<c:forEach var="row" items="${rs.rows}">
			<tr>
				<td>${row.id}</td>
			    <td>${row.nome}</td>
			    <td>${row.dimensioni}</td>
			</tr>
		</c:forEach>
	</table>
	<button onclick="window.history.back()">Indietro</button>
</body>
</html>