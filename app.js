var mysql = require("mysql");
var inquirer = require("inquirer");
const cTable = require('console.table');
var orm = require("./config/orm.js");

var connection = mysql.createConnection({
  host: "localhost",
  user: "root",
  password: "Mysqul20!",
  database: "employeedirectory"
});

connection.connect(function(err) {
  if (err) throw err;
  runSearch();
});
console.log("--------------------");
console.log("|  Employee Manager |");
console.log("--------------------");

function runSearch() {
  inquirer
    .prompt({
      name: "action",
      type: "rawlist",
      message: "What would you like to do?",
      choices: [
        "View All Employees",
        "View All Employees By Department",
        "View All Employees By Manager",
        "Add Employee",
        "Remove Employee",
        "Update Employee Role",
        "Update Employee Manager",
        "Exit"
      ]
    })
    .then(function(answer) {
      switch (answer.action) {
      case "View All Employees":
        employeeSearch();
        break;

      case "View All Employees By Department":
        deptSearch();
        break;

      case "View All Employees By Manager":
        managerSearch();
        break;

      case "Search for a specific song":
        songSearch();
        break;

      case "Find artists with a top song and top album in the same year":
        songAndAlbumSearch();
        break;
      }
    });
}

function employeeSearch() {
  connection.query("SELECT employees.manager_id, employees.first_name, employees.last_name, roles.title, roles.department, roles.salary, employees.manager_id   FROM employees LEFT JOIN roles ON employees.role_id = roles.role_id;", function(err, rows, fields) {
    if (err) throw err;

    console.table(rows);

    runSearch()
  });
} 

function deptSearch() {
  connection.query("SELECT roles.department, employees.first_name, employees.last_name, roles.title, roles.salary, employees.manager_id   FROM employees LEFT JOIN roles ON employees.role_id = roles.role_id ORDER BY roles.department;", function(err, rows, fields) {
    if (err) throw err;

    console.table(rows); 
    
    runSearch()
});
}

function managerSearch() {
  connection.query("SELECT employees.manager_id, employees.first_name, employees.last_name, roles.title, roles.department, roles.salary, employees.manager_id   FROM employees LEFT JOIN roles ON employees.role_id = roles.role_id ORDER BY employees.manager_id;", function(err, rows, fields) {
    if (err) throw err;  
    console.table(rows); 
    
    runSearch()
  });
};
//   inquirer
//     .prompt([
//       {
//         name: "start",
//         type: "input",
//         message: "Enter starting position: ",
//         validate: function(value) {
//           if (isNaN(value) === false) {
//             return true;
//           }
//           return false;
//         }
//       },
//       {
//         name: "end",
//         type: "input",
//         message: "Enter ending position: ",
//         validate: function(value) {
//           if (isNaN(value) === false) {
//             return true;
//           }
//           return false;
//         }
//       }
//     ])
//     .then(function(answer) {
//       var query = "SELECT position,song,artist,year FROM top5000 WHERE position BETWEEN ? AND ?";
//       connection.query(query, [answer.start, answer.end], function(err, res) {
//         for (var i = 0; i < res.length; i++) {
//           console.log(
//             "Position: " +
//               res[i].position +
//               " || Song: " +
//               res[i].song +
//               " || Artist: " +
//               res[i].artist +
//               " || Year: " +
//               res[i].year
//           );
//         }
//         runSearch();
//       });
//     });
// }

function songSearch() {
  inquirer
    .prompt({
      name: "song",
      type: "input",
      message: "What song would you like to look for?"
    })
    .then(function(answer) {
      console.log(answer.song);
      connection.query("SELECT * FROM top5000 WHERE ?", { song: answer.song }, function(err, res) {
        console.log(
          "Position: " +
            res[0].position +
            " || Song: " +
            res[0].song +
            " || Artist: " +
            res[0].artist +
            " || Year: " +
            res[0].year
        );
        runSearch();
      });
    });
}
function enterNew() {
  inquirer
    .prompt([
      {
        type: "confirm",
        name: "choice",
        message: "Continue?"
      }
    ])
    .then(val => {
      // If the user says yes to end, sort again, otherwise quit the directory
      if (val.choice) {
        init();
      } else {
        // this.quit();
        process.exit(1);
      }
    })
  };
function songAndAlbumSearch() {
  inquirer
    .prompt({
      name: "artist",
      type: "input",
      message: "What artist would you like to search for?"
    })
    .then(function(answer) {
      var query = "SELECT top_albums.year, top_albums.album, top_albums.position, top5000.song, top5000.artist ";
      query += "FROM top_albums INNER JOIN top5000 ON (top_albums.artist = top5000.artist AND top_albums.year ";
      query += "= top5000.year) WHERE (top_albums.artist = ? AND top5000.artist = ?) ORDER BY top_albums.year, top_albums.position";

      connection.query(query, [answer.artist, answer.artist], function(err, res) {
        console.log(res.length + " matches found!");
        for (var i = 0; i < res.length; i++) {
          console.log(
            i+1 + ".) " +
              "Year: " +
              res[i].year +
              " Album Position: " +
              res[i].position +
              " || Artist: " +
              res[i].artist +
              " || Song: " +
              res[i].song +
              " || Album: " +
              res[i].album
          );
        }

        runSearch();
      });
    });
  }

