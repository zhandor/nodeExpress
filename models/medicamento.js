import Connection from "./connection.js";
import Sequelize from "sequelize";
import DataTypes from "sequelize";
import { Laboratorio } from "./laboratorio.js";
import { Forma } from "./forma.js";

const Medicamento = Connection.define('medicamento',  {
    id: {
        type: DataTypes.INTEGER,
        primaryKey: true,
        autoIncrement: true
    },
    nome_comercial: {
        type: DataTypes.STRING,
        allowNull: false
    },
    principio_ativo: {
        type: DataTypes.INTEGER,
        allowNull: false
    },
    composicao: {
        type: DataTypes.STRING,
        allowNull: false
    },
    // laboratorio: {
    //     type: DataTypes.INTEGER,
    //     allowNull: false,
    //     references: {
    //         model: 'laboratorio',
    //         key: 'id'
    //     }
    // },
    // forma: {
    //     type: DataTypes.INTEGER,
    //     allowNull: false
    // },
    generico: {
        type: DataTypes.BOOLEAN,
        allowNull: false
    }
},{
    freezeTableName: true,
    timestamps: false
});

Medicamento.belongsTo(
    Laboratorio,
    { 
    foreignKey: { name: 'laboratorio' },
    as: 'lab', // Appropriate name
    },
);

Medicamento.belongsTo(
    Forma,
    { 
    foreignKey: { name: 'forma' },
    as: 'frm', // Appropriate name
    },
);

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
    Medicamento.findAll({
        include: [
           { model: Laboratorio, as: "lab", required: true}, 
           { model: Forma, as: "frm", required: true}, 
        ]
      }).then((result)=>{
        console.log("Foi, result: ",result);
        res.send(result);
    }, (result)=>{
        console.log("Não foi, result", result);
    });
}

function findAllByNome(req, res){
    Medicamento.findAll({
        include: [
           { model: Laboratorio, as: "lab", required: true}, 
           { model: Forma, as: "frm", required: true}, 
        ],
        where: {
            nome_comercial: {[Sequelize.Op.substring]: req.params.nome}
        }
      }).then((result)=>{
        console.log("Foi, result: ",result);
        res.send(result);
    }, (result)=>{
        console.log("Não foi, result", result);
    });
}

function findAllByPrincipio(req, res){
    Medicamento.findAll({
        include: [
           { model: Laboratorio, as: "lab", required: true}, 
           { model: Forma, as: "frm", required: true}, 
        ],
        where: {
            composicao: {[Sequelize.Op.substring]: req.params.nome}
        }
      }).then((result)=>{
        console.log("Foi, result: ",result);
        res.send(result);
    }, (result)=>{
        console.log("Não foi, result", result);
    });
}

export {findAll, syncTable, findAllByNome, findAllByPrincipio};
