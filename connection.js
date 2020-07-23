import Sequelize from "sequelize";

const connection = new Sequelize("PharmaLocal", "root", null, {
    host: 'localhost',
    dialect: 'mysql'
});

export default connection;