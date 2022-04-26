(function() {
var express    = require("express");
var mysql      = require('mysql');
var connection = mysql.createConnection({
  host     : '10.56.103.15',
  user     : 'swypto',
  password : 'dVr9BfrGuuWnmmXi',
  database : 'swypto_production'
});
var app = express();

connection.connect(function(err){
if(!err) {
    console.log("Database is connected ... nn");
} else {
    console.log(err);
}
});

app.get("/check",function(req,res){
connection.query('select * from transactions where wallet_id="2224" AND amount > 0 order by id desc limit 2', function(err, rows, fields) {
connection.end();
  if (!err)
    console.log('The solution is: ', rows);
  else
    console.log('Error while performing Query.');
  });
});
}).call(this);
