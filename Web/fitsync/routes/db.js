const express = require("express");
const router = express.Router();

let passwords;
if (!process.env.DB_PASS) {
  passwords = require("../keys/passwords.json");
}

const fs = require("fs");
const { Pool } = require("pg");

const pool = new Pool({
  user: "bilal",
  password: process.env.DB_PASS || passwords["DB_PASS"],
  host: "free-tier.gcp-us-central1.cockroachlabs.cloud",
  database: "defaultdb",
  port: 26257,
  ssl: {
    ca: process.env.DB_CERT || passwords["DB_CERT"],
  },
});

router.get("/", (req, res, next) => {
  res.send("respond with a resource");
});

router.get("/users", (req, res, next) => {});

module.exports = router;
