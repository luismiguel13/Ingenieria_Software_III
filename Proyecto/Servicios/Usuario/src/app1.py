import mysql.connector
from flask import Flask, jsonify, request

app = Flask(__name__)

@app.route('/', methods=['GET'])
def usuarios():
    cnx = mysql.connector.connect(
        user=request.environ['MYSQL_USER'], 
        password=request.environ['MYSQL_PASSWORD'], 
        host=request.environ['MYSQL_HOST'], 
        database=request.environ['MYSQLDB'])
    
    cursor =cnx.cursor()

    sql = "SELECT nombre, apellido, codigo, email, celular FROM Usuario"
    cursor.execute(sql)
    datos = cursor.fetchall()
    usuarios = []
    for fila in datos:
        usuario={'nombre':fila[0], 'apellido':fila[1], 'codigo':fila[2], 'email':fila[3]}
        usuarios.append(usuario)
    return jsonify({'usuarios':usuarios})

if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0')

