const express = require('express');
const app = express();

app.use((req, res, next)=>{
	req.body = req.body !== undefined ? JSON.parse(req.body) : req.body;
	next();
});

const jsonEndPoint = function(req, res, next){
	let data = req.body !== undefined ? req.body : req.query;

	res.send( JSON.stringify(req.query) );
}

const rootEndPoint = function(req, res, next){
	res.send( 'Hello World!' );
}

app.get('/', rootEndPoint);
app.post('/json', jsonEndPoint);
app.get ('/json', jsonEndPoint);

app.listen(3000, () => console.log('Listening on port 3000!'));