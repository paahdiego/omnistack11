import axios from "axios";

const api_url = "http://localhost:3333";

const api = axios.create({
  baseURL: api_url,
});

export default api;
