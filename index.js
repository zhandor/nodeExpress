import Express from "express";

import products from "./products.js";
import exeQuery from "./db_MySQL.js";
import {findAll} from "./medicamento.js";

const app = Express();
const port = 3000;

app.get("/products/:id", (req, res) => {
    //res.send("Hello world");
    // res.json(products);
    res.json(products.find((product)=>{
        return +req.params.id === product.id;
    }));
});

app.get("/", (req,res) => {
    var sql = 'SELECT med.id, med.nome_comercial, pa.descricao, lab.nome_fantasia, ff.descricao, if(med.generico, "Genérico", "Original") generico ' +
              'FROM medicamento med ' +  
              'INNER JOIN principio_ativo pa ON med.principio_ativo = pa.id ' +
              'INNER JOIN laboratorio lab ON med.laboratorio = lab.id ' +
              'INNER JOIN forma_farmaceutica ff ON med.forma = ff.id ' +
              'ORDER BY med.nome_comercial';
    exeQuery(sql, res);
});

app.get("/medicamento/:nome", (req,res) => {
    var sql = 'SELECT med.id, med.nome_comercial, pa.descricao, lab.nome_fantasia, ff.descricao, if(med.generico, "Genérico", "Original") generico ' +
              'FROM medicamento med ' +  
              'INNER JOIN principio_ativo pa ON med.principio_ativo = pa.id ' +
              'INNER JOIN laboratorio lab ON med.laboratorio = lab.id ' +
              'INNER JOIN forma_farmaceutica ff ON med.forma = ff.id ' +
              'WHERE med.nome_comercial LIKE "%' + req.params.nome + '%"' +
              'ORDER BY med.nome_comercial';
    exeQuery(sql, res);
});

app.get("/generico/:principio", (req,res) => {
    var sql = 'SELECT med.id, med.nome_comercial, pa.descricao, lab.nome_fantasia, ff.descricao, if(med.generico, "Genérico", "Original") generico ' +
              'FROM medicamento med ' +  
              'INNER JOIN principio_ativo pa ON med.principio_ativo = pa.id ' +
              'INNER JOIN laboratorio lab ON med.laboratorio = lab.id ' +
              'INNER JOIN forma_farmaceutica ff ON med.forma = ff.id ' +
              'WHERE pa.descricao LIKE "%' + req.params.principio + '%"' +
              'ORDER BY med.nome_comercial';
    exeQuery(sql, res);
});

app.get("/tabela/:tabela", (req,res) => {
    var sql = "SELECT * FROM " + req.params.tabela;
    // console.log('sql: ' + sql);
    var result = exeQuery(sql, res);
    // console.log('Query result GET: ' + result);
    
});

app.get("/sequelize/medicamentos/", (req, res) => {
    findAll(req,res);
})

app.listen(port, () => {
    console.log("Server is up and running");
});