	function filterTable(term, tableName, cellNr) {
		var suche = term.value.toLowerCase();
		var table = document.getElementById(tableName);
		var ele;
		for (var r = 1; r < table.rows.length; r++){
			ele = table.rows[r].cells[cellNr].innerHTML.replace(/<[^>]+>/g,"");
			if (ele.toLowerCase().indexOf(suche)>=0 )
				table.rows[r].style.display = '';
			else table.rows[r].style.display = 'none';
		}
	}
