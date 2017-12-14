const express = require('express');
const app = express();

app.use((req, res, next)=>{
	req.body = req.body !== undefined ? JSON.parse(req.body) : req.body;
	req.query = req.query !== undefined ? JSON.parse(req.query) : req.query;
	next();
});

app.get('/', (req, res) => {
	res.send( 'Hello World!' );
});

app.get('/json', (req, res) => { 
	res.send( JSON.stringify(req.query) );
});

app.listen(3000, () => console.log('Example app listening on port 3000!'));