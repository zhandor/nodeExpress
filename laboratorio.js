import Connection from "./connection.js";
import DataTypes from "sequelize";

const Laboratorio = Connection.define('laboratorio',  {
    id: {
        type: DataTypes.INTEGER,
        primaryKey: true,
        autoIncrement: true
    },
    nome_fantasia: {
        type: DataTypes.STRING,
        allowNull: false
    }
},{
    freezeTableName: true,
    timestamps: false
});

function syncTable(){
    Medicamento.sync().then((result)=>{
        console.log("synched");
        console.log("Result: ",result);
    },(result)=>{
        console.log("Not synched");
        console.log("Result: ",result);
    });
}

function findAll(req, res){
    Laboratorio.findAll().then((result)=>{
        console.log("Foi, result: ",result);
        res.send(result);
    }, (result)=>{
        console.log("Não foi, result", result);
    });
}

export {findAll, syncTable, Laboratorio};
