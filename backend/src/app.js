const express = require("express"); //lidar com rotas
const routes = require("./routes");
const cors = require("cors");
const { errors } = require("celebrate");

const app = express();

app.use(cors()); // permissoes de acesso
app.use(express.json());
app.use(routes);
app.use(errors());

module.exports = app;
