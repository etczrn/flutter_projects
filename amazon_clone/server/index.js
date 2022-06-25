// Import from packages
const express = require("express");
const mongoose = require("mongoose");

require("dotenv").config();

// import from other files
const authRouter = require("./router/auth");

// Init
const PORT = 3000;
const app = express();
const DB = `mongodb+srv://${process.env.DB_NAME}:${process.env.DB_PASS}@cluster0.z1asple.mongodb.net/?retryWrites=true&w=majority`;

// Middleware
app.use(express.json()); // for parsing application/json
app.use(authRouter);

// Connections
mongoose
  .connect(DB)
  .then(() => {
    console.log("Connection successful");
  })
  .catch((err) => {
    console.log(err);
  });

app.listen(PORT, "0.0.0.0", () => {
  console.log(`connected at port ${PORT}`);
});
