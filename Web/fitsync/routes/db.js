const express = require("express");
const router = express.Router();

const fs = require("fs");
const { Pool } = require("pg");

const pool = new Pool({
  user: "bilal",
  password: fs.readFileSync(__dirname + "/../keys/db_pass.txt").toString(),
  host: "free-tier.gcp-us-central1.cockroachlabs.cloud",
  database: "defaultdb",
  port: 26257,
  ssl: {
    ca: fs.readFileSync(__dirname + "/../keys/cc-ca.crt").toString(),
  },
});

router.get("/", (req, res, next) => {
  res.send("respond with a resource");
});

router.get("/users", (req, res, next) => {});

module.exports = router;
