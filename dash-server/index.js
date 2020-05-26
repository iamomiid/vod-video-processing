const express = require('express');
const bodyParser = require('body-parser');
const http = require('http');

const config = {
	syb4lbaiTMWk3HCZVygFnA: 'YX2KElooTfSOPGsYZjSKPw',
};

const app = express();

app.use((req, res, next) => {
	// CORS
	res.header('Access-Control-Allow-Origin', '*');
	res.header('Access-Control-Allow-Headers', 'Origin, X-Requested-With, Content-Type, Accept');
	return next();
});

app.use(bodyParser.raw({ type: 'application/octet-stream' }));

app.post('/', (req, res) => {
	const { type, kids } = JSON.parse(req.body.toString());
	const output = { type, keys: [] };
	for (const key of kids) {
		if (Object.keys(config).includes(key)) {
			output.keys.push({ kid: key, k: config[key], kty: 'oct' });
		}
	}
	return res.send(output);
});

const server = http.createServer(app);

server.listen(1111, () => {
	console.log('Listening on 1111');
});
