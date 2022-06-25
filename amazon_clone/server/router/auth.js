const express = require("express");

const authRouter = express.Router();

authRouter.post("/api/signup", (req, res) => {
  // get the data from client
  const { name, email, password } = req.body;

  // validation

  // post that data in database

  // return that data to user
});

module.exports = authRouter;
