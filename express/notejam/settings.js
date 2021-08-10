require('dotenv').config();

const dbHost = process.env.DB_HOST
const dbUsername = process.env.DB_USERNAME
const dbPassword = process.env.DB_PASSWORD
const dbName = process.env.DB_NAME;

const dsn = {
  host:     dbHost,
  user: dbUsername,
  password: dbPassword,
  database: dbName,
  protocol: 'mysql',
  port:     '3306',
  query:    {pool: true}
};



module.exports.dsn = dsn;


