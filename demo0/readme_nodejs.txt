node server.js
npm init -y
npm i express
npx nodemon server.js


#Example
const express = require("express");
const app = express();
app.use(express.json());

// curl localhost:3000
app.get("/", (req, res)=>{
  res.send("I am root");
});

// curl "localhost:3000/getProfile?username=admin"
app.get("/getProfile", (req, res)=>{
  res.json(req.query);
});

// curl "localhost:3000/register"
// curl -X POST "localhost:3000/register"  -H 'Content-Type: application/json'  -d '{"username":"admin","password":"1234"}'

app.post("/register", (req, res)=>{
  res.json(req.body);
});


app.listen(3000,()=>console.log("Server is ready"));