/*
 * Parse the data and create a graph with the data.
 */
function parseData(createGraph) {
	Papa.parse(window.location.protocol + '//' + window.location.hostname + (window.location.port ? ':' + window.location.port : '') + "OOTOMAST/csv/1-sample_questionnaire.csv", {
		complete: function(results)	{
			console.log(results);
		}
	});
}

function createGraph(data)	{
	
}

parseData(createGraph);