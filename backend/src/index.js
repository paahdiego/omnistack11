const express = require('express'); //lidar com rotas
const routes = require('./routes');
const cors = require('cors');

const app = express();

app.use(cors()); // permissoes de acesso
app.use(express.json());
app.use(routes);

app.listen(3333);

