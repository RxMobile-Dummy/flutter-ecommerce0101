//imports from packages
const express = require('express');
const mongoose = require('mongoose');
//imports from other files
const authRouter = require('./routes/auth');
//mongodb://localhost:27017
const DB = "mongodb://localhost:27017/amazon";
//const DB = "mongodb+srv://vivek:Radixweb8@cluster0.gqwisxb.mongodb.net/?retryWrites=true&w=majority";
//init
//port number 
const PORT = 3000;
const app = express();

//middleware
app.use(express.json());
app.use(authRouter);



//connections
mongoose.connect(DB).then(() => {
    console.log('connection successful');
}).catch((e) => {
    console.log(e);
});

//creating api
// 0.0.0.0 ip address is access from anywere 
//localhost is not working on android emulator.
app.listen(PORT, () => {
    console.log(`connected at port ${PORT}`);
});