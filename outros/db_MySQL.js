import MySQL from "mysql";

const connection = MySQL.createConnection({
    host: "localhost",
    user: "root",
    password: "",
    database: "PharmaLocal"
});

const exeQuery = (sql, res) => {
    // connection.connect((error) => {
    //     if(error) throw error;
    //     console.log("Connection Success!");
    // });
    console.log("sql: " + sql);
    // var queryResult = 
    connection.query(sql, (error, result, fields) => {
        if(error) {
            connection.end();
            console.log('Connection ended due to an error!');
            throw error;
        }
        result = JSON.stringify(result);
        console.log('stringified result: '+result);
        // connection.end();
        // console.log('Connection ended!');
        res.send(JSON.parse(result));
        // return result;
    });
    
    // return queryResult;
};

export default exeQuery;
