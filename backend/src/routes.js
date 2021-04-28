const express = require("express");
const { celebrate, Segments, Joi } = require("celebrate");

const session_controller = require("./controllers/session_controller");
const ong_controller = require("./controllers/ong_controller");
const case_controller = require("./controllers/case_controller");
const profile_controller = require("./controllers/profile_controller");

const routes = express.Router();

routes.post("/sessions", session_controller.create);

routes.get(
  "/profile",
  celebrate({
    [Segments.HEADERS]: Joi.object({
      authorization: Joi.string().required(),
    }).unknown(),
  }),
  profile_controller.list
);

routes.get("/ongs", ong_controller.list);
routes.post(
  "/ongs",
  celebrate({
    [Segments.BODY]: Joi.object().keys({
      name: Joi.string().required(),
      email: Joi.string().required().email(),
      whatsapp: Joi.string().required().min(10).max(11),
      city: Joi.string().required(),
      uf: Joi.string().required().length(2),
    }),
  }),
  ong_controller.create
);

routes.get(
  "/case",
  celebrate({
    [Segments.QUERY]: Joi.object().keys({
      page: Joi.number().required(),
    }),
  }),
  case_controller.list
);
routes.post("/case", case_controller.create);

routes.delete(
  "/case/:id",
  celebrate({
    [Segments.PARAMS]: Joi.object().keys({
      id: Joi.number().required(),
    }),
  }),
  case_controller.delete
);

module.exports = routes;
