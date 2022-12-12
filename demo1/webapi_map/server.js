const express = require('express')
const app = express()
app.use(express.json())

var positions = []
app.get("/", (req, res)=>{
    res.json({count: positions.length, positions})
})

app.post("/submit_location", (req, res)=>{
    positions = [...positions, req.body]
    console.log(JSON.stringify(req.body))
    res.json({result: "ok", positions})
})

app.listen(1150,()=>{
    console.log("Server is running...")
});