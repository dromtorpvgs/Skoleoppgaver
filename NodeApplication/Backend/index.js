const express = require('express')
var mysql = require('mysql');
const app = express()
const port = 3000
var cors = require('cors')

app.use(cors());

var connection = mysql.createConnection({
  host: 'localhost',
  port: 8889,
  user: 'root',
  password: 'root',
  database: 'NodeStart'
});

connection.connect( function(error) {
  if (error) {
    console.error('error connecting: ' + error.stack);
    return;
  }
  console.log('connected as id'+connection.threadId);
});

app.get('/', (req, res) => {

  connection.query('SELECT * FROM elev', function (error, results, fields) {
    if (error) throw error;
    console.log('The solution is: ', results);
    res.send(results);
    connection.end();
  });




})



app.listen(port, () => {
  console.log(`Example app listening at http://localhost:${port}`)
})
