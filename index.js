import Express from "express";

import {findAll, findAllByNome, findAllByPrincipio} from "./models/medicamento.js";

const app = Express();
const port = 3000;

app.get("/medicamentos/todos/", (req, res) => {
    findAll(req,res);
})

app.get("/medicamentos/nome/:nome", (req, res) => {
    findAllByNome(req,res);
})

app.get("/medicamentos/principio/:nome", (req, res) => {
    findAllByPrincipio(req,res);
})


app.listen(port, () => {
    console.log("Server is up and running");
});