from flask import Flask, jsonify, request
from flask_mysqldb import MySQL


app=Flask(__name__)

app.config['MYSQL_DATABASE_HOST'] = 'localhost'
app.config['MYSQL_DATABASE_PORT'] = 3306
app.config['MYSQL_DATABASE_USER'] = 'luis' #depende del usuario que asignaron en heidiSQL
app.config['MYSQL_DATABASE_PASSWORD'] = '1234' #depende de la contraseña que asignaron en heidiSQL
app.config['MYSQL_DATABASE_DB'] = ''

@app.route('/')
def index():
    return "hola..."

if __name__ == '__main__':
    app.run(debug=True)
