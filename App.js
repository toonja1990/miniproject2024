const express = require("express");
const bodyParser = require("body-parser");
const cors = require('cors');
const app = express();
app.set('view engine', 'ejs');
// Middleware - บอกวิธีการที่ client ส่งข้อมูลผ่าน middleware
app.use(bodyParser.urlencoded({extended:false})) // ส่งผ่าน Form
app.use(bodyParser.json()) // ส่งด้วย Data JSON
app.use(express.static("public"))
const corsOptions = {
    origin: 'http://localhost:3000',
    credentials: true,
  };
app.use(cors(corsOptions));
app.use(function(req, res, next) {
    res.setHeader('Access-Control-Allow-Origin', '*'); //หรือใส่แค่เฉพาะ domain ที่ต้องการได้
    res.setHeader('Access-Control-Allow-Methods', 'GET, POST, PUT, DELETE');
    res.setHeader('Access-Control-Allow-Headers', 'Content-Type');
    res.setHeader('Access-Control-Allow-Credentials', true);
    next();
});
const mysql = require("mysql2/promise");
const dbConn = mysql.createConnection({
    host: 'localhost',
    user: 'root', // <== ระบุให้ถูกต้อง
    password: '',  // <== ระบุให้ถูกต้อง
    database: 'student_database',
    port: 3306  // <== ใส่ port ให้ถูกต้อง (default 3306, MAMP ใช้ 8889)
});

//  GET students

app.get('/students', async (req,res) => {
    console.log(req.query);
    const id = req.query.id;
    console.log(id);
    const connection = await dbConn
    const rows = await connection.query('SELECT * from students')
   // res.send(rows)
   //console.log(JSON.stringify(rows));
   console.log(rows[0]);
    res.render("list", {row:rows[0]});
})

app.get('/students2', async (req,res) => {
    console.log("req.query");
    console.log(req.query);
    const id = req.query.id;
    console.log(id);
    const connection = await dbConn
    const rows = await connection.query('SELECT * from students where id ='+id)
    console.log("req.query");
    console.log(rows);
    res.send(rows)
})

// GET students/:id 
app.get('/students/:id', async (req,res)=>{
    const connection = await dbConn
    const rows = await connection.query('SELECT * from students where id = ' +req.params.id)

    console.log(rows);
    res.send(rows)
})



// เมื่อ Delete แล้วควรส่ง status แจ้งให้ผู้ใช้ทราบด้วย เช่น code 204
// localhost:3000/students/2
app.delete('/students', async (req,res)=>{
    console.log("delete"+req.query.delete_id);
    const connection = await dbConn
    await connection.query('Delete from students where id = ' +req.params.id)
    //res.status(204).send("Deleted id " + req.params.id + " successful" )

    res.redirect("/students");
})



// ทำ POST /students สำหรับข้อมูล student 1 คน
// JSON Body-Parser 
/*
{
    "name":"Oak",
    "age":"22",
    "phone":555,
    "email":"oak@email.com"
}
*/
app.post("/students", async (req, res) => {
    // ส่งข้อมูลผ่าน body-parser (Middleware)
    const name = req.body.name;
    const age = req.body.age;
    const phone = req.body.phone;
    const email = req.body.email;

    const connection = await dbConn
    const rows = await connection.query("insert into students (name,age,phone,email) values('"+name+"','"+age+"',"+phone+",'"+email+"')")
   // res.status(201).send(rows)
    res.redirect("/students");
})

app.post("/contact", async (req, res) => {
    // ส่งข้อมูลผ่าน body-parser (Middleware)
    console.log("go contact");
    const name = req.body.name;
    const subject = req.body.subject;
    const message = req.body.message;
    const email = req.body.email;
   
    const connection = await dbConn
    const rows = await connection.query("insert into contact (name,subject,message,email) values('"+name+"','"+subject+"','"+message+"','"+email+"')")
    //res.status(201).send('Status: Created')
    //res.sendStatus(200)
    res.redirect("http://localhost:3006/");
   
    
})

app.post("/subscribe", async (req, res) => {
    // ส่งข้อมูลผ่าน body-parser (Middleware)
    console.log("go subscribe");
    const email = req.body.email;
    console.log(req.body.email);
    const connection = await dbConn
    const rows = await connection.query("insert into subscribe (email) values('"+email+"')")
    //res.status(201).send('Status: Created')
    //res.sendStatus(200)
    res.redirect("http://localhost:3006/");
})

app.put("/students/:id", async (req, res) => {
    // รับ id จาก params
    const id = req.params.id;
    // ส่งข้อมูลผ่าน body-parser (Middleware)
    const name = req.body.name;
    const age = req.body.age;
    const phone = req.body.phone;
    const email = req.body.email;

    const connection = await dbConn
    const rows = await connection.query("Update students set name = '"+name+"', age = '"+age+"', phone = "+phone+", email = '"+email+"' where id = "+id+" ")
    res.status(201).send(rows)
})



app.get("/query-1", async (req, res) => {
    const connection = await dbConn
    const rows = await connection.query('SELECT * from students')
    res.send(rows);
})

app.get("/query-2", async (req, res) => {
    const connection = await dbConn
    const rows = await connection.query('SELECT * from students')
    res.send(rows);
})

app.listen(3000, () => {
    console.log("Server is running at port 3000")
})