<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
<head>
<title>Corporate</title>
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
	<h2>Benvenuto in Corporate!</h2>
	<p>Scegli la tabella da visualizzare:</p>
	<div class="incol">
		<button class="btn-classic" onclick="window.location.href='./dipendenti.jsp'">Dipendenti</button>
		<button class="btn-classic" onclick="window.location.href='./responsabili.jsp'">Responsabili</button>
		<button class="btn-classic" onclick="window.location.href='./ruoli.jsp'">Ruoli</button>
		<button class="btn-classic" onclick="window.location.href='./uffici.jsp'">Uffici</button>
	</div>
</body>
</html>