import React, { useState } from "react";
import { FiLogIn } from "react-icons/fi";
import { Link, useHistory } from "react-router-dom";

import api from "../../services/api";
import "./style.css";

import heroesImage from "../../assets/heroes.png";
import logoImage from "../../assets/logo.svg";

export default function Logon() {
  const [id, setId] = useState("");
  const history = useHistory();

  async function handleLogin(e) {
    e.preventDefault();
    try {
      const response = await api.post("sessions", { id });
      console.log(response.data.name);
      localStorage.setItem("ongId", id);
      localStorage.setItem("ongName", response.data.name);
      history.push("/profile");
    } catch (error) {
      alert("falha no login");
    }
  }

  return (
    <div className="logon-container">
      <section className="form">
        <img src={logoImage} alt="Be The Hero" />
        <form onSubmit={handleLogin}>
          <h1>Faça seu logon</h1>
          <input
            placeholder="Sua ID"
            value={id}
            onChange={(e) => setId(e.target.value)}
          />
          <button className="button" type="submit">
            Entrar
          </button>
          <Link className="back-link" to="/register">
            <FiLogIn size="16" color="#E02041" />
            Não tenho cadastro
          </Link>
        </form>
      </section>
      <img src={heroesImage} alt="Heroes" />
    </div>
  );
}
