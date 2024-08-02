const mysql = require('mysql2/promise');
const { connect } = require('../routes/todo');
// const path = require('path');
// const { sql } = require('@garafu/mysql-fileloader')(
//   { root: path.join(__dirname, './sql') }
// );

class MySqlClient {
  _config = null;
  _pool = null;

  constructor() {
    this._config = {
      host: process.env.MYSQL_HOST || 'localhost',
      user: process.env.MYSQL_USER || 'root',
      password: process.env.MYSQL_PASSWORD || 'root',
      database: process.env.MYSQL_DATABASE || 'todo',
      connectionLimit: 10,
      namedPlaceholders: true
    };

    this._pool = mysql.createPool(this._config);
  }

  async executeQuery(query, parameters) {
    // const con = await mysql.createConnection(this.#config);
    // const [rows, fields] = await con.query(sql(name), parameters);
    // con.end();
    // return rows;
    const [rows] = await this._pool.query(query, parameters);
    return rows;
  }
}

module.exports = { MySqlClient };