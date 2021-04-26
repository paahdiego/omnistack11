const express = require('express');

const app = express();

app.get('/', (request, response) => {
    return response.json({
        evento: "Omni Stack 11.0",
        aluno: "Patrick",
    });
});

app.listen(3333);

