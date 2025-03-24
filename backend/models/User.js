const db = require('../config/database');

class User {
  static async create(email, hashedPassword, role) {
    try {
      const [result] = await db.execute(
        'INSERT INTO users (email, password, role) VALUES (?, ?, ?)',
        [email, hashedPassword, role]
      );
      return result.insertId;
    } catch (error) {
      throw error;
    }
  }

  static async findByEmail(email) {
    try {
      const [users] = await db.execute(
        'SELECT * FROM users WHERE email = ?',
        [email]
      );
      return users[0];
    } catch (error) {
      throw error;
    }
  }
}

module.exports = User; 