from flask import Flask, render_template
import mysql.connector
from config import DB_CONFIG, SECRET_KEY

app = Flask(__name__)
app.secret_key = SECRET_KEY

def get_db_connection():
    return mysql.connector.connect(**DB_CONFIG)

@app.route('/')
def index():
    db = get_db_connection()
    cursor = db.cursor(dictionary=True)
    cursor.execute("SELECT * FROM Campaigns WHERE status='active'")
    campaigns = cursor.fetchall()
    cursor.close()
    db.close()
    return render_template('index.html', campaigns=campaigns)

if __name__ == '__main__':
    app.run(debug=True)
