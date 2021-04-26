const express = require('express');

const session_controller = require('./controllers/session_controller');

const ong_controller = require('./controllers/ong_controller');
const case_controller = require('./controllers/case_controller');
const profile_controller = require('./controllers/profile_controller');

const routes = express.Router();

routes.post('/sessions', session_controller.create);

routes.get('/profile', profile_controller.list);

routes.get('/ongs', ong_controller.list);
routes.post('/ongs', ong_controller.create);

routes.get('/case', case_controller.list);
routes.post('/case', case_controller.create);
routes.delete('/case/:id', case_controller.delete);

module.exports = routes;

