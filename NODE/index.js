const express = require("express");

const app = express();

app.use(express.json);

app.use(express.urlencoded({
    extended: true
}

));

const product = []; //an empty list to store the sent info



//POST API
app.post("/addProduct",(req,res)=>{

    let dat = req.body;

    console.log("Data from req:",req.body);

    const pdata={
        "id": product.length+1,
        "pname": dat.pname,
        "pprice":dat.pprice,
        "pdesc": dat.pdesc
    };
    
    product.push(pdata);
    console.log("===========================");
    console.log("Final Product list:");
    console.log(product);

    res.status(200).send({
        "Status_code":200,
        "message":"Product added successfully",
        "New Product:": pdata
    });
});


app.get("/add",(req,res)=>{
    res.send({
        msg:"first msg sent"
    })
})


app.listen(4000, ()=>{

    console.log("Port connected to server.")
});