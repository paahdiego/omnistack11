import React, { useState, useEffect } from "react";
import { Link, useHistory } from "react-router-dom";
import { FiPower, FiTrash2 } from "react-icons/fi";

import api from "../../services/api";

import "./style.css";

import logoImage from "../../assets/logo.svg";

export default function Profile() {
  const ongId = localStorage.getItem("ongId");
  const ongName = localStorage.getItem("ongName");
  const [cases, setCases] = useState([]);

  const history = useHistory();

  useEffect(() => {
    api
      .get("profile", {
        headers: {
          authorization: ongId,
        },
      })
      .then((response) => {
        setCases(response.data);
      });
  }, [ongId]);

  async function handleDeleteCase(id) {
    try {
      await api.delete(`case/${id}`, {
        headers: { authorization: ongId },
      });
      alert(`caso ${id} deletado`);
      setCases(cases.filter((caso) => caso.id !== id));
    } catch (error) {
      alert("erro ao deletar caso!");
    }
  }

  function handleLogout() {
    localStorage.clear();
    history.push("/");
  }

  return (
    <div className="profile-container">
      <header>
        <img alt="Be the Hero" src={logoImage} />
        <span>Bem vinda, {ongName}</span>
        <Link className="button" to="/cases/new">
          Cadastrar novo caso
        </Link>
        <button type="button" onClick={handleLogout}>
          <FiPower size="18" color="#E02041" />
        </button>
      </header>
      <h1>Casos Cadastrados</h1>
      <ul>
        {cases.map((caso) => (
          <li key={caso.id}>
            <strong>CASO:</strong>
            <p>{caso.title}</p>
            <strong>DESCRIÇÃO:</strong>
            <p>{caso.description}</p>
            <strong>VALOR:</strong>
            <p>
              {Intl.NumberFormat("pt-BR", {
                style: "currency",
                currency: "BRL",
              }).format(caso.value)}
            </p>
            <button type="button" onClick={() => handleDeleteCase(caso.id)}>
              <FiTrash2 size="20" color="#a8a8b3" />
            </button>
          </li>
        ))}
      </ul>
    </div>
  );
}
