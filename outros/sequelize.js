import Sequelize from "sequelize";
import DataTypes from "sequelize";

const connection = new Sequelize("PharmaLocal", "root", null, {
    host: 'localhost',
    dialect: 'mysql'
});

// connection.authenticate()
// .then(() => {
//     console.log("it's alive, it's aliiiiive");
// })
// .catch((ex) => {
//     console.log("Oops");
//     console.log("Exception: " + ex);
// });

const Medicamento = connection.define('medicamento', {
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
    laboratorio: {
        type: DataTypes.INTEGER,
        allowNull: false
    },
    forma: {
        type: DataTypes.INTEGER,
        allowNull: false
    },
    generico: {
        type: DataTypes.BOOLEAN,
        allowNull: false
    }
},{
    freezeTableName: true,
    timestamps: false
});




// console.log("synching...");

// Medicamento.sync().then((result)=>{
//     console.log("synched");
//     console.log("Result: ",result);
// },(result)=>{
//     console.log("Not synched");
//     console.log("Result: ",result);
// });


Medicamento.findAll().then((result)=>{
    console.log("Foi, result: ",result);
}, (result)=>{
    console.log("Não foi, result", result);
});


    // try {
    //     async () => {
    //         const medicamentos = await Medicamento.findAll().then((result)=>{
    //             console.log("Foi, result: ",result);
    //         }, (result)=>{
    //             console.log("Não foi, result", result);
    //         });
            
    //         console.log("meds: ", medicamentos);

    //         if(medicamentos === null){
    //             console.log("banco vazio");
    //         }else{         
    //             // console.log(medicamentos.every(med => med instanceof Medicamento));
    //             console.log("todos os medicamentos cadastrados: ", medicamentos);   
    //         }
    //     }            
    // } catch (error) {
    //     console.log("deu ruim no findAll: ", error);
    // }    
